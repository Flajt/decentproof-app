import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class MetricsBlocObserver extends BlocObserver {
  @override
  Future<void> onError(
      BlocBase bloc, Object error, StackTrace stackTrace) async {
    await Sentry.captureException(error, stackTrace: stackTrace);
    super.onError(bloc, error, stackTrace);
  }
}
