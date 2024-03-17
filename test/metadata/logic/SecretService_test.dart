import 'package:decentproof/features/metadata/logic/SecretService.dart';
import 'package:decentproof/shared/Integrety/interfaces/ISecureStorageService.dart';
import 'package:test/test.dart';
import 'package:get_it/get_it.dart';

class MockSecureStorage implements ISecureStorageService {
  Map<String, dynamic> storage = {};
  @override
  Future<String?> retriveApiKey() {
    return Future.value(storage["key"]);
  }

  @override
  Future<String?> retriveEmail() {
    throw UnimplementedError();
  }

  @override
  Future<String?> retriveSecret() {
    return Future.value(storage["secret"]);
  }

  @override
  Future<void> saveApiKey(String key) async {
    storage["key"] = key;
  }

  @override
  Future<void> saveEmail(String email) async {
    throw UnimplementedError();
  }

  @override
  Future<void> saveSecret(String secret) async {
    storage["secret"] = secret;
  }

  @override
  Future<void> deleteEmail() async {
    throw UnimplementedError();
  }
}

class ThrowMockSecureStorage implements ISecureStorageService {
  @override
  Future<String?> retriveApiKey() {
    return Future.value(null);
  }

  @override
  Future<String?> retriveEmail() {
    throw UnimplementedError();
  }

  @override
  Future<String?> retriveSecret() {
    return Future.value(null);
  }

  @override
  Future<void> saveApiKey(String key) {
    throw UnimplementedError();
  }

  @override
  Future<void> saveEmail(String email) {
    throw UnimplementedError();
  }

  @override
  Future<void> saveSecret(String secret) {
    throw UnimplementedError();
  }

  @override
  Future<void> deleteEmail() {
    throw UnimplementedError();
  }
}

void main() {
  final getIt = GetIt.instance;
  setUp(() async {
    await GetIt.I.reset();
  });

  group("attempt to write", () {
    test("secret to store", () async {
      getIt.registerFactory<ISecureStorageService>(() => MockSecureStorage());
      final SecretService service = SecretService();
      const secret = "secret";
      await service.saveSecret(secret);
      String foundSecret = String.fromCharCodes(await service.secret);
      assert(secret == foundSecret);
    });
  });
  group("if null", () {
    test("while reading, throw error", () async {
      getIt.registerFactory<ISecureStorageService>(
          () => ThrowMockSecureStorage());
      final SecretService service = SecretService();
      try {
        await service.secret;
      } catch (e) {
        assert(e.toString() == "Exception: Secret is null");
      }
    });
  });
}
