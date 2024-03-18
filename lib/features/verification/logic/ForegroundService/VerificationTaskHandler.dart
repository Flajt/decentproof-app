import 'dart:io';
import 'dart:isolate';
import 'dart:ui';

import 'package:decentproof/features/metadata/interfaces/IMetaDataService.dart';
import 'package:decentproof/features/metadata/models/MetaDataModel.dart';
import 'package:decentproof/features/verification/interfaces/IVerificationService.dart';
import 'package:decentproof/features/verification/models/VerificationStatusModel.dart';
import 'package:decentproof/shared/foregroundService/IForegroundService.dart';
import 'package:decentproof/shared/interface/IHashLogic.dart';
import 'package:decentproof/shared/util/initSentry.dart';
import 'package:decentproof/shared/util/loadTranslations.dart';
import 'package:decentproof/shared/util/register.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_foreground_task/flutter_foreground_task.dart';
import 'package:get_it/get_it.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:easy_localization/src/localization.dart';

class VerificationTaskHandler implements TaskHandler {
  @override
  void onDestroy(DateTime timestamp, SendPort? sendPort) {}

  @override
  void onNotificationButtonPressed(String id) {}

  @override
  void onNotificationPressed() {}

  @override
  void onRepeatEvent(DateTime timestamp, SendPort? sendPort) {}

  @override
  Future<void> onStart(DateTime timestamp, SendPort? sendPort) async {
    DartPluginRegistrant.ensureInitialized();
    try {
      await EasyLocalization.ensureInitialized();
      await loadTranslations();
      final Localization L = Localization.instance;
      await dotenv.load();
      await initSentry();
      await registar();
      final GetIt getIt = GetIt.instance;
      final IForegroundService foregroundService =
          getIt.get<IForegroundService>();
      final IVerificationService verificationService =
          getIt.get<IVerificationService>();
      final IHashLogic hashLogic = getIt.get<IHashLogic>();

      final tempFilePath = await foregroundService.getData("filePath");
      final tempFile = File(tempFilePath);
      final int fileSize = (tempFile.lengthSync() / 65536).ceil();
      Stream<List<int>> tempStream = tempFile
          .openRead(); // Steams are consumed after beeing done so we need a new one
      sendPort?.send({"status": "Hashing", "progess": 0});
      String hash = await hashLogic.hashBytesInChunksFromStream(tempStream,
          (progress) async {
        int currentProgress = (progress / fileSize * 100).ceil();
        sendPort?.send({"status": "Hashing", "progess": currentProgress});
        if (currentProgress % 5 == 0) {
          // Should prevent to many updates
          await foregroundService.updateNotification(
              body:
                  "${L.tr("verificationNotification.hashing")} $currentProgress%");
        }
      });
      VerificationStatusModel model = await verificationService.verify(hash);
      FileType fileType =
          isOfType(tempFile.path.split("/").last); // Shouldge the name
      MetaDataModel metaDataModel =
          await extractMetaData(fileType, tempFile, getIt);
      await foregroundService.updateNotification(
          body: L.tr("verificationNotification.validatingMetaData"));
      final finalModel = model.copyWith(metaDataModel: metaDataModel);
      sendPort?.send({"status": "Done", "model": finalModel.toJson()});
    } catch (e, stack) {
      await Sentry.captureException(e, stackTrace: stack);
      sendPort?.send({"status": "Error", "message": e.toString()});
    }
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

  Future<MetaDataModel> extractMetaData(
      FileType fileType, File tempFile, GetIt getIt) async {
    if (fileType == FileType.audio) {
      final IMetaDataService audioMetaDataService =
          getIt.get<IMetaDataService>(instanceName: "AudioMetaData");
      return await audioMetaDataService.retriveMetaData(tempFile.path);
    } else if (fileType == FileType.video) {
      final IMetaDataService videoMetaDataService = getIt.get<IMetaDataService>(
        instanceName: "VideoMetaData",
      );
      return await videoMetaDataService.retriveMetaData(tempFile.path);
    }
    final IMetaDataService imageMetaDataService =
        getIt.get<IMetaDataService>(instanceName: "ImageMetaData");
    return await imageMetaDataService.retriveMetaData(tempFile.path);
  }
}

enum FileType {
  image,
  audio,
  video,
}

@pragma("vm:entry-point")
void startVerificationForegroundService() {
  FlutterForegroundTask.setTaskHandler(VerificationTaskHandler());
}
