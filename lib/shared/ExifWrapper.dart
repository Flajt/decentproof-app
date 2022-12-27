import 'package:native_exif/native_exif.dart';

class ExifWrapper {
  ///Currently only for testing, method is not used. Will later be used to add location data to images.
  Future<void> addExifToImage(String path) async {
    final Exif exifImageAccess = await Exif.fromPath(path);
    final attributes = await exifImageAccess.getAttributes();
    print(attributes);
  }
}
