import 'dart:convert';
import 'package:decentproof/features/hashing/interfaces/IHashSubmissionService.dart';
import 'package:decentproof/shared/Integrety/interfaces/ISecureStorageService.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

class HashSubmissionService implements IHashSubmissionService {
  late final Dio _dio;
  final GetIt _getIt = GetIt.instance;
  late final ISecureStorageService _secureStorageService;
  final String url;

  HashSubmissionService({Dio? dio, required this.url}) {
    _secureStorageService = _getIt.get<ISecureStorageService>();
    _dio = dio ?? Dio(BaseOptions(baseUrl: url));
  }

  @override
  Future<void> submitHash(String hash, String? email) async {
    String? apiKey = await _secureStorageService.retriveApiKey();
    if (apiKey == null) {
      throw "No API KEY";
    }
    Response resp = await _dio.post("/",
        data: jsonEncode({"data": hash, "email": email ?? ""}),
        options: Options(headers: {"Authorization": "basic $apiKey"}));
    if (resp.statusCode != 200) throw resp.statusCode.toString();
  }
}
