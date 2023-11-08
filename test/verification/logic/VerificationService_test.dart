import 'package:decentproof/features/metadata/models/MetaDataModel.dart';
import 'package:decentproof/features/verification/interfaces/ISignatureVerifcationService.dart';
import 'package:decentproof/features/verification/logic/VerificationService.dart';
import 'package:decentproof/features/verification/models/VerificationStatusModel.dart';
import 'package:decentproof/features/verification/models/VerificationStatusResponse.dart';
import 'package:decentproof/shared/Integrety/interfaces/ISecureStorageService.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';
import 'package:nock/nock.dart';
import 'package:test/test.dart';

import '../../metadata/logic/SecretService_test.dart';
import '../../mocks.mocks.dart';

void main() {
  final GetIt getIt = GetIt.I;
  const String baseUrl = "https://example.com";
  final secureStorageService = MockSecureStorage();
  final signatureVerificationService =
      MockSignatureVerificationService(); // Used so that I don't need to setup valid signatures and hashes
  final json = {
    "error_code": 0,
    "error_message": "",
    "data": {
      "created": true,
      "comment": "fancy-signature-here",
      "date_created": 1623340800,
      "hash_string": "lalal",
      "timestamps": [
        {
          "submit_status": 3,
          "transaction": "0x123456789",
          "seed_id": "1234",
          "currency_id": 3,
          "private_key": "1234",
          "timestamp": 1623340800
        }
      ]
    }
  };
  setUpAll(() {
    nock.defaultBase = baseUrl;
    nock.init();
  });
  setUp(() async {
    await getIt.reset();
    nock.cleanAll();
  });

  group("VerificationService", () {
    getIt.registerFactory<ISignatureVerificationService>(
        () => signatureVerificationService);
    getIt.registerFactory<ISecureStorageService>(() => secureStorageService);
    final verificationService = VerificationService(url: "$baseUrl/verify");
    group("successfully", () {
      setUpAll(() async => await secureStorageService.saveApiKey("123"));
      test("return data based on response from server", () async {
        when(signatureVerificationService.verify(any, any)).thenReturn(true);
        final interceptor = nock.post("/verify/", {"hash": "lalal"})
          ..reply(
            200,
            json,
          );
        final resp = await verificationService.verify("lalal");
        expect(
            resp,
            equals(VerificationStatusModel(
                true,
                true,
                DateTime.fromMillisecondsSinceEpoch(1623340800),
                3,
                "0x123456789",
                null)));
        expect(interceptor.isDone, true);
        expect(interceptor.statusCode, 200);
      });
    });
    group("failure", () {
      tearDown(() => secureStorageService.storage.clear());
      test("to return a valid status code will lead to an exception", () async {
        await secureStorageService.saveApiKey("123");
        final interceptor = nock.post("/verify/", {"hash": "lalal"})
          ..reply(
            400,
            json,
          );
        try {
          await verificationService.verify("lalal");
        } catch (e) {
          expect(e, isException);
        }
        expect(interceptor.statusCode, 400);
        expect(interceptor.isDone, true);
      });
      test("to access null api key throws exception", () {
        expect(verificationService.verify("lalal"), throwsA(isException));
      });
    });
  });
}
