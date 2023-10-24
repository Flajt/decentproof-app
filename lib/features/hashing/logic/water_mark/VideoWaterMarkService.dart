import 'dart:io';

import 'package:decentproof/features/hashing/interfaces/IWaterMarkService.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_watermark/video_watermark.dart';

class VideoWaterMarkService extends IWaterMarkService {
  @override
  Future<void> addWaterMark(String filePath) async {
    String savePath = await _getSavePath();
    final waterMark = Watermark(
        image: WatermarkSource.asset("assets/icon/icon.png"),
        watermarkAlignment: WatermarkAlignment.botomRight);
    VideoWatermark videoWaterMarkingTool = VideoWatermark(
        sourceVideoPath: filePath,
        watermark: waterMark,
        outputFormat: OutputFormat.mp4,
        savePath: savePath);
    await videoWaterMarkingTool.generateVideo();
  }

  Future<String> _getSavePath() async {
    if (Platform.isAndroid) {
      List<Directory>? savePaths =
          await getExternalStorageDirectories(type: StorageDirectory.movies);
      if (savePaths == null) {
        return (await getApplicationDocumentsDirectory()).path;
      }
      return savePaths[0].path;
    } else {
      return (await getApplicationDocumentsDirectory()).path;
    }
  }
}
