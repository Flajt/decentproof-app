import 'package:shared_preferences/shared_preferences.dart';

class DevNetLogic {
  Future<bool> get shouldUseDevNet async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool("devNet") ?? false;
  }

  void setShouldUseDevNet(bool shouldUse) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool("devNet", shouldUse);
  }
}
