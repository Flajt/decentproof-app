import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageWrapper {
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage(
      iOptions: IOSOptions(accessibility: KeychainAccessibility.first_unlock),
      aOptions: AndroidOptions(
          encryptedSharedPreferences: true,
          sharedPreferencesName: "decentproof"));
  Future<void> saveApiKey(String key) async {
    await _secureStorage.write(key: "apiKey", value: key);
  }

  Future<String?> retriveApiKey() async {
    String? apiKey = await _secureStorage.read(key: "apiKey");
    return apiKey;
  }
}
