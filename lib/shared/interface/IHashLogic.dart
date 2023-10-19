import 'dart:typed_data';

abstract class IHashLogic {
  Future<String> hashBytes(Uint8List bytes);
  Future<String> hashBytesInChunks(Uint8List bytes);
  Future<String> hashBytesInChunksFromStream(Stream<List<int>> byteStream);
}
