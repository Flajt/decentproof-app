import 'package:decentproof/features/hashing/logic/backend/HashSubmissionService.dart';
import 'package:decentproof/shared/Integrety/interfaces/ISecureStorageService.dart';
import 'package:test/test.dart';
import 'package:nock/nock.dart';
import 'package:get_it/get_it.dart';
import '../../../metadata/logic/SecretService_test.dart';

void main() {
  const String baseUrl = "https://example.com";
  final GetIt getIt = GetIt.instance;

  setUpAll(() {
    nock.defaultBase = baseUrl;
    nock.init();
  });

  setUp(() async {
    await GetIt.I.reset();
    nock.cleanAll();
  });

  group("HashSubmissionService", () {
    group("successfully", () {
      final secureStorageService = MockSecureStorage();
      secureStorageService.saveApiKey("123");
      getIt.registerFactory<ISecureStorageService>(() => secureStorageService);
      final hashSubmissionService = HashSubmissionService(url: "$baseUrl/sign");

      test("submit hash without E-Mail", () async {
        final interceptor = nock.post("/sign/", {"data": "lalal", "email": ""})
          ..reply(
            200,
            {"status": "OK"},
          );
        await hashSubmissionService.submitHash("lalal", null);
        expect(interceptor.isDone, true);
        expect(interceptor.statusCode, 200);
      });
      test("submit hash with E-Mail", () async {
        final interceptor =
            nock.post("/sign/", {"data": "lalal", "email": "test@test.com"});
        interceptor.reply(200, "OK");
        await hashSubmissionService.submitHash("lalal", "test@test.com");
        expect(interceptor.isDone, true);
        expect(interceptor.statusCode, 200);
      });
    });
    group("fail", () {
      getIt.unregister<ISecureStorageService>();
      getIt.registerFactory<ISecureStorageService>(
          () => ThrowMockSecureStorage());
      final hashSubmissionService = HashSubmissionService(url: "$baseUrl/sign");

      test("to load api key", () async {
        try {
          await hashSubmissionService.submitHash("lalal", null);
        } catch (e) {
          expect(e, equals("NO API KEY"));
        }
      });
    });
  });
}
