import 'dart:io';

import 'package:decentproof/features/hashing/bloc/perperationBloc/PerperationEvents.dart';
import 'package:decentproof/features/hashing/bloc/perperationBloc/PerperationStates.dart';
import 'package:decentproof/features/hashing/interfaces/IFileSavingService.dart';
import 'package:decentproof/features/hashing/interfaces/IHashingService.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:photo_manager/photo_manager.dart';

import '../../interfaces/IWaterMarkService.dart';

//TODO: Find a better name!
class PreparationBloc extends Bloc<MetaDataEvents, MetaDataState> {
  late final GetIt getIt;
  late final IFileSavingService videoSavingService;
  late final IFileSavingService imageSavingService;
  late final IHashingService videoHashingService;
  late final IHashingService imageHashingService;
  late final IWaterMarkService videoWaterMarkSerivce;
  late final IWaterMarkService imageWaterMarkService;
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

    on<PerpareAudio>((event, emit) {
      //Will only add location and other metadata later on
    });
    on<PerpareImage>((event, emit) async {
      try {
        String path = await imageSavingService.saveFile();
        emit(PrepareationIsAplyingWaterMark());
        String finalPath = await imageWaterMarkService.addWaterMark(path);
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
        String path = await videoSavingService.saveFile();
        emit(PrepareationIsAplyingWaterMark());
        String finalPath = await videoWaterMarkSerivce.addWaterMark(path);
        emit(PrepareationIsHashing());
        String hash = await compute(videoHashingService.hash, finalPath);
        await addToGalleryACleanUp(path, finalPath, true);
        emit(PreparationIsSuccessfull(finalPath, hash));
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
