import 'dart:io';

import 'package:decentproof/features/hashing/logic/AudioSavingService.dart';
import 'package:test/test.dart';
// ignore: depend_on_referenced_packages
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';

import '../../mocks.dart';

void main() {
  setUp(() {
    PathProviderPlatform.instance = FakePathProviderPlatform();
  });
  group("AudioSavingService", () {
    test("get save file path", () async {
      AudioSavingService service = AudioSavingService();
      String path = await service.saveFile();
      expect(path, isNotNull);
      expect(
          path,
          contains(
              kApplicationDocumentsPath)); // We either get this if we are not on android or kApplicationExternalStoragePath
    });
  });
}
