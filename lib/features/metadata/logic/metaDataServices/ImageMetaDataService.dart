import 'package:decentproof/features/metadata/interfaces/IMetaDataService.dart';
import 'package:decentproof/features/metadata/models/LocationModel.dart';
import 'package:decentproof/features/metadata/models/MetaDataModel.dart';
import 'package:native_exif/native_exif.dart';

class ImageMetaDataService implements IMetaDataService {
  @override
  Future<String> addLocation(
      LocationModel locationModel, String filePath) async {
    Exif exif = await Exif.fromPath(filePath);
    await exif.writeAttributes({
      "GPSLatitude": locationModel.latitude,
      "GPSLongitude": locationModel.longitude
    });
    await exif.close();
    return filePath;
  }

  @override
  Future<String> addLocationAndSecret(
      LocationModel locationModel, String secretHash, String filePath) async {
    Exif exif = await Exif.fromPath(filePath);
    await exif.writeAttributes({
      "GPSLatitude": locationModel.latitude,
      "GPSLongitude": locationModel.longitude,
      "UserComment": secretHash
    });
    await exif.close();
    return filePath;
  }

  @override
  Future<String> addSecret(String secretHash, String filePath) async {
    Exif exif = await Exif.fromPath(filePath);
    await exif.writeAttribute("UserComment", secretHash);
    await exif.close();
    return filePath;
  }

  @override
  Future<MetaDataModel> retriveMetaData(String filePath) async {
    String? secretHash;
    LocationModel? location;
    Exif exif = await Exif.fromPath(filePath);
    Map<String, Object>? data = await exif.getAttributes();
    await exif.close();
    if (data == null) {
      return const MetaDataModel(null, null);
    }
    if (data.containsKey("UserComment")) {
      secretHash = data["UserComment"] as String;
    }
    if (data.containsKey("GPSLatitude") && data.containsKey("GPSLongitude")) {
      location = LocationModel(
          latitude: data["GPSLatitude"] as double,
          longitude: data["GPSLongitude"] as double);
    }
    return MetaDataModel(secretHash, location);
  }
}
