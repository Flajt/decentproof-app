abstract class ISecureStorageService {
  Future<void> saveApiKey(String key);
  Future<String?> retriveApiKey();
  Future<void> saveEmail(String email);
  Future<String?> retriveEmail();
}
