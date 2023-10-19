import 'dart:convert';
import 'dart:typed_data';
import 'package:convert/convert.dart';

import 'package:basic_utils/basic_utils.dart';
import 'package:decentproof/features/verification/interfaces/ISignatureVerifcationService.dart';
import 'package:decentproof/features/verification/logic/SignatureVerificationService.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pointycastle/asn1/primitives/asn1_integer.dart';
import 'package:pointycastle/asn1/primitives/asn1_sequence.dart';

void main() {
  group("Signature validation", () {
    late final ISignatureVerificationService verificationService;
    late final AsymmetricKeyPair<PublicKey, PrivateKey> keyPair;
    const String message = "Test message";

    setUp(() {
      verificationService = SignatureVerificationService();
      keyPair = CryptoUtils.generateEcKeyPair(curve: "secp256r1");
    });

    test("should return false if a different privKey is used to sign a message",
        () {
      final signature = CryptoUtils.ecSign(keyPair.privateKey as ECPrivateKey,
          Uint8List.fromList(utf8.encode(message)),
          algorithmName: "SHA-224/ECDSA");
      final encoded = ASN1Sequence(elements: [
        ASN1Integer(signature.r),
        ASN1Integer(signature.s),
      ]).encode();
      bool result = verificationService.verify(message, hex.encode(encoded));
      assert(result == false);
    });
  });
}
