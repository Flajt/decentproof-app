import 'package:decentproof/features/analytics/logic/TelemetryDeckWrapper.dart';
import 'package:decentproof/shared/Integrety/interfaces/ISecureStorageService.dart';
import 'package:get_it/get_it.dart';

/// Used to fetch identifier, anonymize it if not already done by analytics provider and register the analytics provider
Future<void> registerAnalytics() async {
  final getIt = GetIt.I;
  String? email = await getIt.get<ISecureStorageService>().retriveEmail();
  getIt.registerSingleton(TelemetryDeckWrapper(defaultUser: email));
}
