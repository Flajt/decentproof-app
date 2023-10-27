import 'dart:io';

import 'package:decentproof/features/hashing/bloc/perperationBloc/PerperationEvents.dart';
import 'package:decentproof/features/hashing/bloc/perperationBloc/PerperationStates.dart';
import 'package:decentproof/features/hashing/interfaces/IFileSavingService.dart';
import 'package:decentproof/features/hashing/interfaces/IHashingService.dart';
import 'package:decentproof/features/metadata/interfaces/ILocationService.dart';
import 'package:decentproof/features/metadata/interfaces/IMetaDataPermissionService.dart';
import 'package:decentproof/features/metadata/interfaces/IMetaDataService.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:photo_manager/photo_manager.dart';

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
  late final IMetaDataService audioVideoMetaDataService;
  late final IMetaDataService imageMetaDataService;
  late final IMetaDataPermissionService metaDataPermissionService;
  late final ILocationService locationService;

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
    audioVideoMetaDataService =
        getIt.get<IMetaDataService>(instanceName: "AudioVideoMetaData");
    imageMetaDataService =
        getIt.get<IMetaDataService>(instanceName: "ImageMetaData");
    metaDataPermissionService = getIt.get<IMetaDataPermissionService>();
    locationService = getIt.get<ILocationService>();

    on<PerpareAudio>((event, emit) {
      //Will only add location and other metadata later on
    });
    on<PerpareImage>((event, emit) async {
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
      } catch (e) {
        emit(PreparationHasError(e.toString()));
      }
    });
    on<PrepareVideo>((event, emit) async {
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
          afterMetaDataPath = await audioVideoMetaDataService.addLocation(
              locationModel, finalPath);
        }
        emit(PrepareationIsHashing());
        String hash = await compute(
            videoHashingService.hash, afterMetaDataPath ?? finalPath);
        await addToGalleryACleanUp(path, afterMetaDataPath ?? finalPath, true);
        emit(PreparationIsSuccessfull(afterMetaDataPath ?? finalPath, hash));
      } catch (e) {
        emit(PreparationHasError(e.toString()));
      }
    });
  }
  Future<void> addToGalleryACleanUp(
      String initalPath, String finalPath, bool video) async {
    if (Platform.isAndroid) {
      final outPutFile = File(finalPath);
      final initalFile = File(initalPath);
      final title = outPutFile.path.split("/").last.split(".").first;
      if (video) {
        await PhotoManager.editor.saveVideo(outPutFile, title: "$title.mkv");
        await initalFile.delete();
      } else {
        Uint8List data = await outPutFile.readAsBytes();
        await PhotoManager.editor.saveImage(data, title: "$title.png");
        await initalFile.delete();
      }
    }
  }
}