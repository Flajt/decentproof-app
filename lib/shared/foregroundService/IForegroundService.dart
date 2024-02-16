import 'dart:isolate';

abstract class IForegroundService {
  Future<void> start(
      Function? startCallback, String title, String descriptions);
  Future<void> stop();
  Future<T?> getData<T>(String key);
  Future<void> setData(String key, Object value);
  Future<void> updateNotification({String? title, String? body});
  Future<ReceivePort> getReceivePort();
  Future<bool> get isRunning;
}
