import 'dart:io';
import 'dart:typed_data';

import 'package:decentproof/features/hashing/interfaces/IHashingService.dart';
import 'package:decentproof/shared/HashLogic.dart';

class ImageHashingService extends IHashingService {
  late final HashLogic _hashLogic;
  ImageHashingService(HashLogic hashLogic) : _hashLogic = hashLogic;

  @override
  Future<String> hash(String path) async {
    File file = File(path);
    Uint8List imageAsBytes = await file.readAsBytes();
    String hash = await _hashLogic.hashBytes(imageAsBytes);
    return hash;
  }
}
