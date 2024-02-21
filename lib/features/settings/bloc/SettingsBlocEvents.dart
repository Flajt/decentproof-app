import 'dart:typed_data';

import 'package:equatable/equatable.dart';

abstract class SettingsBlocEvents extends Equatable {}

//Save E-Mail Event
class SaveEmailEvent extends SettingsBlocEvents {
  final String email;
  SaveEmailEvent(this.email);

  @override
  List<Object?> get props => [email];
}

class SaveSecretEvent extends SettingsBlocEvents {
  final Uint8List secret;
  SaveSecretEvent(this.secret);
  @override
  List<Object?> get props => [secret];
}

class ModifyLocationEmbeddingPermission extends SettingsBlocEvents {
  final bool permission;
  ModifyLocationEmbeddingPermission(this.permission);
  @override
  List<Object?> get props => [permission];
}

class ModifySecretEmbeddingPermission extends SettingsBlocEvents {
  final bool permission;
  ModifySecretEmbeddingPermission(this.permission);
  @override
  List<Object?> get props => [permission];
}

class DeleteEmail extends SettingsBlocEvents {
  @override
  List<Object?> get props => [];
}
