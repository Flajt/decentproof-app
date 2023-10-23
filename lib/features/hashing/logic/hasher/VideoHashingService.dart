import 'dart:io';

import 'package:decentproof/features/hashing/interfaces/IHashingService.dart';

import '../../../../shared/HashLogic.dart';

class VideoHashingService implements IHashingService {
  const VideoHashingService(HashLogic hashLogic) : _hashLogic = hashLogic;
  final HashLogic _hashLogic;
  @override
  Future<String> hash(String path) async {
    File file = File(path);
    Stream<List<int>> imageAsBytes = file.openRead();
    String hash = await _hashLogic.hashBytesInChunksFromStream(imageAsBytes);
    return hash;
  }
}
