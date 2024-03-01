import "dart:io";

import "package:decentproof/features/hashing/logic/hasher/ImageHashingService.dart";
import "package:decentproof/features/hashing/logic/water_mark/ImageWaterMarkService.dart";
import "package:decentproof/shared/HashLogic.dart";
import "package:decentproof/shared/interface/IHashLogic.dart";
import "package:flutter_test/flutter_test.dart";
import "package:get_it/get_it.dart";

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  const basePath = "test/fixtures";
  final GetIt getIt = GetIt.I;
  const beforeWaterMarkHash =
      "3edd6754e7ef3164f0814ccf55baf4f619572b88ecf1ab6579515bc6e4393546";
  group("ImageWaterMarkService", () {
    setUp(() async {
      final image = File("$basePath/icon.png");
      await image.copy("$basePath/icon_copy.png");
      await GetIt.I.reset();
    });

    getIt.registerFactory<IHashLogic>(() => HashLogic());
    final ImageHashingService hashLogic = ImageHashingService();

    group("successfully", () {
      test("add watermark", () async {
        ImageWaterMarkService service = ImageWaterMarkService();
        String filePath = await service.addWaterMark("$basePath/icon_copy.png");
        String hash = await hashLogic.hash(filePath, (p) {});
        expect(hash, isNot(equals(beforeWaterMarkHash)));
      });
    });
  });
  tearDown(() async => await File("$basePath/icon_copy.png").delete());
}
