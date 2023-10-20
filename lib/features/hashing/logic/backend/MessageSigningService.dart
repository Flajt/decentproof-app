import 'dart:convert';
import 'package:decentproof/constants.dart';
import 'package:decentproof/shared/Integrety/interfaces/ISecureStorageService.dart';
import 'package:dio/dio.dart';
import 'package:http_certificate_pinning/http_certificate_pinning.dart';

class MessageSigningService {
  late final String url = SIGN_URL;
  late final Dio _dio;
  late final ISecureStorageService _secureStorageService;

  MessageSigningService(ISecureStorageService secureStorageService) {
    _dio = Dio(BaseOptions(
      baseUrl: url,
    ))
      ..interceptors.add(CertificatePinningInterceptor(allowedSHAFingerprints: [
        "72:13:F7:54:38:CF:61:25:AB:90:09:B4:0A:B9:76:C6:AD:DB:89:15:E5:E4:8B:92:8E:0D:A7:0B:28:6D:DB:BD"
      ], timeout: 30));
    _secureStorageService = secureStorageService;
  }
  Future<String> signMessage(String hash, DateTime dateTime) async {
    String message = "Hash:$hash App:DecentProof v:0 DateTime:$dateTime";
    String? apiKey = await _secureStorageService.retriveApiKey();
    if (apiKey == null) {
      throw "No API KEY";
    }
    Response resp = await _dio.post("/",
        data: jsonEncode({"data": message}),
        options: Options(headers: {"Authorization": "basic $apiKey"}));
    if (resp.statusCode == 200) {
      return resp.data["signature"];
    }
    throw resp.statusCode.toString();
  }
}
