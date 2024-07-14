import 'package:equatable/equatable.dart';

abstract class AnalyticsState extends Equatable {}

class InitialState extends AnalyticsState {
  @override
  List<Object> get props => [];
}

class HasLoggedEvent extends AnalyticsState {
  @override
  List<Object> get props => [];
}

class ErrorState extends AnalyticsState {
  final String message;
  final dynamic stack;
  ErrorState({required this.message, this.stack});
  @override
  List<Object> get props => [message, stack];
}
