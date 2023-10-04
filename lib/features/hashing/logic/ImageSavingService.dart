import 'dart:io';
import 'dart:typed_data';
import 'package:decentproof/features/hashing/interfaces/IMediaPickerService.dart';
import 'package:nanoid/async.dart';
import 'package:path_provider/path_provider.dart';
import 'package:photo_manager/photo_manager.dart';

import '../interfaces/IFileSavingService.dart';

class ImageSavingService implements IFileSavingService {
  const ImageSavingService({required this.imagePickerWrapper});
  final IMediaPickerService imagePickerWrapper;
  @override
  Future<String> saveFile() async {
    Uint8List imageAsBytes = await imagePickerWrapper.getImageAsBytes();
    String path = Platform.isAndroid
        ? (await getExternalStorageDirectories(
                type: StorageDirectory.pictures))![0]
            .path
        : (await getApplicationDocumentsDirectory()).path;
    Directory(path).createSync(recursive: true);
    String imageId = await nanoid(16);
    String fullPath = "$path/$imageId.png";
    File(fullPath).writeAsBytesSync(imageAsBytes);

    if (Platform.isAndroid) {
      await PhotoManager.editor.saveImage(imageAsBytes, title: "$imageId.png");
    }
    //exifWrapper.addExifToImage("$path/$imageId.png"); TODO: Decide if it's really required
    return fullPath;
  }
}
