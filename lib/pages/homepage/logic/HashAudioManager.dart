import 'dart:io';
import 'dart:typed_data';

import 'package:decentproof/shared/HashLogic.dart';

class HashAudioManager {
  final HashLogic _hashLogic;
  const HashAudioManager(HashLogic hashLogic) : _hashLogic = hashLogic;
  Future<String> hashAudio(String path) async {
    File audioFile = File(path);
    Uint8List audioFileAsBytes = await audioFile.readAsBytes();
    String hash = await _hashLogic.hashBytes(audioFileAsBytes);
    return hash;
  }
}
