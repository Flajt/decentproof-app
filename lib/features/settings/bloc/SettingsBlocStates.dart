//abstract state

import 'package:equatable/equatable.dart';

abstract class SettingsBlocStates extends Equatable {
  const SettingsBlocStates();
}

class InitialSettingsState extends SettingsBlocStates {
  const InitialSettingsState();
  @override
  List<Object?> get props => [];
}

class UpdatedSettingsState extends SettingsBlocStates {
  final bool hasEmail;
  final bool locationEmbeddingPermission;
  final bool secretEmbeddingPermission;
  final bool errorReportingPermission;

  const UpdatedSettingsState({
    this.hasEmail = false,
    this.locationEmbeddingPermission = false,
    this.secretEmbeddingPermission = false,
    this.errorReportingPermission = false,
  });
  @override
  String toString() {
    return "UpdatedSettingsState{hasEmail: $hasEmail, locationEmbeddingPermission: $locationEmbeddingPermission, secretEmbeddingPermission: $secretEmbeddingPermission, errorReportingPermission: $errorReportingPermission}";
  }

  @override
  List<Object?> get props => [
        hasEmail,
        locationEmbeddingPermission,
        secretEmbeddingPermission,
        errorReportingPermission
      ];
  UpdatedSettingsState copyWith(
      {bool? hasEmail,
      bool? locationEmbeddingPermission,
      bool? secretEmbeddingPermission,
      bool? errorReportingPermission}) {
    return UpdatedSettingsState(
        hasEmail: hasEmail ?? this.hasEmail,
        locationEmbeddingPermission:
            locationEmbeddingPermission ?? this.locationEmbeddingPermission,
        secretEmbeddingPermission:
            secretEmbeddingPermission ?? this.secretEmbeddingPermission,
        errorReportingPermission:
            errorReportingPermission ?? this.errorReportingPermission);
  }
}

class ErrorState extends SettingsBlocStates {
  final String errorMessage;

  const ErrorState(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
