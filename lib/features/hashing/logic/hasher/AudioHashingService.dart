import 'dart:io';

import 'package:decentproof/features/hashing/interfaces/IHashingService.dart';
import 'package:decentproof/shared/HashLogic.dart';

class AudioHashingService implements IHashingService {
  final HashLogic _hashLogic;
  const AudioHashingService(HashLogic hashLogic) : _hashLogic = hashLogic;
  @override
  Future<String> hash(String path) async {
    File audioFile = File(path);
    Stream<List<int>> audioFileAsBytes = audioFile.openRead();
    String hash =
        await _hashLogic.hashBytesInChunksFromStream(audioFileAsBytes);
    return hash;
  }
}
