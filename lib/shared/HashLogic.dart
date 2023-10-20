import 'dart:typed_data';
import 'package:pointycastle/digests/keccak.dart';
import 'package:convert/convert.dart' show hex;

import 'interface/IHashLogic.dart';

class HashLogic implements IHashLogic {
  HashLogic() {
    _keccakDigest = KeccakDigest(256);
  }
  late final KeccakDigest _keccakDigest;
  @override
  Future<String> hashBytes(Uint8List bytes) async {
    Uint8List hashAsBytes = _keccakDigest.process(bytes);
    return hex.encode(hashAsBytes);
  }

  @override
  Future<String> hashBytesInChunks(Uint8List bytes) async {
    final Iterator<int> iterator = bytes.iterator;
    while (iterator.moveNext()) {
      _keccakDigest.updateByte(iterator.current);
    }
    Uint8List hashAsBytes = Uint8List(_keccakDigest.digestSize);
    _keccakDigest.doFinal(hashAsBytes, 0);
    return hex.encode(hashAsBytes);
  }

  @override
  Future<String> hashBytesInChunksFromStream(
      Stream<List<int>> byteStream) async {
    await byteStream.forEach((element) =>
        _keccakDigest.update(Uint8List.fromList(element), 0, element.length));
    Uint8List hashAsBytes = Uint8List(_keccakDigest.digestSize);
    _keccakDigest.doFinal(hashAsBytes, 0);
    return hex.encode(hashAsBytes);
  }
}
