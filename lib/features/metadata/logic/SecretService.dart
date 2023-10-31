import 'dart:typed_data';

import 'package:decentproof/features/metadata/interfaces/ISecretService.dart';
import 'package:decentproof/shared/Integrety/interfaces/ISecureStorageService.dart';
import 'package:get_it/get_it.dart';

class SecretService implements ISercretService {
  final GetIt _getIt = GetIt.I;
  late final ISecureStorageService _secureStorageService;
  SecretService() {
    _secureStorageService = _getIt.get<ISecureStorageService>();
  }
  @override
  Future<void> saveSecret(String secret) async {
    await _secureStorageService.saveSecret(secret);
  }

  @override
  Future<Uint8List> get secret async {
    String? secret = await _secureStorageService.retriveSecret();
    if (secret == null) {
      throw Exception("Secret is null");
    }
    return Uint8List.fromList(secret.codeUnits);
  }
}
