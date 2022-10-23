import 'dart:convert';
import 'package:decentproof/pages/Integrety/SecureStorageWrapper.dart';
import 'package:dio/dio.dart';

class MessageSigningService {
  late final String url = "http://192.168.0.2:8000";
  late final Dio _dio;
  late final SecureStorageWrapper _secureStorageWrapper;

  MessageSigningService(SecureStorageWrapper wrapper) {
    _dio = Dio(BaseOptions(baseUrl: url));
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
