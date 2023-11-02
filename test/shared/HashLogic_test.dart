import 'dart:typed_data';

import 'package:basic_utils/basic_utils.dart';
import 'package:decentproof/shared/HashLogic.dart';
import 'package:test/test.dart';

void main() {
  group("HashLogic", () {
    final HashLogic hashLogic = HashLogic();

    test("hashBytes works on string", () async {
      const String testHash = "Hello this is a test string";
      final bytes = Uint8List.fromList(testHash.codeUnits);
      String hash =
          await hashLogic.hashBytes(bytes); // returns lowercase letters
      String comparisionHash =
          CryptoUtils.getHash(bytes); // Returns uppercase letter
      expect(
          hash,
          equalsIgnoringCase(
              comparisionHash)); // As long as the content is the same, it doesn't matter if it's upper or lower case
    });
    test("hashBytesInChuncks works on string", () async {
      String randomString = StringUtils.generateRandomString(300);
      final bytes = Uint8List.fromList(randomString.codeUnits);
      String hash = await hashLogic.hashBytesInChunks(bytes);
      String expectedHash = CryptoUtils.getHash(bytes);
      expect(hash, equalsIgnoringCase(expectedHash));
    });
    test("hashBytesInChunksFromStream works on string", () async {
      String randomString = StringUtils.generateRandomString(300);
      final bytes = Uint8List.fromList(randomString.codeUnits);
      Stream<List<int>> byteStream = Stream.fromIterable([bytes]);
      String hash = await hashLogic.hashBytesInChunksFromStream(byteStream);
      String expectedHash = CryptoUtils.getHash(bytes);
      expect(hash, equalsIgnoringCase(expectedHash));
    });
  });
}
