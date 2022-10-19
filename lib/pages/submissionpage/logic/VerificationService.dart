import 'dart:convert';
import 'package:convert/convert.dart';
import 'dart:typed_data';
import 'package:basic_utils/basic_utils.dart';
import 'package:pointycastle/signers/ecdsa_signer.dart';

class VerificationService {
  final String pemPubKey = """
-----BEGIN PUBLIC KEY-----
MFkwEwYHKoZIzj0CAQYIKoZIzj0DAQcDQgAEMGABYxoEQSiFxeidgzS5m9Q9GWtZ
g5IHK23GwgQNWeEYWTY8QyCLRuRbSvaoS+5TSc35fEut6gFAnElJxs3wuQ==
-----END PUBLIC KEY-----
""";

  ECSignature loadAndConvertSignature(String sig) {
    print(sig);
    //Based on: https://github.com/bcgit/pc-dart/issues/159#issuecomment-1105689978
    Uint8List bytes = Uint8List.fromList(hex.decode(sig));
    ASN1Parser p = ASN1Parser(bytes);
    //Needs to be dynamic or otherwise throws odd errors
    final seq = p.nextObject() as dynamic;
    ASN1Integer ar = seq.elements?[0] as ASN1Integer;
    ASN1Integer as = seq.elements?[1] as ASN1Integer;
    BigInt r = ar.integer!;
    BigInt s = as.integer!;
    return ECSignature(r, s);
  }

  ECPublicKey loadAndPrepPubKey() {
    return CryptoUtils.ecPublicKeyFromPem(pemPubKey);
  }

  bool verify(String message, ECSignature sig) {
    final ECDSASigner signer = ECDSASigner(Digest("SHA-224"));
    signer.init(false, PublicKeyParameter<ECPublicKey>(loadAndPrepPubKey()));
    Uint8List messageAsBytes = Uint8List.fromList(utf8.encode(message));
    return signer.verifySignature(messageAsBytes, sig);
  }
}
