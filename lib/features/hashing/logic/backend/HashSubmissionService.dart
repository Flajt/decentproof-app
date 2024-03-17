import 'dart:convert';
import 'package:decentproof/features/hashing/interfaces/IHashSubmissionService.dart';
import 'package:decentproof/shared/Integrety/interfaces/ISecureStorageService.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

class HashSubmissionService implements IHashSubmissionService {
  final GetIt _getIt = GetIt.instance;
  late final bool isDebug;
  late final ISecureStorageService _secureStorageService;
  final String url;

  HashSubmissionService({required this.url, this.isDebug = false}) {
    _secureStorageService = _getIt.get<ISecureStorageService>();
  }

  @override
  Future<void> submitHash(String hash, String? email) async {
    String? apiKey = await _secureStorageService.retriveApiKey();
    if (apiKey == null && !isDebug) {
      throw "NO API KEY";
    } else if (kDebugMode) {
      apiKey = "DEBUG-KEY-PLACEHOLDER";
    }
    http.Response resp = await http.post(Uri.parse("$url/"),
        body: jsonEncode({"data": hash, "email": email ?? ""}),
        headers: {
          "Authorization": "basic $apiKey",
          "Content-Type": "application/json"
        });
    if (resp.statusCode != 200) throw resp.statusCode.toString();
  }
}
