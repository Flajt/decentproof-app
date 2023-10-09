//abstract state

abstract class SecureStorageState {}

class InitialSecureStorageState extends SecureStorageState {}

class ErrorState extends SecureStorageState {
  final String errorMessage;

  ErrorState(this.errorMessage);
}

class EmailSavedState extends SecureStorageState {
  final String email;

  EmailSavedState(this.email);
}
