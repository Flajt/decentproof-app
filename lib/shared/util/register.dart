import 'package:decentproof/features/verification/interfaces/IFileSelectionService.dart';
import 'package:decentproof/features/verification/interfaces/ISignatureVerifcationService.dart';
import 'package:decentproof/features/verification/interfaces/IVerificationService.dart';
import 'package:decentproof/features/verification/logic/FileSelectionService.dart';
import 'package:decentproof/features/verification/logic/SignatureVerificationService.dart';
import 'package:decentproof/features/verification/logic/VerificationService.dart';
import 'package:decentproof/shared/HashLogic.dart';
import 'package:decentproof/shared/integrety/SecureStorageWrapper.dart';
import 'package:decentproof/shared/integrety/interfaces/ISecureStorageService.dart';
import 'package:decentproof/shared/interface/IHashLogic.dart';
import 'package:get_it/get_it.dart';

/// Register classed for dependency injection
Future<void> registar() async {
  // Example:
  // GetIt.I.registerLazySingleton<ISecureStorageService>(() => SecureStorageService());

  final getIt = GetIt.I;
  getIt.registerFactory<ISecureStorageService>(() => SecureStorageService());
  getIt.registerFactory<ISignatureVerificationService>(
      () => SignatureVerificationService());
  getIt.registerFactory<IVerificationService>(() => VerificatinService());
  getIt.registerFactory<IFileSelectionService>(() => FileSelectionService());
  getIt.registerFactory<IHashLogic>(() => HashLogic());
}
