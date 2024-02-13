import 'package:decentproof/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

Future<void> initSentry() async {
  await Sentry.init((options) {
    options.dsn = kReleaseMode ? SENTRY_DSN : "";
    options.sampleRate = .2;
    options.tracesSampleRate = .2;
    options.beforeSend = (event, {hint}) async {
      if (event.user?.ipAddress != null) {
        event = event.copyWith(user: event.user?.copyWith(ipAddress: null));
      }
      return event;
    };
  });
}
