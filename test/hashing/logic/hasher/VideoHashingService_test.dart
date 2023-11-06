import 'package:decentproof/features/hashing/logic/hasher/VideoHashingService.dart';
import 'package:decentproof/shared/HashLogic.dart';
import 'package:decentproof/shared/interface/IHashLogic.dart';
import 'package:get_it/get_it.dart';
import 'package:test/test.dart';

void main() {
  final GetIt getIt = GetIt.I;
  const videoHash =
      "d9a8bd987b2239b5234f5f064a5abec7b6666610fd858a08524620ebce1da883";

  setUp(() async {
    await getIt.reset();
  });

  group("AudioHashingService", () {
    getIt.registerFactory<IHashLogic>(() => HashLogic());
    final VideoHashingService service = VideoHashingService();

    group("successfully", () {
      test("hash audio file", () async {
        String hash = await service.hash("test/fixtures/sample.mkv");
        expect(hash, equals(videoHash));
      });
    });
  });
}
