abstract class IAnalyticsService {
  Future<void> init();
  Future<void> recordEvent(String singalType, Map<String, dynamic> payload,
      [String? user]);
}
