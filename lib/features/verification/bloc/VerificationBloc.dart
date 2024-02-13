import 'dart:io';
import 'package:decentproof/features/metadata/interfaces/IMetaDataService.dart';
import 'package:decentproof/features/verification/bloc/VerificationBlocEvents.dart';
import 'package:decentproof/features/verification/bloc/VerificationBlocStates.dart';
import 'package:decentproof/features/verification/interfaces/IFileSelectionService.dart';
import 'package:decentproof/features/verification/interfaces/IVerificationService.dart';
import 'package:decentproof/features/verification/models/FileDataMode.dart';
import 'package:decentproof/features/verification/models/VerificationStatusModel.dart';
import 'package:decentproof/shared/interface/IHashLogic.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:path_provider/path_provider.dart';

import '../../metadata/models/MetaDataModel.dart';

class VerificationBloc
    extends Bloc<VerificationBlocEvents, VerificationBlocStates> {
  final _getIt = GetIt.I;
  late final IVerificationService _verificationService;
  late final IFileSelectionService _fileSelectionService;
  late final IHashLogic _hashLogic;
  late final IMetaDataService _imageMetaDataService;
  late final IMetaDataService _audioMetaDataService;
  late final IMetaDataService _videoMetaDataService;
  VerificationBloc() : super(InitialState()) {
    _verificationService = _getIt.get<IVerificationService>();
    _fileSelectionService = _getIt.get<IFileSelectionService>();
    _hashLogic = _getIt.get<IHashLogic>();
    _imageMetaDataService =
        _getIt.get<IMetaDataService>(instanceName: "ImageMetaData");
    _audioMetaDataService =
        _getIt.get<IMetaDataService>(instanceName: "AudioMetaData");
    _videoMetaDataService = _getIt.get<IMetaDataService>(
      instanceName: "VideoMetaData",
    );

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
          final int fileSize = tempFile.lengthSync();
          Stream<List<int>> tempStream = tempFile
              .openRead(); // Steams are consumed after beeing done so we need a new one
          String hash = await _hashLogic.hashBytesInChunksFromStream(
              tempStream, (progress) => (progress / fileSize) * 100);
          VerificationStatusModel model =
              await _verificationService.verify(hash);
          FileType fileType = isOfType(fileDataModel.fileName);
          MetaDataModel metaDataModel =
              await extractMetaData(fileType, tempFile);
          final finalModel = model.copyWith(metaDataModel: metaDataModel);
          emit(VerifiedState(finalModel));
        } else {
          emit(InitialState());
        }
        await tempFileStorage.delete(recursive: true);
      } catch (e, stackTrace) {
        await tempFileStorage.delete(recursive: true);
        addError(e, stackTrace);
        emit(ErrorState(e.toString()));
        emit(InitialState());
      }
    });
    on<ResetEvent>((event, emit) => emit(InitialState()));
  }

  Future<MetaDataModel> extractMetaData(
      FileType fileType, File tempFile) async {
    if (fileType == FileType.audio) {
      return await _audioMetaDataService.retriveMetaData(tempFile.path);
    } else if (fileType == FileType.video) {
      return await _videoMetaDataService.retriveMetaData(tempFile.path);
    }
    return await _imageMetaDataService.retriveMetaData(tempFile.path);
  }

  Future<void> copyFileToTemp(
      File tempFile, FileDataModel fileDataModel) async {
    final sink = tempFile.openWrite();
    await sink.addStream(fileDataModel.byteStream);
    await sink.flush();
    await sink.close();
  }

  isOfType(String name) {
    String extension = name.split(".").last;
    if (extension == "png") {
      return FileType.image;
    } else if (extension == "mp3" || extension == "aac") {
      return FileType.audio;
    } else if (extension == "mkv") {
      return FileType.video;
    }
  }
}

enum FileType {
  image,
  audio,
  video,
}
