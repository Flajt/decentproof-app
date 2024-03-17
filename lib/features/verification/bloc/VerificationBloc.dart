import 'dart:io';
import 'dart:isolate';
import 'package:decentproof/features/verification/bloc/VerificationBlocEvents.dart';
import 'package:decentproof/features/verification/bloc/VerificationBlocStates.dart';
import 'package:decentproof/features/verification/interfaces/IFileSelectionService.dart';
import 'package:decentproof/features/verification/logic/ForegroundService/VerificationTaskHandler.dart';
import 'package:decentproof/features/verification/models/FileDataMode.dart';
import 'package:decentproof/features/verification/models/VerificationStatusModel.dart';
import 'package:decentproof/shared/foregroundService/IForegroundService.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:path_provider/path_provider.dart';

class VerificationBloc
    extends Bloc<VerificationBlocEvents, VerificationBlocStates> {
  final _getIt = GetIt.I;
  late final IFileSelectionService _fileSelectionService;
  late final IForegroundService _foregroundService;

  VerificationBloc() : super(InitialState()) {
    _fileSelectionService = _getIt.get<IFileSelectionService>();
    _foregroundService = _getIt.get<IForegroundService>();

    on<VerifyHashEvent>((event, emit) async {
      Directory tempFileStorage = await getTemporaryDirectory();
      try {
        tempFileStorage.createSync();
        emit(LoadingState());
        FileDataModel? fileDataModel =
            await _fileSelectionService.selectFileAsStream();
        if (fileDataModel != null) {
          File tempFile =
              File("${tempFileStorage.path}/${fileDataModel.fileName}");
          await copyFileToTemp(tempFile, fileDataModel);
          await _foregroundService.setData("filePath", tempFile.path);
          await _foregroundService.start(startVerificationForegroundService,
              "verificationNotification.title".tr(), "");
          final ReceivePort recivePort =
              await _foregroundService.getReceivePort();
          final stream = recivePort.asBroadcastStream();
          await emit.forEach(stream, onData: (data) {
            recivePort.close(); // Needed here, because the stream is still open
            if (data["status"] == "Error") {
              return ErrorState(data["message"]);
            } else if (data["status"] == "Done") {
              recivePort
                  .close(); // Needed here, because the stream is still open
              return VerifiedState(
                  VerificationStatusModel.fromJson(data["model"]));
            }
            return state;
          });
          if (state is VerifiedState || state is ErrorState) {
            await _foregroundService.stop();
            await tempFileStorage.delete(recursive: true);
            if (state is ErrorState) {
              emit(InitialState());
            }
          }
        } else {
          emit(InitialState());
        }
      } catch (e, stackTrace) {
        await tempFileStorage.delete(recursive: true);
        await _foregroundService.stop();
        addError(e, stackTrace);
        emit(ErrorState(e.toString()));
        emit(InitialState());
      }
    });
    on<ResetEvent>((event, emit) => emit(InitialState()));
  }
  Future<void> copyFileToTemp(
      File tempFile, FileDataModel fileDataModel) async {
    final sink = tempFile.openWrite();
    await sink.addStream(fileDataModel.byteStream);
    await sink.flush();
    await sink.close();
  }
}
