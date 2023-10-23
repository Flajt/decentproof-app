import 'package:decentproof/features/hashing/interfaces/IHashSubmissionService.dart';
import 'package:decentproof/features/hashing/logic/backend/HashSubmissionService.dart';
import 'package:decentproof/features/verification/interfaces/IFileSelectionService.dart';
import 'package:decentproof/features/verification/interfaces/ISignatureVerifcationService.dart';
import 'package:decentproof/features/verification/interfaces/IVerificationService.dart';
import 'package:decentproof/features/verification/logic/FileSelectionService.dart';
import 'package:decentproof/features/verification/logic/SignatureVerificationService.dart';
import 'package:decentproof/features/verification/logic/VerificationService.dart';
import 'package:decentproof/shared/HashLogic.dart';
import 'package:decentproof/shared/interface/IHashLogic.dart';
import 'package:get_it/get_it.dart';

import '../Integrety/SecureStorageWrapper.dart';
import '../Integrety/interfaces/ISecureStorageService.dart';

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
  getIt.registerFactory<IHashSubmissionService>(() => HashSubmissionService());
}
