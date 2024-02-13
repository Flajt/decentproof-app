import 'package:decentproof/features/hashing/logic/hasher/ImageHashingService.dart';
import 'package:decentproof/shared/HashLogic.dart';
import 'package:decentproof/shared/interface/IHashLogic.dart';
import 'package:get_it/get_it.dart';
import 'package:test/test.dart';

void main() {
  final GetIt getIt = GetIt.I;
  const imageHash =
      "3edd6754e7ef3164f0814ccf55baf4f619572b88ecf1ab6579515bc6e4393546";

  setUp(() async {
    await getIt.reset();
  });

  group("ImageHashingService", () {
    getIt.registerFactory<IHashLogic>(() => HashLogic());
    final ImageHashingService service = ImageHashingService();

    group("successfully", () {
      test("hash image file", () async {
        String hash = await service.hash("test/fixtures/icon.png", (p) {});
        expect(hash, equals(imageHash));
      });
    });
  });
}
