import 'package:decentproof/features/hashing/bloc/metaDataBloc/MetaDataEvents.dart';
import 'package:decentproof/features/hashing/bloc/metaDataBloc/MetaDataStates.dart';
import 'package:decentproof/features/hashing/interfaces/IFileSavingService.dart';
import 'package:decentproof/features/hashing/interfaces/IHashingService.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

//TODO: Find a better name!
class MetaDataBloc extends Bloc<MetaDataEvents, MetaDataState> {
  late final GetIt getIt;
  late final IFileSavingService videoSavingService;
  late final IFileSavingService imageSavingService;
  late final IHashingService videoHashingService;
  late final IHashingService imageHashingService;
  MetaDataBloc() : super(InitalMetdataBlocState()) {
    getIt = GetIt.I;
    videoSavingService =
        getIt.get<IFileSavingService>(instanceName: "VideSaving");
    imageSavingService =
        getIt.get<IFileSavingService>(instanceName: "ImageSaving");
    imageHashingService =
        getIt.get<IHashingService>(instanceName: "ImageHashing");
    videoHashingService =
        getIt.get<IHashingService>(instanceName: "VideoHashing");

    on<ApplyMetaDataToAudio>((event, emit) {
      //Will only add location and other metadata later on
    });
    on<ApplyMetaDataToImage>((event, emit) async {
      try {
        String finalPath = await imageSavingService.saveFile();
        emit(MetaDataIsHashing());
        String hash = await compute(imageHashingService.hash, finalPath);
        emit(MetaDataIsSuccessfull(finalPath, hash));
      } catch (e) {
        emit(MetaDataHasError(e.toString()));
      }
    });
    on<ApplyMetaDataToVideo>((event, emit) async {
      try {
        String finalPath = await videoSavingService.saveFile();
        emit(MetaDataIsHashing());
        String hash = await compute(videoHashingService.hash, finalPath);
        emit(MetaDataIsSuccessfull(finalPath, hash));
      } catch (e) {
        emit(MetaDataHasError(e.toString()));
      }
    });
  }
}
