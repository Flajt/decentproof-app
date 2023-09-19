import 'dart:convert';
import 'package:chopper/chopper.dart';
import 'package:decentproof/shared/generated/openapi.swagger.dart';
import 'package:convert/convert.dart';
import 'package:http_certificate_pinning/http_certificate_pinning.dart';
import 'package:pointycastle/pointycastle.dart';

import '../../hashing/logic/blockchain/MessageVerificationService.dart';

class VerificationLogic {
  final MessageVerificationService verificationService;
  VerificationLogic(this.verificationService, [this.devNet = true]) {
    api = Openapi.create(
        baseUrl: Uri.tryParse(devNet
            ? "https://api.lb-0.h.chrysalis-devnet.iota.cafe"
            : "https://chrysalis-nodes.iota.cafe"),
        interceptors: [SecureHttpClient.build([])]);
  }
  final bool devNet;
  late final Openapi api;

  Future<dynamic> getHash() async {}
  Future<String?> verifyHash(String hash) async {
    String? targetMessageId;
    Response<MessagesFindResponse> resp = await api.apiV1MessagesGet(
        index:
            hex.encode(utf8.encode("DecentProofApp:${hash.substring(0, 40)}")));
    if (resp.isSuccessful) {
      List<String> messageIds = resp.body!.data.messageIds;
      for (String messageId in messageIds) {
        Response<MessageResponse> message =
            await api.apiV1MessagesMessageIdGet(messageId: messageId);
        if (message.isSuccessful) {
          List<int> data =
              hex.decode(message.body!.data.allOf!.payload["data"]);
          String payload = utf8.decode(data);
          String extractedHash = payload.split("Hash:")[1].split(" ")[0];
          String signatureString = payload.split("Sig:")[1].split(" ")[0];
          String messageToValidate = payload.split(" Sig:")[0];
          ECSignature signature =
              verificationService.loadAndConvertSignature(signatureString);
          if (extractedHash == hash) {
            targetMessageId = messageId;
            if (verificationService.verify(messageToValidate, signature)) {
              break;
            } else {
              throw "Message Signature is not valid!" as Error;
            }
          }
        } else {
          throw message.error.toString() as Error;
        }
      }
    }
    return targetMessageId;
  }
}
