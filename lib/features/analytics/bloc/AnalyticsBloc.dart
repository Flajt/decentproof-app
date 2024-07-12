import 'package:decentproof/features/analytics/bloc/AnalyticsEvents.dart';
import 'package:decentproof/features/analytics/bloc/AnalyticsStates.dart';
import 'package:decentproof/features/analytics/interfaces/IAnalyticsService.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class AnalyticsBloc extends Bloc<AnalyticsEvent, AnalyticsState> {
  final getIt = GetIt.I;
  late final IAnalyticsService _analytics = getIt.get<IAnalyticsService>();
  AnalyticsBloc(super.initialState) {
    on<LogEvent>((event, emit) {
      try {
        _analytics.recordEvent(event.name, event.parameters);
        emit(HasLoggedEvent());
      } catch (e, stack) {
        addError(e, stack);
        emit(ErrorState(message: e.toString(), stack: stack));
      }
    });
  }
}
