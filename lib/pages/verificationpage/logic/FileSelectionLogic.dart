import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';

class FileSelectionLogic {
  Future<Stream<List<int>>?> selectFileAsStream() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        dialogTitle: "Select file to verify",
        type: FileType.custom,
        withReadStream: true,
        allowCompression: false,
        allowedExtensions: ["png", "aac", "mp4"]);
    if (result != null) {
      PlatformFile file = result.files[0];
      return file.readStream!;
    }
    return null;
  }
}
