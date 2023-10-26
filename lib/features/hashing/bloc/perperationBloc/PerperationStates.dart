import 'package:equatable/equatable.dart';

abstract class MetaDataState extends Equatable {}

class InitalPrepareBlocState extends MetaDataState {
  @override
  List<Object?> get props => [];
}

class PreparationHasError extends MetaDataState {
  final String errorMsg;

  PreparationHasError(this.errorMsg);
  @override
  List<Object?> get props => [errorMsg];
}

class PreparationIsSuccessfull extends MetaDataState {
  final String path;
  final String hash;

  PreparationIsSuccessfull(this.path, this.hash);
  @override
  List<Object?> get props => [hash, path];
}

class PrepareationIsAplyingWaterMark extends MetaDataState {
  @override
  List<Object?> get props => [];
}

class PrepareationIsHashing extends MetaDataState {
  @override
  List<Object?> get props => [];
}
