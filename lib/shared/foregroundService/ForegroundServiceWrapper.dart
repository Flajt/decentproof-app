import 'dart:isolate';

import 'package:decentproof/shared/foregroundService/IForegroundService.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_foreground_task/flutter_foreground_task.dart';

class ForegroundServiceWrapper implements IForegroundService {
  ForegroundServiceWrapper() {
    FlutterForegroundTask.init(
      androidNotificationOptions: AndroidNotificationOptions(
          channelId: 'decentproof_hashing_service',
          channelName: 'Hashing & Preperation Channel',
          channelDescription: "notification.description".tr(),
          channelImportance: NotificationChannelImportance.LOW,
          priority: NotificationPriority.MAX,
          visibility: NotificationVisibility.VISIBILITY_PRIVATE,
          iconData: const NotificationIconData(
              resType: ResourceType.mipmap,
              resPrefix: ResourcePrefix.ic,
              name: 'launcher')),
      iosNotificationOptions: const IOSNotificationOptions(),
      foregroundTaskOptions: const ForegroundTaskOptions(
        isOnceEvent: true,
        autoRunOnBoot: true,
        allowWakeLock: true,
        allowWifiLock: true,
      ),
    );
  }

  /// Starts the service
  @override
  Future<void> start(
      Function? startCallback, String title, String description) async {
    await FlutterForegroundTask.startService(
        notificationTitle: title,
        notificationText: description,
        callback: startCallback);
  }

  @override
  Future<bool> get isRunning {
    return FlutterForegroundTask.isRunningService;
  }

  /// Stops the service
  @override
  Future<void> stop() async {
    await FlutterForegroundTask.stopService();
  }

  /// If you want to set some data that should be available in the isolate you can do it here
  @override
  Future<void> setData(String key, Object value) async {
    await FlutterForegroundTask.saveData(key: key, value: value);
  }

  /// Allows to retrive data in the isolate, if it has been set by [setData]

  @override
  Future<T?> getData<T>(String key) async {
    return await FlutterForegroundTask.getData<T>(key: key);
  }

  /// Can be used to update the notification title and / or body
  @override
  Future<void> updateNotification({String? title, String? body}) async {
    await FlutterForegroundTask.updateService(
        notificationText: body, notificationTitle: title);
  }

  ///Returns a [ReceivePort] make sure to close it afterwards
  @override
  Future<ReceivePort> getReceivePort() async {
    if (await FlutterForegroundTask.isRunningService) {
      return FlutterForegroundTask.receivePort!;
    } else {
      throw Exception("ForegroundService is not yet running, start it first!");
    }
  }
}
