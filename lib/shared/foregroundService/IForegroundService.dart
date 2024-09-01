abstract class IForegroundService {
  Future<void> init();
  Future<void> start(
      Function? startCallback, String title, String descriptions);
  Future<void> stop();
  Future<T?> getData<T>(String key);
  Future<void> setData(String key, Object value);
  Future<void> updateNotification({String? title, String? body});
  void registerOnReciveData(void Function(Object) callback);
  void removeReciveDataCallback(void Function(Object) callback);
  Future<bool> get isRunning;
}
