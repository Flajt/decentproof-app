import 'package:decentproof/pages/verificationpage/logic/FileSelectionLogic.dart';
import 'package:decentproof/pages/verificationpage/logic/VerificationLogic.dart';
import 'package:decentproof/shared/HashLogic.dart';

class SelectHashAndVerifyLogic {
  const SelectHashAndVerifyLogic(
      this.hashLogic, this.verificationLogic, this.fileSelectionLogic);
  final HashLogic hashLogic;
  final VerificationLogic verificationLogic;
  final FileSelectionLogic fileSelectionLogic;
  Future<Map<String, String>>? check() async {
    Stream<List<int>>? byteStream =
        await fileSelectionLogic.selectFileAsStream();
    if (byteStream != null) {
      String hash = await hashLogic.hashBytesInChunksFromStream(byteStream);
      String? messageId = await verificationLogic.verifyHash(hash);
      if (messageId != null) {
        return {"messageId": messageId, "hash": hash};
      }
      throw "No file found for hash: $hash";
    }
    throw "No file selected!";
  }
}
