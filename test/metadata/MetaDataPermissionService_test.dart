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
      bool shouldEbmed = service.shouldEmbedLocation();
      assert(!shouldEbmed);
    });
    test("read secret flag", () {
      bool shouldEmbed = service.shouldEmbedSecret();
      assert(shouldEmbed);
    });
  });

  tearDown(() => SharedPreferences.getInstance()
      .then((value) async => await value.clear()));
}
