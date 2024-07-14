import 'package:decentproof/features/analytics/interfaces/IAnalyticsService.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:telemetrydecksdk/telemetrydecksdk.dart';

class TelemetryDeckWrapper implements IAnalyticsService {
  /// If events should be logged
  final bool debug;

  /// Sends events as test events
  final bool testMode;

  ///User identifier, will be hashed by TelemetryDeck
  final String? defaultUser;
  TelemetryDeckWrapper(
      {this.debug = false, this.testMode = false, this.defaultUser}) {
    final String appID = dotenv.env['TELEMETRY_APP_ID']!;
    Telemetrydecksdk.start(TelemetryManagerConfiguration(
        appID: appID,
        debug: debug,
        testMode: testMode,
        defaultUser: defaultUser));
  }
  @override
  Future<void> recordEvent(String singalType, Map<String, dynamic> payload,
      [String? user]) async {
    await Telemetrydecksdk.send(singalType,
        additionalPayload: payload, clientUser: user);
  }
}
