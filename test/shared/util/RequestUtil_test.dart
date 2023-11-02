import 'package:decentproof/shared/Integrety/ApiKeyRequestService.dart';
import 'package:decentproof/shared/Integrety/AppCheck.dart';
import 'package:decentproof/shared/Integrety/SecureStorageWrapper.dart';
import 'package:decentproof/shared/Integrety/interfaces/IApiKeyRequestService.dart';
import 'package:decentproof/shared/Integrety/interfaces/IDeviceIntegrity.dart';
import 'package:decentproof/shared/Integrety/interfaces/ISecureStorageService.dart';
import 'package:decentproof/shared/util/RequestUtil.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

@GenerateNiceMocks([
  MockSpec<AppCheck>(),
  MockSpec<ApiKeyRequestService>(),
  MockSpec<SecureStorageService>()
])
import "RequestUtil_test.mocks.dart";

void main() {
  setUp(() async {
    await GetIt.I.reset();
  });
  group("RequestUtil success", () {
    final GetIt getIt = GetIt.I;
    final MockAppCheck mockAppCheck = MockAppCheck();
    final MockApiKeyRequestService mockApiKeyRequestService =
        MockApiKeyRequestService();
    final MockSecureStorageService mockSecureStorageService =
        MockSecureStorageService();
    test("hasKey is true", () async {
      getIt.registerFactory<IDeviceIntegrety>(() => mockAppCheck);
      getIt.registerFactory<ISecureStorageService>(
          () => mockSecureStorageService);
      getIt.registerFactory<IApiKeyRequestService>(
          () => mockApiKeyRequestService);
      when(mockSecureStorageService.retriveApiKey())
          .thenAnswer((_) => Future.value("a-cool-api-key"));
      await RequestUtil.updateOrRetriveKey();
      verify(mockSecureStorageService.retriveApiKey());
    });
    test("Atleast One in four tries triggers search for new key", () async {
      getIt.registerFactory<IDeviceIntegrety>(() => mockAppCheck);
      getIt.registerFactory<ISecureStorageService>(
          () => mockSecureStorageService);
      getIt.registerFactory<IApiKeyRequestService>(
          () => mockApiKeyRequestService);
      when(mockSecureStorageService.retriveApiKey())
          .thenAnswer((_) => Future.value("a-cool-api-key"));
      when(mockApiKeyRequestService.checkForNewApiKey(any))
          .thenAnswer((_) => Future.value(false));
      for (var i = 0; i <= 3; i++) {
        await RequestUtil.updateOrRetriveKey();
      }
      verify(mockApiKeyRequestService.checkForNewApiKey(any))
          .called(greaterThanOrEqualTo(1));
    }, retry: 2);

    test("successfull full pass through", () async {
      getIt.registerFactory<IDeviceIntegrety>(() => mockAppCheck);
      getIt.registerFactory<ISecureStorageService>(
          () => mockSecureStorageService);
      getIt.registerFactory<IApiKeyRequestService>(
          () => mockApiKeyRequestService);
      when(mockSecureStorageService.retriveApiKey())
          .thenAnswer((_) => Future.value("a-cool-api-key"));
      when(mockApiKeyRequestService.checkForNewApiKey(any))
          .thenAnswer((_) => Future.value(true));
      when(mockAppCheck.getIntegrityToken())
          .thenAnswer((realInvocation) => Future.value("a-token"));
      when(mockApiKeyRequestService.getNewNewKey(any))
          .thenAnswer((_) => Future.value("a-new-key"));
      for (var i = 0; i <= 3; i++) {
        await RequestUtil.updateOrRetriveKey();
      }
      verify(mockSecureStorageService.saveApiKey(any))
          .called(greaterThanOrEqualTo(1));
      verify(mockApiKeyRequestService.getNewNewKey(any))
          .called(greaterThanOrEqualTo(1));
    }, retry: 2);

    test("retriveApiKey is null", () async {
      getIt.registerFactory<IDeviceIntegrety>(() => mockAppCheck);
      getIt.registerFactory<ISecureStorageService>(
          () => mockSecureStorageService);
      getIt.registerFactory<IApiKeyRequestService>(
          () => mockApiKeyRequestService);
      when(mockSecureStorageService.retriveApiKey())
          .thenAnswer((_) => Future.value(null));
      when(mockApiKeyRequestService.checkForNewApiKey(any))
          .thenAnswer((_) => Future.value(true));
      when(mockAppCheck.getIntegrityToken())
          .thenAnswer((realInvocation) => Future.value("a-token"));
      when(mockApiKeyRequestService.getNewNewKey(any))
          .thenAnswer((_) => Future.value("a-new-key"));
      await RequestUtil.updateOrRetriveKey();
      verify(mockSecureStorageService.saveApiKey(any)).called(equals(1));
      verify(mockApiKeyRequestService.getNewNewKey(any)).called(equals(1));
    }, retry: 2);
  });
  group("Request util failure", () {
    final GetIt getIt = GetIt.I;
    final MockAppCheck mockAppCheck = MockAppCheck();
    final MockApiKeyRequestService mockApiKeyRequestService =
        MockApiKeyRequestService();
    final MockSecureStorageService mockSecureStorageService =
        MockSecureStorageService();

    test("retriveApiKey throws", () async {
      //Retrive ApiKey throws
      getIt.registerFactory<IDeviceIntegrety>(() => mockAppCheck);
      getIt.registerFactory<ISecureStorageService>(
          () => mockSecureStorageService);
      getIt.registerFactory<IApiKeyRequestService>(
          () => mockApiKeyRequestService);

      when(mockSecureStorageService.retriveApiKey())
          .thenThrow("Something went wrong");
      try {
        await RequestUtil.updateOrRetriveKey();
      } catch (e) {
        expect(e, isA<String>());
        expect(e, equals("Something went wrong"));
      }
    });
  });
}
