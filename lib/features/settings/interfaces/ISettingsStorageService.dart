abstract class ISettingsStorageSerivce {
  Future<void> init();
  Future<void> saveErrorReportingPermissionState(bool permissionGranted);
  Future<bool> getErrorReportingPermissionState();
}
