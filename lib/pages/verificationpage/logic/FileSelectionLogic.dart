import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';

class FileSelectionLogic {
  static Future<Stream<List<int>>?> selectFileAsStream() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        withReadStream: true,
        allowCompression: false,
        allowedExtensions: ["png", "aac", "mp4"]);
    if (result != null) {
      PlatformFile file = result.files[0];
      return file.readStream!;
    }
  }
}
