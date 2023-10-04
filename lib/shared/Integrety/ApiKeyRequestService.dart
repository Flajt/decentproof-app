import 'package:decentproof/constants.dart';
import 'package:decentproof/shared/integrety/interfaces/IApiKeyRequestService.dart';
import 'package:dio/dio.dart';
import 'package:http_certificate_pinning/http_certificate_pinning.dart';

class ApiKeyRequestService implements IApiKeyRequestService {
  late final Dio _checkKeyRequestManager;
  late final Dio _getKeyRequestManager;

  ApiKeyRequestService() {
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
  }
  @override
  Future<bool> checkForNewApiKey(String? apiKey) async {
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

  @override
  Future<String> getNewNewKey(String token) async {
    Response resp = await _getKeyRequestManager.get("/",
        options: Options(headers: {
          "X-AppCheck": token,
        }));
    if (resp.statusCode == 200) {
      String apiKey = resp.data["key"];
      return apiKey;
    } else {
      throw "${resp.statusCode.toString()} + ${resp.statusMessage ?? "Possible Invalid device!"}";
    }
  }
}
