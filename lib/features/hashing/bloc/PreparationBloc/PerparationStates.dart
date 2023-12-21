import 'package:equatable/equatable.dart';

abstract class PreparationState extends Equatable {}

class InitalPrepareBlocState extends PreparationState {
  @override
  List<Object?> get props => [];
}

class PreparationHasError extends PreparationState {
  final String errorMsg;

  PreparationHasError(this.errorMsg);
  @override
  List<Object?> get props => [errorMsg];
}

class PreparationIsSuccessfull extends PreparationState {
  final String path;
  final String hash;

  PreparationIsSuccessfull(this.path, this.hash);
  @override
  List<Object?> get props => [hash, path];
}

class PrepareationIsAplyingWaterMark extends PreparationState {
  @override
  List<Object?> get props => [];
}

class PrepareationIsHashing extends PreparationState {
  @override
  List<Object?> get props => [];
}

class PrepareationIsAddingMetaData extends PreparationState {
  @override
  List<Object?> get props => [];
}
