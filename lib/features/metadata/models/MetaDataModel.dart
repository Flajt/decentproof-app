import 'package:decentproof/features/metadata/models/LocationModel.dart';
import 'package:equatable/equatable.dart';

class MetaDataModel extends Equatable {
  final String? secretHash;
  final LocationModel? location;

  const MetaDataModel(this.secretHash, this.location);

  @override
  List<Object?> get props => [secretHash, location];
}
