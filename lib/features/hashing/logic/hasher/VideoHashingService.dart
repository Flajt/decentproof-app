import 'dart:io';

import 'package:decentproof/features/hashing/interfaces/IHashingService.dart';
import 'package:get_it/get_it.dart';

import '../../../../shared/interface/IHashLogic.dart';

class VideoHashingService implements IHashingService {
  final IHashLogic _hashLogic = GetIt.I.get<IHashLogic>();
  @override
  Future<String> hash(String path, Function(double) progress) async {
    File file = File(path);
    Stream<List<int>> videoBytes = file.openRead();
    final int size =
        (file.lengthSync() / 65536).ceil(); // the 65536 is the chunk size
    String hash = await _hashLogic.hashBytesInChunksFromStream(
        videoBytes, (p) => progress((p / size) * 100));
    return hash;
  }
}
