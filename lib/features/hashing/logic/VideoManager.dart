import 'dart:io';
import 'dart:typed_data';
import 'package:decentproof/features/hashing/interfaces/IFileSavingService.dart';
import 'package:decentproof/features/hashing/interfaces/IMediaPickerService.dart';
import 'package:get_it/get_it.dart';
import 'package:nanoid/async.dart';
import 'package:path_provider/path_provider.dart';
import 'package:photo_manager/photo_manager.dart';

class VideoSavingService implements IFileSavingService {
  final IMediaPickerService _imagePickerWrapper =
      GetIt.I.get<IMediaPickerService>();
  @override
  Future<String> saveFile() async {
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
