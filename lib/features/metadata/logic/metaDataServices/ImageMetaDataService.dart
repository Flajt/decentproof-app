import 'package:decentproof/constants.dart';
import 'package:decentproof/features/metadata/enum/BlockChainEnum.dart';
import 'package:decentproof/features/metadata/interfaces/IMetaDataService.dart';
import 'package:decentproof/features/metadata/models/LocationModel.dart';
import 'package:decentproof/features/metadata/models/MetaDataModel.dart';
import 'package:native_exif/native_exif.dart';

class ImageMetaDataService implements IMetaDataService {
  @override
  Future<String> addLocation(LocationModel locationModel, String filePath,
      BlockChain blockChain) async {
    Exif exif = await Exif.fromPath(filePath);
    await exif.writeAttributes({
      "GPSLatitude": locationModel.latitude,
      "GPSLongitude": locationModel.longitude,
      "_BlockChain": blockChain.name,
      "_dpm_version": DPM_VERSION
    });
    await exif.close();
    return filePath;
  }

  @override
  Future<String> addLocationAndSecret(LocationModel locationModel,
      String secretHash, String filePath, BlockChain blockChain) async {
    Exif exif = await Exif.fromPath(filePath);
    await exif.writeAttributes({
      "GPSLatitude": locationModel.latitude,
      "GPSLongitude": locationModel.longitude,
      "UserComment": secretHash,
      "_BlockChain": blockChain.name,
      "_dpm_version": DPM_VERSION
    });
    await exif.close();
    return filePath;
  }

  @override
  Future<String> addSecret(
      String secretHash, String filePath, BlockChain blockChain) async {
    Exif exif = await Exif.fromPath(filePath);
    await exif.writeAttributes({
      "UserComment": secretHash,
      "_BlockChain": blockChain.name,
      "_dpm_version": DPM_VERSION
    });
    await exif.close();
    return filePath;
  }

  @override
  Future<MetaDataModel> retriveMetaData(String filePath) async {
    String? secretHash;
    LocationModel? location;
    String? dpmVersion;
    BlockChain? blockChain;
    Exif exif = await Exif.fromPath(filePath);
    Map<String, Object>? data = await exif.getAttributes();
    await exif.close();
    if (data == null) {
      throw "No Metadata found!";
    }
    if (data.containsKey("UserComment")) {
      secretHash = data["UserComment"] as String;
    }
    if (data.containsKey("GPSLatitude") && data.containsKey("GPSLongitude")) {
      location = LocationModel(
          latitude: data["GPSLatitude"] as double,
          longitude: data["GPSLongitude"] as double);
    }
    if (data.containsKey("_BlockChain")) {
      blockChain = BlockChain.values
          .firstWhere((element) => element.name == data["_BlockChain"]);
    }
    if (data.containsKey("_dpm_version")) {
      dpmVersion = data["_dpm_version"] as String;
    }
    return MetaDataModel(secretHash, location, dpmVersion!, blockChain!);
  }
}
