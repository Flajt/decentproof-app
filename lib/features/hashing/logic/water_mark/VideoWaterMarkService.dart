import 'dart:async';
import 'dart:io';

import 'package:decentproof/features/hashing/interfaces/IWaterMarkService.dart';
import 'package:decentproof/shared/util/PathUtil.dart';
import 'package:ffmpeg_kit_flutter/ffmpeg_kit.dart';
import 'package:ffmpeg_kit_flutter/return_code.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

class VideoWaterMarkService extends IWaterMarkService {
  @override
  Future<String> addWaterMark(String filePath) async {
    final Completer<String> completer = Completer();
    Directory dir = await PathUtil.getStoragePath(StorageDirectory.movies);
    dir.createSync();
    final Directory waterMarkCache = await getApplicationCacheDirectory();
    waterMarkCache.createSync();
    final waterMarkFile = File("${waterMarkCache.path}/watermark.png");
    if (!waterMarkFile.existsSync()) {
      final waterMark = await rootBundle.load("assets/icon/watermark.png");
      await waterMarkFile.writeAsBytes(waterMark.buffer.asUint8List());
    }
    String savePath = dir.path;
    String fileName = filePath.split("/").last.split(".").first;
    await FFmpegKit.executeAsync(
        '-i $filePath -i ${waterMarkFile.path} -filter_complex "[1]scale=iw*0.3:-1[wm];[0][wm]overlay=W-w-5:H-h-5" -c:a copy $savePath/n_$fileName.mp4',
        (session) async {
      ReturnCode? code = await session.getReturnCode();
      if (ReturnCode.isSuccess(code)) {
        completer.complete("$savePath/n_$fileName.mp4");
      } else {
        completer.completeError("Failed to add watermark");
      }
    });

    return await completer.future;
  }
}
