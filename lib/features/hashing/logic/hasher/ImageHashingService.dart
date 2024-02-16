import 'dart:io';
import 'dart:typed_data';

import 'package:decentproof/features/hashing/interfaces/IHashingService.dart';
import 'package:decentproof/shared/interface/IHashLogic.dart';
import 'package:get_it/get_it.dart';

class ImageHashingService extends IHashingService {
  final IHashLogic _hashLogic = GetIt.I.get<IHashLogic>();

  @override
  Future<String> hash(String path, [Function(double)? progress]) async {
    File file = File(path);
    Stream<List<int>> imageAsBytes = file.openRead();
    //String hash = await _hashLogic.hashBytes(imageAsBytes);
    final int size =
        (file.lengthSync() / 65536).ceil(); // the 65536 is the chunk size
    String hash = await _hashLogic.hashBytesInChunksFromStream(imageAsBytes,
        (p) => progress != null ? progress((p / size) * 100) : null);

    return hash;
  }
}
