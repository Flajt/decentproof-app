import 'dart:io';

import 'package:decentproof/features/hashing/interfaces/IHashingService.dart';
import 'package:get_it/get_it.dart';

import '../../../../shared/interface/IHashLogic.dart';

class VideoHashingService implements IHashingService {
  final IHashLogic _hashLogic = GetIt.I.get<IHashLogic>();
  @override
  Future<String> hash(String path) async {
    File file = File(path);
    Stream<List<int>> imageAsBytes = file.openRead();
    String hash = await _hashLogic.hashBytesInChunksFromStream(imageAsBytes);
    return hash;
  }
}
