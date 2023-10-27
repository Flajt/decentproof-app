import 'dart:io';

import 'package:decentproof/features/metadata/interfaces/IMetaDataService.dart';
import 'package:decentproof/features/verification/bloc/VerificationBlocEvents.dart';
import 'package:decentproof/features/verification/bloc/VerificationBlocStates.dart';
import 'package:decentproof/features/verification/interfaces/IFileSelectionService.dart';
import 'package:decentproof/features/verification/interfaces/IVerificationService.dart';
import 'package:decentproof/features/verification/models/FileDataMode.dart';
import 'package:decentproof/features/verification/models/VerificationStatusModel.dart';
import 'package:decentproof/shared/interface/IHashLogic.dart';
import 'package:flutter/material.dart';
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
  late final IMetaDataService _audioVideoMetaDataService;
  VerificationBloc() : super(InitialState()) {
    _verificationService = _getIt.get<IVerificationService>();
    _fileSelectionService = _getIt.get<IFileSelectionService>();
    _hashLogic = _getIt.get<IHashLogic>();
    _imageMetaDataService =
        _getIt.get<IMetaDataService>(instanceName: "ImageMetaData");
    _audioVideoMetaDataService =
        _getIt.get<IMetaDataService>(instanceName: "AudioVideoMetaData");
    on<VerifyHashEvent>((event, emit) async {
      try {
        MetaDataModel? metaDataModel;
        Directory tempFileStorage = await getApplicationCacheDirectory();
        emit(LoadingState());
        FileDataModel? fileDataModel =
            await _fileSelectionService.selectFileAsStream();
        if (fileDataModel != null) {
          File tempFile =
              File("${tempFileStorage.path}/${fileDataModel.fileName}");
          String hash = await _hashLogic
              .hashBytesInChunksFromStream(fileDataModel.byteStream);
          VerificationStatusModel model =
              await _verificationService.verify(hash);
          FileType fileType = isOfType(fileDataModel.fileName);
          if (fileType == FileType.audio || fileType == FileType.video) {
            metaDataModel =
                await _audioVideoMetaDataService.retriveMetaData(tempFile.path);
          } else if (fileType == FileType.image) {
            metaDataModel =
                await _imageMetaDataService.retriveMetaData(tempFile.path);
          }
          final finalModel = model.copyWith(metaDataModel: metaDataModel);
          emit(VerifiedState(finalModel));
        } else {
          emit(InitialState());
        }
        await tempFileStorage.delete(recursive: true);
      } catch (e) {
        emit(ErrorState(e.toString()));
        emit(InitialState());
      }
    });
    on<ResetEvent>((event, emit) => emit(InitialState()));
  }
  isOfType(String name) {
    String extension = name.split(".").last;
    if (extension == "png") {
      return FileType.image;
    } else if (extension == "mp3") {
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
