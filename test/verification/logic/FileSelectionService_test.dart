import 'package:decentproof/features/verification/logic/FileSelectionService.dart';
import 'package:decentproof/features/verification/models/FileDataMode.dart';
import 'package:file_picker/file_picker.dart';
import 'package:test/test.dart';

import '../../mocks.dart';

void main() {
  group("FileSelectionService", () {
    test("should return null when no file is selected", () async {
      FilePicker.platform =
          NullFakeFilePickerProviderPlatform(); // Simulates no file selected
      final picker = FileSelectionService();
      FileDataModel? data = await picker.selectFileAsStream();
      expect(data, isNull);
    });

    test("should return FileDataModel when file is selected", () async {
      FilePicker.platform = FakeFilePickerProviderPlatform();
      final picker = FileSelectionService();
      FileDataModel? data = await picker.selectFileAsStream();
      expect(data, isNotNull);
    });
  });
}
