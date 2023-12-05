import 'package:decentproof/features/hashing/logic/ImagePickerWrapper.dart';
import 'package:decentproof/features/hashing/logic/ImageSavingService.dart';
import 'package:decentproof/features/hashing/logic/VideoSavingService.dart';
import 'package:decentproof/features/hashing/logic/backend/HashSubmissionService.dart';
import 'package:decentproof/features/hashing/logic/backend/ShowInExplorer.dart';
import 'package:decentproof/features/hashing/logic/hasher/AudioHashingService.dart';
import 'package:decentproof/features/hashing/logic/hasher/ImageHashingService.dart';
import 'package:decentproof/features/hashing/logic/hasher/VideoHashingService.dart';
import 'package:decentproof/features/hashing/logic/water_mark/ImageWaterMarkService.dart';
import 'package:decentproof/features/hashing/logic/water_mark/VideoWaterMarkService.dart';
import 'package:decentproof/features/metadata/logic/LocationServiceWrapper.dart';
import 'package:decentproof/features/metadata/logic/MetaDataPermissionService.dart';
import 'package:decentproof/features/metadata/logic/metaDataServices/AudioMetaDataService.dart';
import 'package:decentproof/features/metadata/logic/metaDataServices/ImageMetaDataService.dart';
import 'package:decentproof/features/metadata/logic/metaDataServices/VideoMetaDataService.dart';
import 'package:decentproof/features/verification/logic/FileSelectionService.dart';
import 'package:decentproof/features/verification/logic/SignatureVerificationService.dart';
import 'package:decentproof/features/verification/logic/VerificationService.dart';
import 'package:decentproof/shared/HashLogic.dart';
import 'package:decentproof/shared/Integrety/ApiKeyRequestService.dart';
import 'package:decentproof/shared/Integrety/AppCheck.dart';
import 'package:decentproof/shared/Integrety/SecureStorageWrapper.dart';
import 'package:file_picker/file_picker.dart';
import 'package:file_picker/src/file_picker_result.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:file_picker/src/file_picker.dart';
import 'package:url_launcher_platform_interface/url_launcher_platform_interface.dart';

const String kTemporaryPath = 'temporaryPath';
const String kApplicationSupportPath = 'applicationSupportPath';
const String kDownloadsPath = 'downloadsPath';
const String kLibraryPath = 'libraryPath';
const String kApplicationDocumentsPath = 'applicationDocumentsPath';
const String kExternalCachePath = 'externalCachePath';
const String kExternalStoragePath = 'externalStoragePath';

///
///This is just a placeholder file for the genertion of mocks
///To prevent dupplication of generated code, all classes can be registered here for generation.
///

@GenerateNiceMocks([
  MockSpec<AppCheck>(),
  MockSpec<ApiKeyRequestService>(),
  MockSpec<SecureStorageService>(),
  MockSpec<LocationServiceWrapper>(),
  MockSpec<MetaDataPermissionService>(),
  MockSpec<HashSubmissionService>(),
  MockSpec<ImageMetaDataService>(),
  MockSpec<AudioMetaDataService>(),
  MockSpec<VideoMetaDataService>(),
  MockSpec<VideoSavingService>(),
  MockSpec<ImageSavingService>(),
  MockSpec<ImageWaterMarkService>(),
  MockSpec<VideoWaterMarkService>(),
  MockSpec<AudioHashingService>(),
  MockSpec<ImageHashingService>(),
  MockSpec<VideoHashingService>(),
  MockSpec<VerificationService>(),
  MockSpec<FileSelectionService>(),
  MockSpec<HashLogic>(),
  MockSpec<ImagePickerWrapper>(),
  MockSpec<ShowInExplorer>(),
  MockSpec<SignatureVerificationService>()
])
// ignore: unused_element
void main() {}

class FakeFilePickerProviderPlatform extends Mock
    with MockPlatformInterfaceMixin
    implements FilePicker {
  @override
  Future<FilePickerResult?> pickFiles(
      {String? dialogTitle,
      String? initialDirectory,
      FileType type = FileType.any,
      List<String>? allowedExtensions,
      Function(FilePickerStatus p1)? onFileLoading,
      bool allowCompression = true,
      bool allowMultiple = false,
      bool withData = false,
      bool withReadStream = false,
      bool lockParentWindow = false}) async {
    return FilePickerResult([
      PlatformFile(name: "test.png", size: 0, readStream: const Stream.empty())
    ]);
  }
}

class NullFakeFilePickerProviderPlatform extends Mock
    with MockPlatformInterfaceMixin
    implements FilePicker {
  @override
  Future<FilePickerResult?> pickFiles(
      {String? dialogTitle,
      String? initialDirectory,
      FileType type = FileType.any,
      List<String>? allowedExtensions,
      Function(FilePickerStatus p1)? onFileLoading,
      bool allowCompression = true,
      bool allowMultiple = false,
      bool withData = false,
      bool withReadStream = false,
      bool lockParentWindow = false}) {
    return Future.value(null);
  }
}

class FakePathProviderPlatform extends Mock
    with MockPlatformInterfaceMixin
    implements PathProviderPlatform {
  @override
  Future<String?> getTemporaryPath() async {
    return kTemporaryPath;
  }

  @override
  Future<String?> getApplicationSupportPath() async {
    return kApplicationSupportPath;
  }

  @override
  Future<String?> getLibraryPath() async {
    return kLibraryPath;
  }

  @override
  Future<String?> getApplicationDocumentsPath() async {
    return kApplicationDocumentsPath;
  }

  @override
  Future<String?> getExternalStoragePath() async {
    return kExternalStoragePath;
  }

  @override
  Future<List<String>?> getExternalCachePaths() async {
    return <String>[kExternalCachePath];
  }

  @override
  Future<List<String>?> getExternalStoragePaths({
    StorageDirectory? type,
  }) async {
    return <String>[kExternalStoragePath];
  }

  @override
  Future<String?> getDownloadsPath() async {
    return kDownloadsPath;
  }
}

class MockUrlLauncher extends Mock
    with MockPlatformInterfaceMixin
    implements UrlLauncherPlatform {
  @override
  Future<bool> launchUrl(String url, LaunchOptions options) async {
    return true;
  }
}
