import 'dart:io';
import 'package:image/image.dart' as img;

import 'package:decentproof/constants.dart';
import 'package:decentproof/features/metadata/enum/BlockChainEnum.dart';
import 'package:decentproof/features/metadata/interfaces/IMetaDataService.dart';
import 'package:decentproof/features/metadata/models/LocationModel.dart';
import 'package:decentproof/features/metadata/models/MetaDataModel.dart';

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
    if (_isIOS == null) {
      throw "Not supported on this platform";
    }
    final image = (await img.decodeJpgFile(filePath))!;
    image.exif.imageIfd.software = "Decentproof $DPM_VERSION";
    image.exif.imageIfd.userComment = blockChain.name;
    image.exif.gpsIfd.setGpsLocation(
        latitude: locationModel.latitude, longitude: locationModel.longitude);
    await img.encodeJpgFile(filePath, image);
    return filePath;
  }

  @override
  Future<String> addLocationAndSecret(LocationModel locationModel,
      String secretHash, String filePath, BlockChain blockChain) async {
    if (_isIOS == null) {
      throw "Not supported on this platform";
    }
    final image = (await img.decodeJpgFile(filePath))!;
    image.exif.imageIfd.software = "Decentproof $DPM_VERSION";
    image.exif.imageIfd.userComment = blockChain.name;
    image.exif.gpsIfd.setGpsLocation(
        latitude: locationModel.latitude, longitude: locationModel.longitude);
    //TODO add artist tag with secrets
    await img.encodeJpgFile(filePath, image);
    return filePath;
  }

  @override
  Future<String> addSecret(
      String secretHash, String filePath, BlockChain blockChain) async {
    if (_isIOS == null) {
      throw "Not supported on this platform";
    }
    final image = (await img.decodeJpgFile(filePath))!;
    image.exif.imageIfd.software = "Decentproof $DPM_VERSION";
    image.exif.imageIfd.userComment = blockChain.name;
    //TODO add artist tag with secrets
    await img.encodeJpgFile(filePath, image);
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
    final image = (await img.decodeJpgFile(filePath))!;
    img.ExifData data = image.exif;
    if (data.isEmpty) {
      throw "No Metadata found!";
    }
    //TODO: Check for aritst tag
    if (data.gpsIfd.hasGPSLatitude && data.gpsIfd.hasGPSLongitude) {
      location = LocationModel(
          latitude: data.gpsIfd.gpsLatitude!,
          longitude: data.gpsIfd.gpsLongitude!);
    }
    if (data.imageIfd.hasSoftware) {
      dpmVersion = data.imageIfd.software!;
      dpmVersion = dpmVersion.split(" ")[1];
    } else {
      throw "No DPM Version found!";
    }
    if (data.imageIfd.hasUserComment) {
      blockChain = BlockChain.values.firstWhere(
          (chain) => chain.name == (data.imageIfd.userComment as String));
    } else {
      throw "No Blockchain found!";
    }
    return MetaDataModel(secretHash, location, dpmVersion, blockChain);
  }

  @override
  Future<String> addBasicMetaData(
      String filePath, BlockChain blockChain) async {
    final image = (await img.decodeJpgFile(filePath))!;
    image.exif.imageIfd.software = "Decentproof $DPM_VERSION";
    image.exif.imageIfd.userComment = blockChain.name;
    await img.encodeJpgFile(filePath, image);
    return filePath;
  }
}
