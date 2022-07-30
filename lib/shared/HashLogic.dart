import 'dart:typed_data';
import 'package:pointycastle/digests/keccak.dart';

class HashLogic {
  final KeccakDigest _keccakDigest = KeccakDigest(256);
  Future<String> hashBytes(Uint8List bytes) async {
    Uint8List hashAsBytes = _keccakDigest.process(bytes);
    return String.fromCharCodes(hashAsBytes);
  }

  Future<String> hashBytesInChunks(Uint8List bytes) async {
    final Iterator<int> iterator = bytes.iterator;
    while (iterator.moveNext() != false) {
      _keccakDigest.updateByte(iterator.current);
    }
    final Uint8List hashAsBytes = Uint8List(bytes.length);
    _keccakDigest.doFinal(hashAsBytes, 0);
    return String.fromCharCodes(hashAsBytes);
  }
}
