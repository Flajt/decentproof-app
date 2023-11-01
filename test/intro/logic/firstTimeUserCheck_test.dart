import 'package:decentproof/features/intro/logic/firstTimeUserCheck.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test/test.dart';

void main() {
  group("firstTimeUserCheck", () {
    test('is new user', () async {
      SharedPreferences.setMockInitialValues({});
      expect(isFirstTimeUser(), completion(true));
    });
    test('is not new user', () async {
      SharedPreferences.setMockInitialValues({"firstTime": false});
      expect(isFirstTimeUser(), completion(false));
    });
  });
}
