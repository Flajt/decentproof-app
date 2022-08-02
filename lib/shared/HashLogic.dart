import 'dart:typed_data';
import 'package:pointycastle/digests/keccak.dart';
import 'package:convert/convert.dart';

class HashLogic {
  final KeccakDigest _keccakDigest = KeccakDigest(256);
  Future<String> hashBytes(Uint8List bytes) async {
    Uint8List hashAsBytes = _keccakDigest.process(bytes);
    return hex.encode(hashAsBytes);
  }

  Future<String> hashBytesInChunks(Uint8List bytes) async {
    final Iterator<int> iterator = bytes.iterator;
    while (iterator.moveNext()) {
      _keccakDigest.updateByte(iterator.current);
    }
    final Uint8List hashAsBytes = Uint8List(_keccakDigest.digestSize);
    _keccakDigest.doFinal(hashAsBytes, 0);
    return hex.encode(hashAsBytes);
  }
}
