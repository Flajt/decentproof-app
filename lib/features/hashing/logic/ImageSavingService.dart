import 'dart:io';
import 'dart:typed_data';
import 'package:decentproof/features/hashing/interfaces/IMediaPickerService.dart';
import 'package:decentproof/shared/util/PathUtil.dart';
import 'package:get_it/get_it.dart';
import 'package:nanoid/async.dart';
import 'package:path_provider/path_provider.dart';
import 'package:photo_manager/photo_manager.dart';

import '../interfaces/IFileSavingService.dart';
import '../interfaces/IWaterMarkService.dart';

class ImageSavingService implements IFileSavingService {
  final IMediaPickerService imagePickerWrapper =
      GetIt.I.get<IMediaPickerService>();
  final IWaterMarkService waterMarkService =
      GetIt.I.get<IWaterMarkService>(instanceName: "ImageWaterMark");

  @override
  Future<String> saveFile() async {
    Uint8List imageAsBytes = await imagePickerWrapper.getImageAsBytes();
    Directory dir = await PathUtil.getStoragePath(StorageDirectory.pictures);
    dir.createSync(recursive: true);
    String path = dir.path;
    String imageId = await nanoid(16);
    String fullPath = "$path/$imageId.png";
    File nonWaterMarkedFile = File(fullPath);
    nonWaterMarkedFile = await nonWaterMarkedFile.writeAsBytes(imageAsBytes);
    String finalPath = await waterMarkService.addWaterMark(fullPath);

    if (Platform.isAndroid) {
      Uint8List finalBytes = await File(finalPath).readAsBytes();
      await PhotoManager.editor.saveImage(finalBytes, title: "$imageId.png");
    }
    //exifWrapper.addExifToImage("$path/$imageId.png"); TODO: Decide if it's really required
    return fullPath;
  }
}
