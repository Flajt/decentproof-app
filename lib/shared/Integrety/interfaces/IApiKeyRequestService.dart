abstract class IApiKeyRequestService {
  ///Returns the api key
  Future<bool> checkForNewApiKey(String? apiKey);
  Future<String> getNewNewKey(String token);
}
