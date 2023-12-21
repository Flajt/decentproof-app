import 'dart:io';
import 'dart:typed_data';

import 'package:decentproof/features/hashing/interfaces/IHashingService.dart';
import 'package:decentproof/shared/interface/IHashLogic.dart';
import 'package:get_it/get_it.dart';

class ImageHashingService extends IHashingService {
  final IHashLogic _hashLogic = GetIt.I.get<IHashLogic>();

  @override
  Future<String> hash(String path) async {
    File file = File(path);
    Uint8List imageAsBytes = await file.readAsBytes();
    String hash = await _hashLogic.hashBytes(imageAsBytes);
    return hash;
  }
}
