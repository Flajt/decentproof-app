import 'package:decentproof/features/verification/interfaces/IFileSelectionService.dart';
import 'package:decentproof/features/verification/logic/VerificationLogic.dart';
import 'package:decentproof/shared/HashLogic.dart';

//TODO: Rework this class, maybe delete it in favour of bloc
class SelectHashAndVerifyLogic {
  const SelectHashAndVerifyLogic(
      this.hashLogic, this.verificationLogic, this.fileSelectionLogic);
  final HashLogic hashLogic;
  final VerificationLogic verificationLogic;
  final IFileSelectionService fileSelectionLogic;
  Future<Map<String, String>>? check() async {
    Stream<List<int>>? byteStream =
        await fileSelectionLogic.selectFileAsStream();
    if (byteStream != null) {
      String hash = await hashLogic.hashBytesInChunksFromStream(byteStream);
      String? messageId = await verificationLogic.verifyHash(hash);
      if (messageId != null) {
        return {"messageId": messageId, "hash": hash};
      }
      throw "No file found for hash:\n\n$hash";
    }
    throw "No file selected!";
  }
}
