import 'package:decentproof/features/metadata/models/LocationModel.dart';
import 'package:equatable/equatable.dart';

class MetaDataModel extends Equatable {
  final String? secretHash;
  final LocationModel? location;

  const MetaDataModel(this.secretHash, this.location);

  Map<String, dynamic> toJson() {
    return {
      "secretHash": secretHash,
      "locationModel": {
        "latitude": location?.latitude,
        "longitude": location?.longitude
      }
    };
  }

  MetaDataModel.fromJson(Map<String, dynamic> json)
      : secretHash = json["secretHash"],
        location = json["locationModel"]["latitude"] != null
            ? LocationModel(
                // consider creation of from & toJson met
                latitude: json["locationModel"]["latitude"],
                longitude: json["locationModel"]["longitude"])
            : null;

  @override
  List<Object?> get props => [secretHash, location];
}
