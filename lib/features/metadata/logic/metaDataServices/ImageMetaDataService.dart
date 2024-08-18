import 'dart:io';

import 'package:decentproof/constants.dart';
import 'package:decentproof/features/metadata/enum/BlockChainEnum.dart';
import 'package:decentproof/features/metadata/interfaces/IMetaDataService.dart';
import 'package:decentproof/features/metadata/models/LocationModel.dart';
import 'package:decentproof/features/metadata/models/MetaDataModel.dart';
import 'package:native_exif/native_exif.dart';

class ImageMetaDataService implements IMetaDataService {
  const ImageMetaDataService();
  bool? get _isIOS {
    if (Platform.isIOS) {
      return true;
    } else {
      if (Platform.isAndroid) {
        return false;
      } else {
        return null;
      }
    }
  }

  @override
  Future<String> addLocation(LocationModel locationModel, String filePath,
      BlockChain blockChain) async {
    print(filePath);
    print(_isIOS);
    print({(_isIOS! ? "FileSource" : "Software"): "Decentproof $DPM_VERSION"});
    if (_isIOS == null) {
      throw "Not supported on this platform";
    }
    Exif exif = await Exif.fromPath(filePath);
    await exif.writeAttributes({
      "GPSLatitude": locationModel.latitude,
      "GPSLongitude": locationModel.longitude,
      (_isIOS! ? "FileSource" : "Software"): "Decentproof $DPM_VERSION",
      "UserComment": blockChain.name
    });
    await exif.close();
    return filePath;
  }

  @override
  Future<String> addLocationAndSecret(LocationModel locationModel,
      String secretHash, String filePath, BlockChain blockChain) async {
    if (_isIOS == null) {
      throw "Not supported on this platform";
    }
    Exif exif = await Exif.fromPath(filePath);
    await exif.writeAttributes({
      "GPSLatitude": locationModel.latitude,
      "GPSLongitude": locationModel.longitude,
      _isIOS! ? "AuxOwnerName" : "Artist": secretHash,
      _isIOS! ? "FileSource" : "Software": "Decentproof $DPM_VERSION",
      "UserComment": blockChain.name
    });
    await exif.close();
    return filePath;
  }

  @override
  Future<String> addSecret(
      String secretHash, String filePath, BlockChain blockChain) async {
    if (_isIOS == null) {
      throw "Not supported on this platform";
    }
    Exif exif = await Exif.fromPath(filePath);
    await exif.writeAttributes({
      _isIOS! ? "AuxOwnerName" : "Artist": secretHash,
      _isIOS! ? "FileSource" : "Software": "Decentproof $DPM_VERSION",
      "UserComment": blockChain.name
    });
    await exif.close();
    return filePath;
  }

  @override
  Future<MetaDataModel> retriveMetaData(String filePath) async {
    if (_isIOS == null) {
      throw "Not supported on this platform";
    }
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
    if (data.containsKey("Artist") || data.containsKey("AuxOwnerName")) {
      if (!_isIOS!) {
        secretHash = data["Artist"] as String;
      } else {
        secretHash = data["AuxOwnerName"] as String;
      }
    }
    if (data.containsKey("GPSLatitude") && data.containsKey("GPSLongitude")) {
      location = LocationModel(
          latitude: data["GPSLatitude"] as double,
          longitude: data["GPSLongitude"] as double);
    }
    if (data.containsKey("Software") || data.containsKey("FileSource")) {
      if (!_isIOS!) {
        dpmVersion = data["Software"] as String;
        dpmVersion = dpmVersion.split(" ")[1];
      } else {
        dpmVersion = data["FileSource"] as String;
        dpmVersion = dpmVersion.split(" ")[1];
      }
    } else {
      throw "Invalid metadata!";
    }
    if (data.containsKey("UserComment")) {
      blockChain = BlockChain.values
          .firstWhere((chain) => chain.name == (data["UserComment"] as String));
    } else {
      throw "Invalid metadata!";
    }
    return MetaDataModel(secretHash, location, dpmVersion, blockChain);
  }
}
