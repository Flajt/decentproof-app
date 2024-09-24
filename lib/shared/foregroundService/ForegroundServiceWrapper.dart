import 'package:decentproof/shared/foregroundService/IForegroundService.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_foreground_task/flutter_foreground_task.dart';

class ForegroundServiceWrapper implements IForegroundService {
  ForegroundServiceWrapper() {
    FlutterForegroundTask.init(
      androidNotificationOptions: AndroidNotificationOptions(
          channelId: 'decentproof_hashing_service',
          channelName: 'Hashing & Preperation Channel',
          channelDescription: "notificationChannel.description".tr(),
          channelImportance: NotificationChannelImportance.LOW,
          priority: NotificationPriority.MAX,
          visibility: NotificationVisibility.VISIBILITY_PRIVATE),
      iosNotificationOptions: const IOSNotificationOptions(),
      foregroundTaskOptions: ForegroundTaskOptions(
        eventAction: ForegroundTaskEventAction.nothing(),
        autoRunOnMyPackageReplaced: true,
        autoRunOnBoot: false,
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
        notificationIcon: const NotificationIconData(
            resType: ResourceType.mipmap,
            resPrefix: ResourcePrefix.ic,
            name: 'launcher'),
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

  @override
  void registerOnReciveData(void Function(Object) callback) =>
      FlutterForegroundTask.addTaskDataCallback(callback);

  @override
  void removeReciveDataCallback(void Function(Object) callback) {
    FlutterForegroundTask.removeTaskDataCallback(callback);
  }

  @override
  Future<void> init() async {
    NotificationPermission permission =
        await FlutterForegroundTask.checkNotificationPermission();
    if (permission == NotificationPermission.denied) {
      await FlutterForegroundTask.requestNotificationPermission();
    }
  }

  @override
  void sendToMain(Object data) => FlutterForegroundTask.sendDataToMain(data);

  //TODO: Move that somehwere else idk where but somewhere, sadly it doens't like to be in init or the constructor
  static void initCommPort() => FlutterForegroundTask.initCommunicationPort();
}
