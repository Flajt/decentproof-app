import 'dart:io';
import 'dart:typed_data';

import '../../../../shared/HashLogic.dart';

class VideoImageHashManager {
  const VideoImageHashManager(HashLogic hashLogic) : _hashLogic = hashLogic;
  final HashLogic _hashLogic;
  Future<String> hashImage(String path) async {
    File file = File(path);
    Uint8List imageAsBytes = await file.readAsBytes();
    String hash = await _hashLogic.hashBytes(imageAsBytes);
    return hash;
  }

  Future<String> hashVideo(String path) async {
    File file = File(path);
    Stream<List<int>> imageAsBytes = file.openRead();
    String hash = await _hashLogic.hashBytesInChunksFromStream(imageAsBytes);
    return hash;
  }
}
