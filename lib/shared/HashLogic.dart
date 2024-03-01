import 'dart:typed_data';
import 'package:convert/convert.dart' show hex;
import 'package:pointycastle/digests/sha256.dart';

import 'interface/IHashLogic.dart';

class HashLogic implements IHashLogic {
  HashLogic() {
    _digest = SHA256Digest();
  }
  late final SHA256Digest _digest;
  @override
  Future<String> hashBytes(Uint8List bytes) async {
    Uint8List hashAsBytes = _digest.process(bytes);
    return hex.encode(hashAsBytes);
  }

  @override
  Future<String> hashBytesInChunks(Uint8List bytes) async {
    final Iterator<int> iterator = bytes.iterator;
    while (iterator.moveNext()) {
      _digest.updateByte(iterator.current);
    }
    Uint8List hashAsBytes = Uint8List(_digest.digestSize);
    _digest.doFinal(hashAsBytes, 0);
    return hex.encode(hashAsBytes);
  }

  @override
  Future<String> hashBytesInChunksFromStream(Stream<List<int>> byteStream,
      [Function(int)? progress]) async {
    int currentPos = 0;
    await for (List<int> element in byteStream) {
      _digest.update(Uint8List.fromList(element), 0, element.length);
      if (progress != null) {
        progress(currentPos);
        currentPos += 1;
      }
    }
    //await byteStream.forEach((element) => _digest.update(Uint8List.fromList(element), 0, element.length));
    Uint8List hashAsBytes = Uint8List(_digest.digestSize);
    _digest.doFinal(hashAsBytes, 0);
    return hex.encode(hashAsBytes);
  }
}
