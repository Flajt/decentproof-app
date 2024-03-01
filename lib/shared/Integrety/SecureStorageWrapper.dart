import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'interfaces/ISecureStorageService.dart';

///Handles sensitive data storage
class SecureStorageWrapper implements ISecureStorageService {
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage(
      iOptions: IOSOptions(accessibility: KeychainAccessibility.first_unlock),
      aOptions: AndroidOptions(
          encryptedSharedPreferences: true,
          sharedPreferencesName: "decentproof"));
  @override
  Future<void> saveApiKey(String key) async {
    await _secureStorage.write(key: "apiKey", value: key);
  }

  @override
  Future<String?> retriveApiKey() async {
    String? apiKey = await _secureStorage.read(key: "apiKey");
    return apiKey;
  }

  @override
  Future<String?> retriveEmail() async {
    return await _secureStorage.read(key: "email");
  }

  @override
  Future<void> saveEmail(String email) async {
    await _secureStorage.write(key: "email", value: email);
  }

  @override
  Future<String?> retriveSecret() async =>
      await _secureStorage.read(key: "secret");

  @override
  Future<void> saveSecret(String secret) async {
    await _secureStorage.write(key: "secret", value: secret);
  }

  @override
  Future<void> deleteEmail() async {
    await _secureStorage.delete(key: "email");
  }
}
