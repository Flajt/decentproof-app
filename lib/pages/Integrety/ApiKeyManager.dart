import 'package:decentproof/pages/Integrety/AppCheckWrapper.dart';
import 'package:decentproof/pages/Integrety/SecureStorageWrapper.dart';
import 'package:dio/dio.dart';

class ApiKeyManager {
  late final AppcheckWrapper? _appCheckWrapper;
  final String url = "http://localhost:8000";
  late final Dio _dio;
  late final SecureStorageWrapper _secureStorageWrapper;

  ApiKeyManager(SecureStorageWrapper secureStorageWrapper,
      [AppcheckWrapper? wrapper]) {
    _dio = Dio(BaseOptions(baseUrl: url));
    _appCheckWrapper = wrapper;
    _secureStorageWrapper = secureStorageWrapper;
  }
  Future<bool> checkForNewApiKey() async {
    String? apiKey = await _secureStorageWrapper.retriveApiKey();
    Response resp = await _dio.get("/update-required",
        options: Options(
            headers: {"authorization": "basic $apiKey"},
            contentType: "application/json",
            responseType: ResponseType.json));
    if (resp.statusCode == 200) {
      bool hasNewer = resp.data["hasNewer"];
      return hasNewer;
    }
    throw resp.statusCode.toString();
  }

  Future<void> getNewNewKey() async {
    //String token = await _appCheckWrapper!.getAppToken();
    Response resp = await _dio.get("/apiKey",
        options: Options(headers: {"X-AppCheck": "token"}));
    if (resp.statusCode == 200) {
      String apiKey = resp.data["key"];
      _secureStorageWrapper.saveApiKey(apiKey);
    }
  }

  ///Conveniece method to request a new key if available
  Future<void> updateIfNewKey() async {
    bool hasNew = await checkForNewApiKey();
    if (hasNew) {
      await getNewNewKey();
    }
  }
}
