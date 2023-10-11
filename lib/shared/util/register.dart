import 'package:decentproof/shared/integrety/SecureStorageWrapper.dart';
import 'package:decentproof/shared/integrety/interfaces/ISecureStorageService.dart';
import 'package:get_it/get_it.dart';

/// Register classed for dependency injection
Future<void> registar() async {
  // Example:
  // GetIt.I.registerLazySingleton<ISecureStorageService>(() => SecureStorageService());

  final getIt = GetIt.I;
  getIt.registerFactory<ISecureStorageService>(() => SecureStorageService());
}
