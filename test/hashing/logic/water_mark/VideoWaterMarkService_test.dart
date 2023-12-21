import "dart:io";

import "package:decentproof/features/hashing/logic/hasher/VideoHashingService.dart";
import "package:decentproof/features/hashing/logic/water_mark/VideoWaterMarkService.dart";
import "package:decentproof/shared/HashLogic.dart";
import "package:decentproof/shared/interface/IHashLogic.dart";
import "package:flutter_test/flutter_test.dart";
import "package:get_it/get_it.dart";

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  const basePath = "test/fixtures";
  final GetIt getIt = GetIt.I;
  const beforeWaterMarkHash =
      "d9a8bd987b2239b5234f5f064a5abec7b6666610fd858a08524620ebce1da883";
  group("VideoWaterMarkService", () {
    setUp(() async {
      final image = File("$basePath/sample.mkv");
      await image.copy("$basePath/sample_copy.png");
      await GetIt.I.reset();
    });

    getIt.registerFactory<IHashLogic>(() => HashLogic());
    final VideoHashingService hashLogic = VideoHashingService();

    group("successfully", () {
      test("add watermark", () async {
        VideoWaterMarkService service = VideoWaterMarkService();
        String filePath =
            await service.addWaterMark("$basePath/sample_copy.mkv");
        String hash = await hashLogic.hash(filePath);
        expect(hash, isNot(equals(beforeWaterMarkHash)));
      });
    });
  },
      skip:
          "would require platform specific implementation to be a usefull test");
  tearDown(() async => await File("$basePath/sample_copy.mkv").delete());
}
