abstract class AnalyticsEvent {}

class LogEvent extends AnalyticsEvent {
  final String name;
  final Map<String, dynamic> parameters;
  LogEvent({required this.name, required this.parameters});
}
