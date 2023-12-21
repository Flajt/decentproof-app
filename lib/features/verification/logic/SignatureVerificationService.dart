import 'dart:convert';
import 'package:convert/convert.dart';
import 'dart:typed_data';
import 'package:basic_utils/basic_utils.dart';
import 'package:decentproof/features/verification/interfaces/ISignatureVerifcationService.dart';
import 'package:pointycastle/asn1/asn1_parser.dart';
import 'package:pointycastle/asn1/primitives/asn1_integer.dart';
import 'package:pointycastle/signers/ecdsa_signer.dart';

class SignatureVerificationService implements ISignatureVerificationService {
  late final ECPublicKey pubKey;
  SignatureVerificationService() {
    pubKey = loadAndPrepPubKey();
  }

  final String pemPubKey = """
-----BEGIN EC PUBLIC KEY-----
MFkwEwYHKoZIzj0CAQYIKoZIzj0DAQcDQgAEq6iOuQeIhlhywCjo5yoABGODOJRZ
c6/L8XzUYEsocCbc/JHiByGjuB3G9cSU2vUi1HUy5LsCtX2wlHSEObGVBw==
-----END EC PUBLIC KEY-----
""";

  ECSignature loadAndConvertSignature(String sig) {
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

  @override
  bool verify(String hash, String sig) {
    ECSignature convertedSig = loadAndConvertSignature(sig);
    final ECDSASigner signer = ECDSASigner();
    signer.init(false, PublicKeyParameter<ECPublicKey>(pubKey));
    Uint8List messageAsBytes = Uint8List.fromList(hex.decode(hash));
    return signer.verifySignature(messageAsBytes, convertedSig);
  }
}
