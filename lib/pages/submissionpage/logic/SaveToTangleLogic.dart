import 'dart:async';
import 'dart:convert';
import 'package:convert/convert.dart';
import 'package:chopper/chopper.dart';
import 'package:decentproof/shared/generated/openapi.swagger.dart';
import 'package:http_certificate_pinning/http_certificate_pinning.dart';

class SaveToTangleLogic {
  const SaveToTangleLogic(this.signature, this.dateTime, [this.devNet = true]);
  final bool devNet;
  final String signature;
  final DateTime dateTime;
  Future<String> save(String hash) async {
    final api = Openapi.create(
        baseUrl: Uri.parse(devNet
            ? "https://api.lb-0.h.chrysalis-devnet.iota.cafe"
            : "https://chrysalis-nodes.iota.cafe"),
        interceptors: [SecureHttpClient.build([])]);
    String data =
        "Hash:$hash App:DecentProof v:0 DateTime:$dateTime Sig:$signature";
    final payload = IndexationPayload(
        type: 2,
        index:
            hex.encode(utf8.encode("DecentProofApp:${hash.substring(0, 40)}")),
        data: hex.encode(utf8.encode(data)));
    final SubmitMessageRequest requestBody =
        SubmitMessageRequest(payload: payload);
    Response<SubmitMessageResponse> response =
        await api.apiV1MessagesPost(body: requestBody);
    return response.body!.data.messageId;
  }
}
