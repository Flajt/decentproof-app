//abstract state

import 'package:equatable/equatable.dart';

abstract class SettingsBlocStates extends Equatable {}

class InitialSecureStorageState extends SettingsBlocStates {
  @override
  List<Object?> get props => [];
}

class ErrorState extends SettingsBlocStates {
  final String errorMessage;

  ErrorState(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}

class EmailSavedState extends SettingsBlocStates {
  final String email;

  EmailSavedState(this.email);

  @override
  List<Object?> get props => [email];
}

class EmailDeletedState extends SettingsBlocStates {
  @override
  List<Object?> get props => [];
}

class SecretSavedState extends SettingsBlocStates {
  @override
  List<Object?> get props => [];
}

class LocationEmbeddingPermissionModified extends SettingsBlocStates {
  final bool permission;
  LocationEmbeddingPermissionModified({required this.permission});
  @override
  List<Object?> get props => [permission];
}

class SecretEmbeddingPermissionModified extends SettingsBlocStates {
  @override
  List<Object?> get props => [];
}
