import 'package:decentproof/shared/integrety/interfaces/IDeviceIntegrity.dart';
import 'package:firebase_app_check/firebase_app_check.dart';

class AppCheck implements IDeviceIntegrety {
  @override
  Future<String> getIntegrityToken() async {
    String? appcheckToken = await FirebaseAppCheck.instance.getToken();
    if (appcheckToken == null) throw "No App Check token found!";
    return appcheckToken;
  }
}
