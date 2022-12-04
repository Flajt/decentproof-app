import 'dart:convert';
import 'package:decentproof/constants.dart';
import 'package:decentproof/pages/Integrety/SecureStorageWrapper.dart';
import 'package:dio/dio.dart';
import 'package:http_certificate_pinning/http_certificate_pinning.dart';

class MessageSigningService {
  late final String url = SIGN_URL;
  late final Dio _dio;
  late final SecureStorageWrapper _secureStorageWrapper;

  MessageSigningService(SecureStorageWrapper wrapper) {
    _dio = Dio(BaseOptions(
      baseUrl: url,
    ))
      ..interceptors.add(CertificatePinningInterceptor(allowedSHAFingerprints: [
        "8E:2C:79:AA:6C:A9:E8:1A:86:A6:6F:59:F8:FB:7A:B8:B1:93:73:15:03:22:59:50:6C:3D:C5:C4:C6:AB:38:E3"
      ], timeout: 20));
    _secureStorageWrapper = wrapper;
  }
  Future<String> signMessage(String hash, DateTime dateTime) async {
    String message = "Hash:$hash App:DecentProof v:0 DateTime:$dateTime";
    String? apiKey = await _secureStorageWrapper.retriveApiKey();
    Response resp = await _dio.post("$url/sign",
        data: jsonEncode({"data": message}),
        options: Options(headers: {"Authorization": "basic $apiKey"}));
    if (resp.statusCode == 200) {
      return resp.data["signature"];
    }
    throw resp.statusCode.toString();
  }
}
