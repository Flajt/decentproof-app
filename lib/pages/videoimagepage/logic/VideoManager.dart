import 'dart:io';
import 'dart:typed_data';
import 'package:decentproof/pages/videoimagepage/logic/ImagePickerWrapper.dart';
import 'package:decentproof/pages/videoimagepage/logic/VideoImageHashManager.dart';
import 'package:decentproof/shared/ExifWrapper.dart';
import 'package:nanoid/async.dart';
import 'package:path_provider/path_provider.dart';
import 'package:photo_manager/photo_manager.dart';

class VideoManager {
  const VideoManager(
      ImagePickerWrapper imagePickerWrapper, ExifWrapper exifWrapper)
      : _imagePickerWrapper = imagePickerWrapper,
        _exifWrapper = exifWrapper;
  final ImagePickerWrapper _imagePickerWrapper;
  final ExifWrapper _exifWrapper;

  Future<String> saveVideo() async {
    String imageId = await nanoid(16);
    Uint8List videoAsBytes = await _imagePickerWrapper.getVideoAsBytes();
    String path = Platform.isIOS
        ? (await getApplicationDocumentsDirectory()).path
        : (await getExternalStorageDirectories(
                type: StorageDirectory.movies))![0]
            .path;
    String fullPath = "$path/$imageId.mp4";
    File videoFile = await File(fullPath).writeAsBytes(videoAsBytes);
    if (Platform.isAndroid) {
      await PhotoManager.editor.saveVideo(videoFile, title: imageId);
    }
    return fullPath;
  }
}
