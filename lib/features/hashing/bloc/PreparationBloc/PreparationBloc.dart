import 'dart:io';
import 'dart:isolate';

import 'package:decentproof/features/hashing/bloc/PreparationBloc/PerparationEvents.dart';
import 'package:decentproof/features/hashing/bloc/PreparationBloc/PerparationStates.dart';
import 'package:decentproof/features/hashing/interfaces/IFileSavingService.dart';
import 'package:decentproof/features/hashing/logic/foregroundService/PerperationTaskHandler.dart';
import 'package:decentproof/shared/foregroundService/IForegroundService.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

/// Deals with Hashing, Watermarking and adding MetaData to the file
/// Because this BLOC is used to prepare different types of files it's named PreparationBloc
/// TODO: Refactor the code to make it more readable,there is a lot of duplication going on
class PreparationBloc extends Bloc<MetaDataEvents, PreparationState> {
  late final GetIt getIt;
  late final IFileSavingService videoSavingService;
  late final IFileSavingService imageSavingService;
  late final IForegroundService foregroundService;

  PreparationBloc() : super(InitalPrepareBlocState()) {
    getIt = GetIt.I;
    videoSavingService =
        getIt.get<IFileSavingService>(instanceName: "VideoSaving");
    imageSavingService =
        getIt.get<IFileSavingService>(instanceName: "ImageSaving");
    foregroundService = getIt<IForegroundService>();

    on<PrepareAudio>((event, emit) async {
      final transaction = Sentry.startTransaction("PreparationBloc",
          "PrepareAudio"); // Consider moving it into Foreground Service
      try {
        await foregroundService.stop();
        ReceivePort port = ReceivePort();
        SendPort sendPort = port.sendPort;
        foregroundService.registerOnReciveData(sendPort.send);
        await foregroundService.setData(
            "instructions", "audio::${event.filePath}");
        await foregroundService.start(
            startPreperationForegroundService,
            tr("perperationNotification.title"),
            tr("perperationNotification.initalDescription"));
        final stream = port.asBroadcastStream();
        await emit.forEach(stream, onData: (message) {
          return _statusHandler(message, port, emit, transaction);
        });
        if (state is PreparationIsSuccessfull) {
          await foregroundService.stop();
        }
      } catch (e, stackTrace) {
        transaction.throwable = e;
        transaction.status = const SpanStatus.internalError();
        addError(e, stackTrace);
        await foregroundService.stop();
        emit(PreparationHasError(e.toString()));
      } finally {
        await transaction.finish();
      }
    });
    on<PrepareImage>((event, emit) async {
      final transaction =
          Sentry.startTransaction("PreparationBloc", "PrepareImage");
      try {
        await foregroundService.stop();
        final path = await imageSavingService.saveFile();
        await foregroundService.setData("instructions", "image::$path");
        final notificationTitle = tr("perperationNotification.title");
        final notificationBody =
            tr("perperationNotification.initalDescription");
        await foregroundService.start(startPreperationForegroundService,
            notificationTitle, notificationBody);
        //ReceivePort port = await foregroundService.getReceivePort();
        ReceivePort port = ReceivePort();
        SendPort sendPort = port.sendPort;
        foregroundService.registerOnReciveData(sendPort.send);
        final stream = port.asBroadcastStream();
        await emit.forEach(stream, onData: (message) {
          return _statusHandler(message, port, emit, transaction);
        });
        if (state is PreparationIsSuccessfull) {
          await addToGalleryACleanUp(
              path, (state as PreparationIsSuccessfull).path, false);
          await foregroundService.stop();
        }
      } catch (e, stackTrace) {
        transaction.throwable = e;
        transaction.status = const SpanStatus.internalError();
        addError(e, stackTrace);
        emit(PreparationHasError(e.toString()));
        await foregroundService.stop();
      } finally {
        await transaction.finish();
      }
    });
    on<PrepareVideo>((event, emit) async {
      final transaction =
          Sentry.startTransaction("PreparationBloc", "PrepareVideo");
      try {
        await foregroundService.stop();
        String path = await videoSavingService.saveFile();
        await foregroundService.setData("instructions", "video::$path");
        await foregroundService.start(
            startPreperationForegroundService,
            tr("perperationNotification.title"),
            tr("perperationNotification.initalDescription"));
        ReceivePort port = ReceivePort();
        SendPort sendPort = port.sendPort;
        foregroundService.registerOnReciveData(sendPort.send);
        //ReceivePort port = await foregroundService.getReceivePort();
        final stream = port.asBroadcastStream();
        await emit.forEach(stream,
            onData: (message) =>
                _statusHandler(message, port, emit, transaction));
        if (state is PreparationIsSuccessfull) {
          await addToGalleryACleanUp(
              path, (state as PreparationIsSuccessfull).path, true);
          await foregroundService.stop();
        }
      } catch (e, stackTrace) {
        transaction.throwable = e;
        transaction.status = const SpanStatus.internalError();
        addError(e, stackTrace);
        emit(PreparationHasError(e.toString()));
        await foregroundService.stop();
      } finally {
        await transaction.finish();
      }
    });
  }

  PreparationState _statusHandler(message, ReceivePort port,
      Emitter<PreparationState> emit, ISentrySpan transaction) {
    message as Map<String, dynamic>;
    final status = message["status"];
    if (status == "AddingWaterMark") {
      return PrepareationIsAplyingWaterMark();
    } else if (status == "AddingMetaData") {
      return PrepareationIsAddingMetaData();
    } else if (status == "Error") {
      port.close();
      return PreparationHasError(message["description"]);
    } else if (status == "Hashing") {
      return PrepareationIsHashing();
    } else if (status == "Done") {
      port.close();
      return PreparationIsSuccessfull(message["filePath"], message["content"]);
    } else if (status == "Fail") {
      final e = message["description"];
      //final stack = message["stack"];
      transaction.throwable = e;
      transaction.status = const SpanStatus.internalError();
      port.close();
      return PreparationHasError(e.toString());
    }
    return state; // IDK if that could drive me in a corner at some point
  }

  Future<void> addToGalleryACleanUp(
      String initalPath, String finalPath, bool video) async {
    final outPutFile = File(finalPath);
    final initalFile = File(initalPath);
    if (Platform.isAndroid || Platform.isIOS) {
      //This is to prevent file deletion while running flutter test (since all file paths are fake)
      if (video) {
        await PhotoManager.editor.saveVideo(outPutFile);
      } else {
        await PhotoManager.editor.saveImageWithPath(outPutFile.path);
      }
      if (initalPath != finalPath) {
        await initalFile.delete();
      }
    }
  }
}
