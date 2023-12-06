import 'dart:io';

import 'package:decentproof/features/hashing/bloc/PreparationBloc/PerparationEvents.dart';
import 'package:decentproof/features/hashing/bloc/PreparationBloc/PerparationStates.dart';
import 'package:decentproof/features/hashing/interfaces/IFileSavingService.dart';
import 'package:decentproof/features/hashing/interfaces/IHashingService.dart';
import 'package:decentproof/features/metadata/interfaces/ILocationService.dart';
import 'package:decentproof/features/metadata/interfaces/IMetaDataPermissionService.dart';
import 'package:decentproof/features/metadata/interfaces/IMetaDataService.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import '../../../metadata/models/LocationModel.dart';
import '../../interfaces/IWaterMarkService.dart';

class PreparationBloc extends Bloc<MetaDataEvents, PreparationState> {
  late final GetIt getIt;
  late final IFileSavingService videoSavingService;
  late final IFileSavingService imageSavingService;
  late final IHashingService videoHashingService;
  late final IHashingService imageHashingService;
  late final IWaterMarkService videoWaterMarkSerivce;
  late final IWaterMarkService imageWaterMarkService;
  late final IMetaDataService audioMetaDataService;
  late final IMetaDataService videoMetaDataService;
  late final IMetaDataService imageMetaDataService;
  late final IMetaDataPermissionService metaDataPermissionService;
  late final ILocationService locationService;
  late final IHashingService audioHashingService;

  PreparationBloc() : super(InitalPrepareBlocState()) {
    getIt = GetIt.I;
    videoSavingService =
        getIt.get<IFileSavingService>(instanceName: "VideoSaving");
    imageSavingService =
        getIt.get<IFileSavingService>(instanceName: "ImageSaving");
    imageHashingService =
        getIt.get<IHashingService>(instanceName: "ImageHashing");
    videoHashingService =
        getIt.get<IHashingService>(instanceName: "VideoHashing");
    videoWaterMarkSerivce =
        getIt.get<IWaterMarkService>(instanceName: "VideoWaterMark");
    imageWaterMarkService =
        getIt.get<IWaterMarkService>(instanceName: "ImageWaterMark");
    audioMetaDataService =
        getIt.get<IMetaDataService>(instanceName: "AudioMetaData");
    videoMetaDataService =
        getIt.get<IMetaDataService>(instanceName: "VideoMetaData");
    imageMetaDataService =
        getIt.get<IMetaDataService>(instanceName: "ImageMetaData");
    metaDataPermissionService = getIt.get<IMetaDataPermissionService>();
    audioHashingService =
        getIt.get<IHashingService>(instanceName: "AudioHashing");
    locationService = getIt.get<ILocationService>();

    on<PrepareAudio>((event, emit) async {
      final transaction =
          Sentry.startTransaction("PreparationBloc", "PrepareAudio");
      try {
        String? afterMetaDataPath;
        String path = event.filePath;
        bool shouldEmbedLocation =
            metaDataPermissionService.shouldEmbedLocation();
        if (shouldEmbedLocation) {
          emit(PrepareationIsAddingMetaData());
          LocationModel locationModel = await locationService.requestLocation();
          afterMetaDataPath =
              await audioMetaDataService.addLocation(locationModel, path);
        }
        emit(PrepareationIsHashing());
        String hash =
            await compute(audioHashingService.hash, afterMetaDataPath ?? path);
        emit(PreparationIsSuccessfull(afterMetaDataPath ?? path, hash));
      } catch (e, stackTrace) {
        transaction.throwable = e;
        transaction.status = const SpanStatus.internalError();
        addError(e, stackTrace);
        emit(PreparationHasError(e.toString()));
      } finally {
        transaction.finish();
      }
    });
    on<PrepareImage>((event, emit) async {
      final transaction =
          Sentry.startTransaction("PreparationBloc", "PrepareImage");
      try {
        String path = await imageSavingService.saveFile();
        emit(PrepareationIsAplyingWaterMark());
        String finalPath = await imageWaterMarkService.addWaterMark(path);

        bool shouldEmbedLocation =
            metaDataPermissionService.shouldEmbedLocation();
        if (shouldEmbedLocation) {
          emit(PrepareationIsAddingMetaData());
          LocationModel locationModel = await locationService.requestLocation();
          await imageMetaDataService.addLocation(locationModel, finalPath);
        }
        emit(PrepareationIsHashing());
        String hash = await compute(imageHashingService.hash, finalPath);
        await addToGalleryACleanUp(path, finalPath, false);
        emit(PreparationIsSuccessfull(finalPath, hash));
      } catch (e, stackTrace) {
        transaction.throwable = e;
        transaction.status = const SpanStatus.internalError();
        addError(e, stackTrace);
        emit(PreparationHasError(e.toString()));
      } finally {
        await transaction.finish();
      }
    });
    on<PrepareVideo>((event, emit) async {
      final transaction =
          Sentry.startTransaction("PreparationBloc", "PrepareVideo");
      try {
        String? afterMetaDataPath;
        String path = await videoSavingService.saveFile();
        emit(PrepareationIsAplyingWaterMark());
        String finalPath = await videoWaterMarkSerivce.addWaterMark(path);
        bool shouldEmbedLocation =
            metaDataPermissionService.shouldEmbedLocation();
        if (shouldEmbedLocation) {
          emit(PrepareationIsAddingMetaData());
          LocationModel locationModel = await locationService.requestLocation();
          afterMetaDataPath =
              await videoMetaDataService.addLocation(locationModel, finalPath);
        }
        emit(PrepareationIsHashing());
        String hash = await compute(
            videoHashingService.hash, afterMetaDataPath ?? finalPath);
        await addToGalleryACleanUp(path, afterMetaDataPath ?? finalPath, true);
        emit(PreparationIsSuccessfull(afterMetaDataPath ?? finalPath, hash));
      } catch (e, stackTrace) {
        transaction.throwable = e;
        transaction.status = const SpanStatus.internalError();
        addError(e, stackTrace);
        emit(PreparationHasError(e.toString()));
      } finally {
        await transaction.finish();
      }
    });
  }
  Future<void> addToGalleryACleanUp(
      String initalPath, String finalPath, bool video) async {
    final outPutFile = File(finalPath);
    final initalFile = File(initalPath);
    final title = outPutFile.path.split("/").last.split(".").first;
    if (Platform.isAndroid || Platform.isIOS) {
      //This is to prevent file deletion while running flutter test (since all file paths are fake)
      if (video) {
        await PhotoManager.editor.saveVideo(outPutFile, title: "$title.mkv");
      } else {
        Uint8List data = await outPutFile.readAsBytes();
        await PhotoManager.editor.saveImage(data, title: "$title.png");
      }
      if (initalPath != finalPath) {
        await initalFile.delete();
      }
    }
  }
}
