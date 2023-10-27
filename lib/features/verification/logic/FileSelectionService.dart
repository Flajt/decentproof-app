import 'package:decentproof/features/verification/interfaces/IFileSelectionService.dart';
import 'package:decentproof/features/verification/models/FileDataMode.dart';
import 'package:file_picker/file_picker.dart';

//TODO: Check if this is actually needed or if it can be handle by the hashing services
class FileSelectionService implements IFileSelectionService {
  @override
  Future<FileDataModel?> selectFileAsStream() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        dialogTitle: "Select file to verify",
        type: FileType.custom,
        withReadStream: true,
        allowCompression: false,
        allowedExtensions: ["png", "aac", "mkv"]);
    if (result != null) {
      PlatformFile file = result.files[0];
      return FileDataModel(byteStream: file.readStream!, fileName: file.name);
    }
    return null;
  }
}
