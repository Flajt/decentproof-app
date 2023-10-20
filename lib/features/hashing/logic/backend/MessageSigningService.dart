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
    ));
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
