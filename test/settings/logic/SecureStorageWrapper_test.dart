import 'package:decentproof/shared/Integrety/SecureStorageWrapper.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  // Will all be skipped since it would require a device to run, TODO: implement in the future
  group("SecureStorageWrapper", skip: true, () {
    group("on saving", () {
      test('an api key, it should be saved', () async {
        SecureStorageWrapper secureStorageWrapper = SecureStorageWrapper();
        await secureStorageWrapper.saveApiKey("my-super-key");
        String? apiKey = await secureStorageWrapper.retriveApiKey();
        expect(apiKey, "my-super-key");
      });
      test('an email, it should be saved', () async {
        SecureStorageWrapper secureStorageWrapper = SecureStorageWrapper();
        await secureStorageWrapper.saveEmail("email@email.com");
        String? email = await secureStorageWrapper.retriveApiKey();
        expect(email, "email@email.com");
      });
    });
    group("on deletion", () {
      test('an email, it should be deleted', () async {
        SecureStorageWrapper secureStorageWrapper = SecureStorageWrapper();
        await secureStorageWrapper.saveEmail("email@email.com");
        await secureStorageWrapper.deleteEmail();
        String? email = await secureStorageWrapper.retriveEmail();
        expect(email, null);
      });
    });
  });
}
