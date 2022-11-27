import 'dart:convert';
import 'package:decentproof/pages/Integrety/SecureStorageWrapper.dart';
import 'package:dio/dio.dart';
import 'package:http_certificate_pinning/http_certificate_pinning.dart';

class MessageSigningService {
  late final String url = "https://1lwaux.deta.dev";
  late final Dio _dio;
  late final SecureStorageWrapper _secureStorageWrapper;

  MessageSigningService(SecureStorageWrapper wrapper) {
    _dio = Dio(BaseOptions(
      baseUrl: url,
    ))
      ..interceptors.add(CertificatePinningInterceptor(allowedSHAFingerprints: [
        "87:E7:EB:E3:B3:37:39:9D:4A:8F:A4:99:11:D4:A3:6B:49:D6:32:69:96:9B:16:88:82:94:5E:A7:9F:9E:E2:35"
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
