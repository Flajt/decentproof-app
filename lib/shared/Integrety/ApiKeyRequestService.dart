import 'dart:convert';

import 'package:decentproof/constants.dart';
import 'package:dio/dio.dart';

import 'interfaces/IApiKeyRequestService.dart';

class ApiKeyRequestService implements IApiKeyRequestService {
  late final Dio _checkKeyRequestManager;
  late final Dio _getKeyRequestManager;

  ApiKeyRequestService() {
    //TODO: Provide URL via class constructor?
    _checkKeyRequestManager = Dio(BaseOptions(baseUrl: CHECK_KEY_URL));

    _getKeyRequestManager = Dio(BaseOptions(baseUrl: GET_KEY_URL));
  }
  @override
  Future<bool> checkForNewApiKey(String? apiKey) async {
    Response resp = await _checkKeyRequestManager.get("/",
        options: Options(headers: {
          "authorization": "basic $apiKey",
          "Content-Type": "application/json"
        }, responseType: ResponseType.json));
    if (resp.statusCode == 200) {
      bool hasNewer = jsonDecode(resp.data)["hasNewKey"];
      return hasNewer;
    }
    throw resp.statusCode.toString();
  }

  @override
  Future<String> getNewNewKey(String token) async {
    Response resp = await _getKeyRequestManager.get("/",
        options: Options(headers: {
          "X-AppCheck": token,
        }));
    if (resp.statusCode == 200) {
      String apiKey = resp.data;
      return apiKey;
    } else {
      throw "${resp.statusCode.toString()} + ${resp.statusMessage ?? "Possible Invalid device!"}";
    }
  }
}
