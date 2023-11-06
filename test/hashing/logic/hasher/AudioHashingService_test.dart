import 'dart:math';

import 'package:decentproof/features/hashing/logic/hasher/AudioHashingService.dart';
import 'package:decentproof/shared/HashLogic.dart';
import 'package:decentproof/shared/interface/IHashLogic.dart';
import 'package:get_it/get_it.dart';
import 'package:test/test.dart';

void main() {
  final GetIt getIt = GetIt.I;
  const mp3Hash =
      "0244590f2b4bcb62352b574e78bea940e8d89cfa69823b5208ef4c43e0abcb44";

  setUp(() async {
    await getIt.reset();
  });

  group("AudioHashingService", () {
    getIt.registerFactory<IHashLogic>(() => HashLogic());
    final AudioHashingService service = AudioHashingService();

    group("successfully", () {
      test("hash audio file", () async {
        String hash = await service.hash("test/fixtures/sample.mp3");
        expect(hash, equals(mp3Hash));
      });
    });
  });
}
