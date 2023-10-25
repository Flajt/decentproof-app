import 'package:equatable/equatable.dart';

abstract class MetaDataState extends Equatable {}

class InitalMetdataBlocState extends MetaDataState {
  @override
  List<Object?> get props => [];
}

class MetaDataHasError extends MetaDataState {
  final String errorMsg;

  MetaDataHasError(this.errorMsg);
  @override
  List<Object?> get props => [errorMsg];
}

class MetaDataIsSuccessfull extends MetaDataState {
  final String path;
  final String hash;

  MetaDataIsSuccessfull(this.path, this.hash);
  @override
  List<Object?> get props => [hash, path];
}

class MetaDataIsAplyingWaterMark extends MetaDataState {
  @override
  List<Object?> get props => [];
}

class MetaDataIsHashing extends MetaDataState {
  @override
  List<Object?> get props => [];
}
