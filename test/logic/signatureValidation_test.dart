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
    const String message =
        "8b89d2ab5300a30edb573a8da671a9438cdcccbc42f2a153927e8ba8f54d611c";

    setUp(() {
      verificationService = SignatureVerificationService();
      keyPair = CryptoUtils.generateEcKeyPair(curve: "secp256r1");
    });

    test("should return false if a different privKey is used to sign a message",
        () {
      final signature = CryptoUtils.ecSign(keyPair.privateKey as ECPrivateKey,
          Uint8List.fromList(hex.decode(message)),
          algorithmName: "SHA-256/ECDSA");
      final encoded = ASN1Sequence(elements: [
        ASN1Integer(signature.r),
        ASN1Integer(signature.s),
      ]).encode();
      bool result = verificationService.verify(message, hex.encode(encoded));
      assert(result == false);
    });
  });
}
