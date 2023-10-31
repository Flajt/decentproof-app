abstract class LocationWarningState {}

class LocationServiceEnabled implements LocationWarningState {}

class LocationServiceDisabled implements LocationWarningState {}

class LocationServiceHasError implements LocationWarningState {
  final String message;
  LocationServiceHasError(this.message);
}
