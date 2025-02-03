import 'package:decentproof/features/metadata/enum/BlockChainEnum.dart';
import 'package:decentproof/features/metadata/models/LocationModel.dart';
import 'package:equatable/equatable.dart';

class MetaDataModel extends Equatable {
  final String? secretHash;
  final LocationModel? location;
  final String dpmVersion;
  final BlockChain blockChain;

  const MetaDataModel(
      this.secretHash, this.location, this.dpmVersion, this.blockChain);

  Map<String, dynamic> toJson() {
    return {
      "secretHash": secretHash,
      "locationModel": {
        "latitude": location?.latitude,
        "longitude": location?.longitude
      },
      "_dpm_version": dpmVersion,
      "_blockchain": blockChain.name
    };
  }

  MetaDataModel.fromJson(Map<String, dynamic> json)
      : secretHash = json["secretHash"],
        location = json["locationModel"]["latitude"] != null
            ? LocationModel(
                // consider creation of from & toJson met
                latitude: json["locationModel"]["latitude"],
                longitude: json["locationModel"]["longitude"],
              )
            : null,
        dpmVersion = json["_dpm_version"],
        blockChain = BlockChain.values
            .firstWhere((element) => element.name == json["_blockchain"]);

  @override
  List<Object?> get props => [secretHash, location];
}
