import 'dart:io';
import 'dart:typed_data';

import 'package:decentproof/features/hashing/interfaces/IMediaPickerService.dart';
import 'package:decentproof/features/hashing/logic/ImageSavingService.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';

import '../../mocks.dart';
import '../../mocks.mocks.dart';

void main() {
  setUp(() async {
    PathProviderPlatform.instance = FakePathProviderPlatform();
    await GetIt.I.reset();
  });

  final GetIt getIt = GetIt.I;
  group("ImageSavingService", () {
    final IMediaPickerService imagePickerWrapper = MockImagePickerWrapper();
    getIt.registerFactory<IMediaPickerService>(() => imagePickerWrapper);
    final ImageSavingService videoSavingService = ImageSavingService();

    group("successfully", () {
      test("saveFile", () async {
        when(imagePickerWrapper.getVideoAsBytes())
            .thenAnswer((_) async => Uint8List(0));
        String filePath = await videoSavingService.saveFile();
        expect(filePath, isNotNull);
        expect(filePath, contains(kApplicationDocumentsPath));
        expect(filePath, contains(".png"));
      });
    });
    group("fail", () {
      test("to load file", () async {
        when(imagePickerWrapper.getVideoAsBytes())
            .thenThrow(Exception("Could not load file"));
        try {
          await videoSavingService.saveFile();
          fail("Should have thrown");
        } catch (e) {
          expect(e, isException);
        }
      });
    });

    tearDown(() => Directory("applicationDocumentsPath").deleteSync(
        recursive: true)); // To prevent creation of that folderpersisting
  });
}
