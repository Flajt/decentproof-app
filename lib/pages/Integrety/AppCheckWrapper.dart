import 'package:firebase_app_check/firebase_app_check.dart';

class AppcheckWrapper {
  static Future<String> getAppToken() async {
    String? appcheckToken = await FirebaseAppCheck.instance.getToken();
    if (appcheckToken == null) throw "No App Check token found!";
    return appcheckToken;
  }
}
