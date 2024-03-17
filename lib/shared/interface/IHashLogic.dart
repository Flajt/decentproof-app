import 'dart:typed_data';

import 'package:flutter/foundation.dart';

abstract class IHashLogic {
  Future<String> hashBytes(Uint8List bytes);
  Future<String> hashBytesInChunks(Uint8List bytes);
  Future<String> hashBytesInChunksFromStream(Stream<List<int>> byteStream,
      [Function(int) progress]);
}
