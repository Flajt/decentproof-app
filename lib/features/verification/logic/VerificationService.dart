import 'dart:convert';

import 'package:decentproof/features/verification/interfaces/ISignatureVerifcationService.dart';
import 'package:decentproof/features/verification/interfaces/IVerificationService.dart';
import 'package:decentproof/features/verification/models/VerificationStatusResponse.dart';
import 'package:decentproof/shared/Integrety/interfaces/ISecureStorageService.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import '../models/VerificationStatusModel.dart';

/// Service for file verification
/// It uses the backend to retrive verifcation data and analyzes them locally
/// Depends on: [ISecureStorageService] & [ISignatureVerificationService]
class VerificationService implements IVerificationService {
  final String url;
  final _getIt = GetIt.I;
  late final ISignatureVerificationService _signatureVerificationService;
  late final ISecureStorageService _secureStorageService;
  VerificationService({required this.url}) {
    _secureStorageService = _getIt.get<ISecureStorageService>();
    _signatureVerificationService = _getIt.get<ISignatureVerificationService>();
  }

  @override
  Future<VerificationStatusModel> verify(String hash) async {
    String? apiKey = await _secureStorageService.retriveApiKey();
    if (apiKey == null) {
      throw Exception("NO API KEY");
    }
    Map<String, dynamic> body = {"hash": hash};

    http.Response resp = await http.post(Uri.parse("$url/"),
        body: jsonEncode(body),
        headers: {
          "Authorization": "basic $apiKey",
          "Content-Type": "application/json"
        });
    if (resp.statusCode == 200) {
      VerificationStatusResponsModel responseModel =
          VerificationStatusResponsModel.fromJson(jsonDecode(resp.body));
      bool isValidSignature =
          await verifySignature(hash, responseModel.data.comment);
      VerificationStatusModel statusModel = VerificationStatusModel(
          hash == responseModel.data.hashString,
          isValidSignature,
          DateTime.fromMillisecondsSinceEpoch(responseModel.data.dateCreated),
          responseModel.data.timestamps[0].submitStatus,
          responseModel.data.timestamps[0].transaction,
          null);
      return statusModel;
    } else {
      throw Exception(
          "${resp.statusCode}: ${jsonDecode(resp.body)['error_code']}");
    }
  }

  @override
  Future<bool> verifySignature(String hash, String signature) async {
    return _signatureVerificationService.verify(hash, signature);
  }
}
