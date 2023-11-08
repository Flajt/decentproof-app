import 'package:decentproof/features/metadata/logic/MetaDataPermissionService.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final MetaDataPermissionService service = MetaDataPermissionService();
  group("read data", () {
    setUp(() async {
      SharedPreferences.setMockInitialValues(
          {"allowLocation": false, "allowSecret": true});
      await service.init();
    });
    test("read location flag", () {
      bool shouldEmbed = service.shouldEmbedLocation();
      assert(!shouldEmbed);
    });
    test("read secret flag", () {
      bool shouldEmbed = service.shouldEmbedSecret();
      assert(shouldEmbed);
    });
  });
  group("write data", () {
    setUp(() async {
      SharedPreferences.setMockInitialValues({});
      await service.init();
    });
    test("allow secret emedding", () async {
      await service.allowSecretEmbedding(true);
      bool shouldAllow = service.shouldEmbedSecret();
      expect(shouldAllow, true);
    });
    test("allow location embedding", () async {
      await service.allowLocationEmbedding(true);
      bool shouldAllow = service.shouldEmbedLocation();
      expect(shouldAllow, true);
    });
  });

  tearDown(() => SharedPreferences.getInstance()
      .then((value) async => await value.clear()));
}
