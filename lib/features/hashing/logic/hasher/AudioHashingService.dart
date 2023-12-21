import 'dart:io';

import 'package:decentproof/features/hashing/interfaces/IHashingService.dart';
import 'package:get_it/get_it.dart';

import '../../../../shared/interface/IHashLogic.dart';

class AudioHashingService implements IHashingService {
  final IHashLogic _hashLogic = GetIt.I.get<IHashLogic>();
  @override
  Future<String> hash(String path) async {
    File audioFile = File(path);
    Stream<List<int>> audioFileAsBytes = audioFile.openRead();
    String hash =
        await _hashLogic.hashBytesInChunksFromStream(audioFileAsBytes);
    return hash;
  }
}
