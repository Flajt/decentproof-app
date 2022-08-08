import 'dart:io';
import 'dart:typed_data';
import 'package:decentproof/pages/videoimagepage/logic/ImagePickerWrapper.dart';
import 'package:decentproof/pages/videoimagepage/logic/VideoImageHashManager.dart';
import 'package:decentproof/shared/ExifWrapper.dart';
import 'package:nanoid/async.dart';
import 'package:path_provider/path_provider.dart';

class VideoManager {
  const VideoManager(
      ImagePickerWrapper imagePickerWrapper, ExifWrapper exifWrapper)
      : _imagePickerWrapper = imagePickerWrapper,
        _exifWrapper = exifWrapper;
  final ImagePickerWrapper _imagePickerWrapper;
  final ExifWrapper _exifWrapper;

  Future<String> saveVideo() async {
    Uint8List videoAsBytes = await _imagePickerWrapper.getVideoAsBytes();
    String path = Platform.isAndroid
        ? (await getExternalStorageDirectory())!.path
        : (await getApplicationDocumentsDirectory()).path;
    String imageId = await nanoid(16);
    String fullPath = "$path/$imageId.mp4";
    await File(fullPath).writeAsBytes(videoAsBytes);
    return fullPath;
  }
}
