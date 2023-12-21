import 'package:equatable/equatable.dart';

abstract class LocationWarningState extends Equatable {}

class LocationServiceEnabled extends LocationWarningState {
  @override
  List<Object?> get props => [];
}

class LocationServiceDisabled extends LocationWarningState {
  @override
  List<Object?> get props => [];
}

class LocationServiceHasError extends LocationWarningState {
  final String message;
  LocationServiceHasError(this.message);

  @override
  List<Object?> get props => [message];
}
