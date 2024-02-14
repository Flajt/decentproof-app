import 'dart:io';

import 'package:decentproof/features/hashing/interfaces/IHashingService.dart';
import 'package:get_it/get_it.dart';

import '../../../../shared/interface/IHashLogic.dart';

class AudioHashingService implements IHashingService {
  final IHashLogic _hashLogic = GetIt.I.get<IHashLogic>();
  @override
  Future<String> hash(String path, Function(double) progress) async {
    File audioFile = File(path);
    Stream<List<int>> audioFileAsBytes = audioFile.openRead();
    final int size = (audioFile.lengthSync() / 65536).ceil();
    String hash = await _hashLogic.hashBytesInChunksFromStream(
        audioFileAsBytes, (p) => progress((p / size) * 100));
    return hash;
  }
}
