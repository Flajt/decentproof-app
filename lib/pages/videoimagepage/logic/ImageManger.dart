import 'dart:io';
import 'dart:typed_data';
import 'package:decentproof/pages/videoimagepage/logic/ImagePickerWrapper.dart';
import 'package:decentproof/shared/ExifWrapper.dart';
import 'package:nanoid/async.dart';
import 'package:path_provider/path_provider.dart';

class ImageManager {
  const ImageManager(
      {required this.imagePickerWrapper, required this.exifWrapper});
  final ImagePickerWrapper imagePickerWrapper;
  final ExifWrapper exifWrapper;

  Future<bool> saveImage() async {
    Uint8List imageAsBytes = await imagePickerWrapper.getImageAsBytes();
    String path = Platform.isAndroid
        ? (await getExternalStorageDirectory())!.path
        : (await getApplicationDocumentsDirectory()).path;
    String imageId = await nanoid(16);
    File("$path/$imageId.png").writeAsBytesSync(imageAsBytes);
    exifWrapper.addExifToImage("$path/$imageId.png");
    return true;
  }
}
