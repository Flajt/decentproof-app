import 'dart:math';

import 'package:decentproof/pages/Integrety/AppCheckWrapper.dart';
import 'package:decentproof/pages/Integrety/SecureStorageWrapper.dart';
import 'package:dio/dio.dart';

class ApiKeyManager {
  late final AppcheckWrapper? _appCheckWrapper;
  final String url = "localhost:80000";
  late final Dio _dio;
  late final SecureStorageWrapper _secureStorageWrapper;

  ApiKeyManager(SecureStorageWrapper secureStorageWrapper,
      [AppcheckWrapper? wrapper]) {
    _dio = Dio(BaseOptions(baseUrl: url));
    _appCheckWrapper = wrapper;
    _secureStorageWrapper = secureStorageWrapper;
  }
  Future<bool> hasApiKey() async =>
      (await _secureStorageWrapper.retriveApiKey()) != null ? true : false;

  Future<bool> checkForNewApiKey() async {
    String? apiKey = await _secureStorageWrapper.retriveApiKey();
    Response resp = await _dio.get("/update-required",
        options: Options(
            headers: {"authorization": "basic $apiKey"},
            responseType: ResponseType.json));
    if (resp.statusCode == 200) {
      bool hasNewer = resp.data["hasNewer"];
      return hasNewer;
    }
    throw resp.statusCode.toString();
  }

  Future<void> getNewNewKey(String token) async {
    String token = await _appCheckWrapper!.getAppToken();
    Response resp = await _dio.get("/apiKey",
        options: Options(headers: {"X-AppCheck": token}));
    if (resp.statusCode == 200) {
      String apiKey = resp.data["key"];
      _secureStorageWrapper.saveApiKey(apiKey);
    }
  }

  ///Conveniece method to request a new key if available
  ///TODO: Maybe refactor initial api key check out of this method
  Future<void> updateOrRetriveKey() async {
    assert(_appCheckWrapper != null);
    bool hasKey = await hasApiKey();
    if (hasKey) {
      //Used to prevent overwhelming the service with requsts for a new key, as soon as it's available
      if (Random().nextInt(2) == 1) {
        bool? hasNew = await checkForNewApiKey();
        if (hasNew) {
          String token = await _appCheckWrapper!.getAppToken();
          await getNewNewKey(token);
        }
      }
    } else {
      String token = await _appCheckWrapper!.getAppToken();
      await getNewNewKey(token);
    }
  }
}
