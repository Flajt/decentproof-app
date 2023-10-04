import 'dart:convert';
import 'dart:typed_data';

import 'package:basic_utils/basic_utils.dart';
import 'package:decentproof/features/hashing/logic/blockchain/MessageVerificationService.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Signature validation", () {
    late final MessageVerificationService verificationService;
    late final AsymmetricKeyPair<PublicKey, PrivateKey> keyPair;
    const String message = "Test message";

    setUp(() {
      verificationService = MessageVerificationService();
      keyPair = CryptoUtils.generateEcKeyPair(curve: "secp256r1");
    });

    test("should return false if a different privKey is used to sign a message",
        () {
      final signature = CryptoUtils.ecSign(keyPair.privateKey as ECPrivateKey,
          Uint8List.fromList(utf8.encode(message)),
          algorithmName: "SHA-224/ECDSA");
      bool result = verificationService.verify(message, signature);
      assert(result == false);
    });
  });
}
