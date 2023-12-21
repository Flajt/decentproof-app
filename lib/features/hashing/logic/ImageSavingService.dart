import 'dart:io';
import 'dart:typed_data';
import 'package:decentproof/features/hashing/interfaces/IMediaPickerService.dart';
import 'package:decentproof/shared/util/PathUtil.dart';
import 'package:get_it/get_it.dart';
import 'package:nanoid/async.dart';
import 'package:path_provider/path_provider.dart';

import '../interfaces/IFileSavingService.dart';

class ImageSavingService implements IFileSavingService {
  final IMediaPickerService imagePickerWrapper =
      GetIt.I.get<IMediaPickerService>();

  @override
  Future<String> saveFile() async {
    Uint8List imageAsBytes = await imagePickerWrapper.getImageAsBytes();
    Directory dir = await PathUtil.getStoragePath(StorageDirectory.pictures);
    dir.createSync(recursive: true);
    String path = dir.path;
    String imageId = await nanoid(16);
    String fullPath = "$path/$imageId.png";
    await File(fullPath).writeAsBytes(imageAsBytes);
    return fullPath;
  }
}
