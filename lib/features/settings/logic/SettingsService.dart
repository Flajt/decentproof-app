import 'package:decentproof/features/settings/interfaces/ISettingsStorageService.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsStorageSerivce implements ISettingsStorageSerivce {
  //TODO: Create a sharedPreferecesWrapper service
  late final SharedPreferences? _sharedPrefs;
  @override
  Future<void> init() async {
    _sharedPrefs = await SharedPreferences.getInstance();
  }

  @override
  Future<void> saveErrorReportingPermissionState(bool permissionGranted) async {
    await _sharedPrefs!.setBool("errorReporting", permissionGranted);
  }

  @override
  Future<bool> getErrorReportingPermissionState() async {
    return _sharedPrefs!.getBool("errorReporting") ?? false;
  }
}
