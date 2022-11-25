import 'package:shared_preferences/shared_preferences.dart';

Future<bool> isFirstTimeUser() async {
  final prefsInstance = await SharedPreferences.getInstance();
  bool isFirst = prefsInstance.getBool("firstTime") ?? true;
  if (isFirst == true) {
    await prefsInstance.setBool("firstTime", false);
  }
  return isFirst;
}
