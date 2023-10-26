//This doesn't mean the US Agency

import 'dart:typed_data';

abstract class ISercretService {
  Future<bool> saveSecret(String secret);
  Future<Uint8List> get secret;
  Future<bool> validateSecret(String secret);
}
