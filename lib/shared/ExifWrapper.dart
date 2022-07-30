import 'package:native_exif/native_exif.dart';

class ExifWrapper {
  Future<void> addExifToImage(String path) async {
    final Exif exifImageAccess = await Exif.fromPath(path);
    final attributes = await exifImageAccess.getAttributes();
    print(attributes);
  }
}
