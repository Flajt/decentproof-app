import 'dart:convert';

import 'package:decentproof/constants.dart';
import 'package:decentproof/features/verification/interfaces/ISignatureVerifcationService.dart';
import 'package:decentproof/features/verification/interfaces/IVerificationService.dart';
import 'package:decentproof/features/verification/models/VerificationStatusResponse.dart';
import 'package:decentproof/shared/Integrety/interfaces/ISecureStorageService.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../models/VerificationStatusModel.dart';

/// Service for file verification
/// It uses the backend to retrive verifcation data and analyzes them locally
/// Depends on: [ISecureStorageService] [ISignatureVerificationService]
class VerificatinService implements IVerificationService {
  final _dio = Dio();
  final _getIt = GetIt.I;
  late final ISignatureVerificationService _signatureVerificationService;
  late final ISecureStorageService _secureStorageService;
  VerificatinService() {
    _secureStorageService = _getIt.get<ISecureStorageService>();
    _signatureVerificationService = _getIt.get<ISignatureVerificationService>();
  }
  @override
  Future<VerificationStatusModel> verify(String hash) async {
    String? apiKey = await _secureStorageService.retriveApiKey();
    if (apiKey == null) {
      throw "No API KEY";
    }
    Map<String, dynamic> body = {"hash": hash};

    Response resp = await _dio.post(VERIFY_URL,
        data: jsonEncode(body),
        options: Options(headers: {
          "Authorization": "basic $apiKey",
          "Content-Type": "application/json"
        }));
    if (resp.statusCode == 200) {
      VerificationStatusResponsModel responseModel =
          VerificationStatusResponsModel.fromJson(resp.data);
      VerificationStatusModel statusModel = VerificationStatusModel(
          hash == responseModel.data.hashString,
          await verifySignature(hash, responseModel.data.comment),
          DateTime.fromMillisecondsSinceEpoch(responseModel.data.dateCreated),
          responseModel.data.timestamps[0].submitStatus,
          responseModel.data.timestamps[0].transaction);
      return statusModel;
    } else {
      throw "${resp.statusCode}: ${resp.statusMessage}";
    }
  }

  @override
  Future<bool> verifySignature(String hash, String signature) async {
    return _signatureVerificationService.verify(hash, signature);
  }
}
