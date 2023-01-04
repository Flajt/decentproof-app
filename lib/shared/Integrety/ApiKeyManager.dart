import 'dart:convert';
import 'dart:math';

import 'package:decentproof/constants.dart';
import 'package:decentproof/shared/Integrety/AppCheckWrapper.dart';
import 'package:decentproof/shared/Integrety/SecureStorageWrapper.dart';
import 'package:dio/dio.dart';
import 'package:http_certificate_pinning/http_certificate_pinning.dart';

class ApiKeyManager {
  late final AppcheckWrapper? _appCheckWrapper;
  late final Dio _checkKeyRequestManager;
  late final Dio _getKeyRequestManager;
  late final SecureStorageWrapper _secureStorageWrapper;

  ApiKeyManager(SecureStorageWrapper secureStorageWrapper,
      [AppcheckWrapper? wrapper]) {
    //TODO: Provide URL via class constructor?
    _checkKeyRequestManager = Dio(BaseOptions(baseUrl: CHECK_KEY_URL));
    _checkKeyRequestManager.interceptors
        .add(CertificatePinningInterceptor(allowedSHAFingerprints: [
      "72:13:F7:54:38:CF:61:25:AB:90:09:B4:0A:B9:76:C6:AD:DB:89:15:E5:E4:8B:92:8E:0D:A7:0B:28:6D:DB:BD"
    ]));
    _getKeyRequestManager = Dio(BaseOptions(baseUrl: GET_KEY_URL));
    _getKeyRequestManager.interceptors
        .add(CertificatePinningInterceptor(allowedSHAFingerprints: [
      "72:13:F7:54:38:CF:61:25:AB:90:09:B4:0A:B9:76:C6:AD:DB:89:15:E5:E4:8B:92:8E:0D:A7:0B:28:6D:DB:BD"
    ]));
    _appCheckWrapper = wrapper;
    _secureStorageWrapper = secureStorageWrapper;
  }
  Future<bool> hasApiKey() async =>
      (await _secureStorageWrapper.retriveApiKey()) != null ? true : false;

  Future<bool> checkForNewApiKey() async {
    String? apiKey = await _secureStorageWrapper.retriveApiKey();
    Response resp = await _checkKeyRequestManager.get("/",
        options: Options(headers: {
          "authorization": "basic $apiKey",
          "Content-Type": "application/json"
        }, responseType: ResponseType.json));
    if (resp.statusCode == 200) {
      bool hasNewer = resp.data["hasNewer"];
      return hasNewer;
    }
    throw resp.statusCode.toString();
  }

  Future<void> getNewNewKey(String token) async {
    Response resp = await _getKeyRequestManager.get("/",
        options: Options(headers: {
          "X-AppCheck": token,
        }));
    if (resp.statusCode == 200) {
      String apiKey = resp.data["key"];
      _secureStorageWrapper.saveApiKey(apiKey);
    } else {
      throw "${resp.statusCode.toString()} + ${resp.statusMessage ?? "Possible Invalid device!"}";
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
        bool hasNew = await checkForNewApiKey();
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
