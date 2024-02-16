import 'dart:io';
import 'dart:isolate';

import 'package:decentproof/features/hashing/bloc/PreparationBloc/PerparationEvents.dart';
import 'package:decentproof/features/hashing/bloc/PreparationBloc/PerparationStates.dart';
import 'package:decentproof/features/hashing/interfaces/IFileSavingService.dart';
import 'package:decentproof/features/hashing/logic/foregroundService/PerperationTaskHandler.dart';
import 'package:decentproof/shared/foregroundService/IForegroundService.dart';
import 'package:decentproof/features/hashing/interfaces/IHashingService.dart';
import 'package:decentproof/features/metadata/interfaces/ILocationService.dart';
import 'package:decentproof/features/metadata/interfaces/IMetaDataPermissionService.dart';
import 'package:decentproof/features/metadata/interfaces/IMetaDataService.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

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
  late final IForegroundService foregroundService;

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
    foregroundService = getIt<IForegroundService>();

    on<PrepareAudio>((event, emit) async {
      final transaction = Sentry.startTransaction("PreparationBloc",
          "PrepareAudio"); // Consider moving it into Foreground Service
      try {
        await foregroundService.stop();
        await foregroundService.setData(
            "instructions", "audio::${event.filePath}");
        await foregroundService.start(startPreperationForegroundService);
        ReceivePort port = await foregroundService.getReceivePort();
        final stream = port.asBroadcastStream();
        await emit.forEach(stream, onData: (message) {
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
            emit(PrepareationIsHashing());
          } else if (status == "Done") {
            port.close();
            return PreparationIsSuccessfull(
                message["filePath"], message["content"]);
          } else if (status == "Fail") {
            final e = message["description"];
            //final stack = message["stack"];
            transaction.throwable = e;
            transaction.status = const SpanStatus.internalError();
            port.close();
            return PreparationHasError(e.toString());
          }
          return state; // IDK if that could drive me in a corner at some point
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
        final path = await imageSavingService.saveFile();
        await foregroundService.setData("instructions", "image::$path");
        await foregroundService.start(startPreperationForegroundService);
        ReceivePort port = await foregroundService.getReceivePort();
        final stream = port.asBroadcastStream();
        await emit.forEach(stream, onData: (message) {
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
            emit(PrepareationIsHashing());
          } else if (status == "Done") {
            port.close();
            return PreparationIsSuccessfull(
                message["filePath"], message["content"]);
          } else if (status == "Fail") {
            final e = message["description"];
            //final stack = message["stack"];
            transaction.throwable = e;
            transaction.status = const SpanStatus.internalError();
            port.close();
            return PreparationHasError(e.toString());
          }
          return state; // IDK if that could drive me in a corner at some point
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
        String path = await videoSavingService.saveFile();
        await foregroundService.setData("instructions", "video::$path");
        await foregroundService.start(startPreperationForegroundService);
        ReceivePort port = await foregroundService.getReceivePort();
        final stream = port.asBroadcastStream();
        await emit.forEach(stream, onData: (message) {
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
            emit(PrepareationIsHashing());
          } else if (status == "Done") {
            port.close();
            return PreparationIsSuccessfull(
                message["filePath"], message["content"]);
          } else if (status == "Fail") {
            final e = message["description"];
            //final stack = message["stack"];
            transaction.throwable = e;
            transaction.status = const SpanStatus.internalError();
            port.close();
            return PreparationHasError(e.toString());
          }
          return state; // IDK if that could drive me in a corner at some point
        });
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
