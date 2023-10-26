import 'package:decentproof/features/metadata/interfaces/IMetaDataService.dart';
import 'package:decentproof/features/metadata/models/LocationModel.dart';
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
      "USERCOMMENT": secretHash
    });
    await exif.close();
    return filePath;
  }

  @override
  Future<String> addSecret(String secretHash, String filePath) async {
    Exif exif = await Exif.fromPath(filePath);
    await exif.writeAttribute("USERCOMMENT", secretHash);
    await exif.close();
    return filePath;
  }
}
