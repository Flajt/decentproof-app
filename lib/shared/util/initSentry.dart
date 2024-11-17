import 'package:decentproof/constants.dart';
import 'package:decentproof/features/settings/interfaces/ISettingsStorageService.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

Future<void> initSentry() async {
  final settingsStorageSerivce = GetIt.I.get<ISettingsStorageSerivce>();
  bool canReport =
      await settingsStorageSerivce.getErrorReportingPermissionState();
  await SentryFlutter.init((options) {
    options.dsn = kReleaseMode
        ? canReport
            ? SENTRY_DSN
            : ""
        : "";
    options.sampleRate = .2;
    options.tracesSampleRate = .2;
    options.beforeSend = (event, hint) async {
      if (event.user?.ipAddress != null) {
        event = event.copyWith(user: event.user?.copyWith(ipAddress: null));
      }
      return event;
    };
  });
}
