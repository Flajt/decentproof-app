import 'dart:io';

import 'package:decentproof/shared/HashLogic.dart';

class HashAudioManager {
  final HashLogic _hashLogic;
  const HashAudioManager(HashLogic hashLogic) : _hashLogic = hashLogic;
  Future<String> hashAudio(String path) async {
    File audioFile = File(path);
    Stream<List<int>> audioFileAsBytes = audioFile.openRead();
    String hash =
        await _hashLogic.hashBytesInChunksFromStream(audioFileAsBytes);
    return hash;
  }
}
