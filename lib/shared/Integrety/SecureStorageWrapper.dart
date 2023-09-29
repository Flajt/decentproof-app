import 'package:decentproof/shared/integrety/interfaces/ISecureStorageService.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

///Handles sensitive data storage
class SecureStorageService implements ISecureStorageService {
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
  Future<String?> retriveEmail() {
    // TODO: implement retriveEmail
    throw UnimplementedError();
  }

  @override
  Future<void> saveEmail(String email) {
    // TODO: implement saveEmail
    throw UnimplementedError();
  }
}
