import 'dart:isolate';
import 'dart:ui';

import 'package:decentproof/shared/foregroundService/IForegroundService.dart';
import 'package:decentproof/features/hashing/interfaces/IHashingService.dart';
import 'package:decentproof/features/hashing/interfaces/IWaterMarkService.dart';
import 'package:decentproof/features/metadata/interfaces/ILocationService.dart';
import 'package:decentproof/features/metadata/interfaces/IMetaDataPermissionService.dart';
import 'package:decentproof/features/metadata/interfaces/IMetaDataService.dart';
import 'package:decentproof/features/metadata/models/LocationModel.dart';
import 'package:decentproof/shared/util/initSentry.dart';
import 'package:decentproof/shared/util/loadTranslations.dart';
import 'package:decentproof/shared/util/register.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_foreground_task/flutter_foreground_task.dart';
import 'package:get_it/get_it.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:easy_localization/src/localization.dart';

class PreperationTaskHandler extends TaskHandler {
  // Called when the task is started.
  @override
  void onStart(DateTime timestamp, SendPort? sendPort) async {
    DartPluginRegistrant.ensureInitialized();
    try {
      await dotenv.load();
      await loadTranslations();
      final Localization L = Localization.instance;
      await initSentry();
      await registar();
      final getIt = GetIt.I;
      final IHashingService imageHashingService =
          getIt.get<IHashingService>(instanceName: "ImageHashing");
      final IHashingService videoHashingService =
          getIt.get<IHashingService>(instanceName: "VideoHashing");
      final IWaterMarkService videoWaterMarkSerivce =
          getIt.get<IWaterMarkService>(instanceName: "VideoWaterMark");
      final IWaterMarkService imageWaterMarkService =
          getIt.get<IWaterMarkService>(instanceName: "ImageWaterMark");
      final IMetaDataService audioMetaDataService =
          getIt.get<IMetaDataService>(instanceName: "AudioMetaData");
      final IMetaDataService videoMetaDataService =
          getIt.get<IMetaDataService>(instanceName: "VideoMetaData");
      final IMetaDataService imageMetaDataService =
          getIt.get<IMetaDataService>(instanceName: "ImageMetaData");
      final IMetaDataPermissionService metaDataPermissionService =
          getIt.get<IMetaDataPermissionService>();
      final IHashingService audioHashingService =
          getIt.get<IHashingService>(instanceName: "AudioHashing");
      final ILocationService locationService = getIt.get<ILocationService>();
      final IForegroundService foregroundService =
          getIt.get<IForegroundService>();

      final instructions =
          await foregroundService.getData<String>("instructions");
      final parts = instructions!.split("::");
      final path = parts[1];
      final task = parts[0];
      if (task == "image") {
        sendPort?.send({"status": "AddingWaterMark"});
        await foregroundService.updateNotification(
            body: L.tr("perperationNotification.addingWaterMark"));
        String finalPath = await imageWaterMarkService.addWaterMark(path);
        bool shouldEmbedLocation =
            metaDataPermissionService.shouldEmbedLocation();
        if (shouldEmbedLocation) {
          await foregroundService.updateNotification(
              body: L.tr("perperationNotification.addingMetaData"));
          sendPort?.send({"status": "AddingMetaData"});
          bool isEnabled = await locationService.serviceEnabled();
          if (!isEnabled) {
            sendPort?.send({
              "status": "Error",
              "description": "Location Service is not enabled!"
            });
            await foregroundService.stop();
            return;
          }
          LocationModel locationModel = await locationService.requestLocation();
          await imageMetaDataService.addLocation(locationModel, finalPath);
        }
        sendPort?.send({"status": "Hashing", "progess": 0});
        String hash = await imageHashingService.hash(
            finalPath,
            (progress) async => await sendAUpdateProgress(
                sendPort, "Hashing", progress, foregroundService));
        sendPort
            ?.send({"status": "Done", "content": hash, "filePath": finalPath});
      } else if (task == "video") {
        String? afterMetaDataPath;
        await foregroundService.updateNotification(
            body: L.tr("perperationNotification.addingWaterMark"));
        sendPort?.send({"status": "AddingWaterMark"});
        String finalPath = await videoWaterMarkSerivce.addWaterMark(path);
        bool shouldEmbedLocation =
            metaDataPermissionService.shouldEmbedLocation();
        if (shouldEmbedLocation) {
          bool isEnabled = await locationService.serviceEnabled();
          await foregroundService.updateNotification(
              body: L.tr("perperationNotification.addingMetaData"));
          sendPort?.send({"status": "AddingMetaData"});
          if (!isEnabled) {
            sendPort?.send({
              "status": "Error",
              "description": "Location Service is not enabled!"
            });
            await foregroundService.stop();
            return;
          }
          LocationModel locationModel = await locationService.requestLocation();
          afterMetaDataPath =
              await videoMetaDataService.addLocation(locationModel, finalPath);
        }
        sendPort?.send({"status": "Hashing", "progess": 0});
        String hash = await videoHashingService.hash(
            afterMetaDataPath ?? finalPath,
            (progress) async => await sendAUpdateProgress(
                sendPort, "Hashing", progress, foregroundService));

        sendPort?.send({
          "status": "Done",
          "content": hash,
          "filePath": afterMetaDataPath ?? path
        });
      } else if (task == "audio") {
        String? afterMetaDataPath;
        bool shouldEmbedLocation =
            metaDataPermissionService.shouldEmbedLocation();
        if (shouldEmbedLocation) {
          await foregroundService.updateNotification(
              body: L.tr("perperationNotification.addingWaterMark"));
          sendPort?.send({"status": "AddingMetaData"});
          bool isEnabled = await locationService.serviceEnabled();
          if (!isEnabled) {
            sendPort?.send({
              "status": "Error",
              "description": "Location Service is not enabled!"
            });
            await foregroundService.stop();
            return;
          }
          LocationModel locationModel = await locationService.requestLocation();
          afterMetaDataPath =
              await audioMetaDataService.addLocation(locationModel, path);
        }
        sendPort?.send({"status": "Hashing", "progess": 0});

        String hash = await audioHashingService.hash(
            afterMetaDataPath ?? path,
            (progress) async => await sendAUpdateProgress(
                sendPort, "Hashing", progress, foregroundService));
        sendPort?.send({
          "status": "Done",
          "content": hash,
          "filePath": afterMetaDataPath ?? path
        });
      } else {
        sendPort
            ?.send({"status": "Error", "description": "Task not supported"});
        await foregroundService.stop();
      }
    } catch (e, stack) {
      sendPort?.send({
        "status": "Fail",
        "description": e.toString(),
        "stack": stack.toString()
      });
      await Sentry.captureException(e, stackTrace: stack);
      await FlutterForegroundTask.stopService();
    }
  }

  // Called every [interval] milliseconds in [ForegroundTaskOptions].
  @override
  void onRepeatEvent(DateTime timestamp, SendPort? sendPort) async {}

  // Called when the notification button on the Android platform is pressed.
  @override
  void onDestroy(DateTime timestamp, SendPort? sendPort) async {}

  // Called when the notification button on the Android platform is pressed.
  @override
  void onNotificationButtonPressed(String id) {}

  // Called when the notification itself on the Android platform is pressed.
  //
  // "android.permission.SYSTEM_ALERT_WINDOW" permission must be granted for
  // this function to be called.
  @override
  void onNotificationPressed() {
    // Note that the app will only route to "/resume-route" when it is exited so
    // it will usually be necessary to send a message through the send port to
    // signal it to restore state when the app is already started.
  }

  Future<void> sendAUpdateProgress(SendPort? sendPort, String step,
      double progress, IForegroundService foregroundService) async {
    sendPort?.send({"status": step, "progress": progress});
    await foregroundService.updateNotification(body: "${progress.ceil()}/100%");
  }
}

@pragma('vm:entry-point')
void startPreperationForegroundService() {
  // The setTaskHandler function must be called to handle the task in the background.
  FlutterForegroundTask.setTaskHandler(PreperationTaskHandler());
}
