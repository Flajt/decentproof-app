//abstract state

abstract class SettingsBlocStates {}

class InitialSecureStorageState extends SettingsBlocStates {}

class ErrorState extends SettingsBlocStates {
  final String errorMessage;

  ErrorState(this.errorMessage);
}

class EmailSavedState extends SettingsBlocStates {
  final String email;

  EmailSavedState(this.email);
}

class SecretSavedState extends SettingsBlocStates {}

class LocationEmbeddingPermissionModified extends SettingsBlocStates {}

class SecretEmbeddingPermissionModified extends SettingsBlocStates {}
