import 'package:firebase_app_check/firebase_app_check.dart';

class AppcheckWrapper {
  Future<String> getAppToken() async {
    String? appcheckToken = await FirebaseAppCheck.instance.getToken();
    if (appcheckToken == null) throw "No App Check token found!";
    return appcheckToken;
  }
}
