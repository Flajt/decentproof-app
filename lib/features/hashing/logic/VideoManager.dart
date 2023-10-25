import 'dart:io';
import 'dart:typed_data';
import 'package:decentproof/features/hashing/interfaces/IFileSavingService.dart';
import 'package:decentproof/features/hashing/interfaces/IMediaPickerService.dart';
import 'package:decentproof/shared/util/PathUtil.dart';
import 'package:get_it/get_it.dart';
import 'package:nanoid/async.dart';
import 'package:path_provider/path_provider.dart';
import 'package:photo_manager/photo_manager.dart';

import '../interfaces/IWaterMarkService.dart';

class VideoSavingService implements IFileSavingService {
  final IMediaPickerService _imagePickerWrapper =
      GetIt.I.get<IMediaPickerService>();
  final waterMarkService =
      GetIt.I.get<IWaterMarkService>(instanceName: "VideoWaterMark");
  @override
  Future<String> saveFile() async {
    String imageId = await nanoid(16);
    Uint8List videoAsBytes = await _imagePickerWrapper.getVideoAsBytes();
    Directory storageDir =
        await PathUtil.getStoragePath(StorageDirectory.movies);
    storageDir.createSync(recursive: true);
    String fullPath = "${storageDir.path}/$imageId.mp4";
    File videoFile = await File(fullPath).writeAsBytes(videoAsBytes);
    String finalPath = await waterMarkService.addWaterMark(fullPath);
    if (Platform.isAndroid) {
      final outPutFile = File(finalPath);
      await PhotoManager.editor.saveVideo(outPutFile, title: imageId);
      await videoFile.delete();
    }
    return finalPath;
  }
}
