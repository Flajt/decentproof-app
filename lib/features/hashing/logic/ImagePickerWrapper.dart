import 'dart:typed_data';

import 'package:image_picker/image_picker.dart';

class ImagePickerWrapper {
  final ImagePicker _imagePicker = ImagePicker();
  Future<Uint8List> getImageAsBytes() async {
    XFile? file = await _imagePicker.pickImage(source: ImageSource.camera);
    if (file != null) {
      Uint8List bytes = await file.readAsBytes(); //TODO: Use openRead
      return bytes;
    }
    throw "No image taken";
  }

  Future<Uint8List> getVideoAsBytes() async {
    XFile? file = await _imagePicker.pickVideo(source: ImageSource.camera);
    if (file != null) {
      Uint8List bytes = await file.readAsBytes(); //TODO: Use openRead
      return bytes;
    }
    throw "No video taken";
  }
}
