import 'package:decentproof/features/hashing/logic/ImageSavingService.dart';
import 'package:decentproof/features/hashing/logic/VideoSavingService.dart';
import 'package:decentproof/features/hashing/logic/backend/HashSubmissionService.dart';
import 'package:decentproof/features/hashing/logic/hasher/AudioHashingService.dart';
import 'package:decentproof/features/hashing/logic/hasher/ImageHashingService.dart';
import 'package:decentproof/features/hashing/logic/hasher/VideoHashingService.dart';
import 'package:decentproof/features/hashing/logic/water_mark/ImageWaterMarkService.dart';
import 'package:decentproof/features/hashing/logic/water_mark/VideoWaterMarkService.dart';
import 'package:decentproof/features/metadata/logic/LocationService.dart';
import 'package:decentproof/features/metadata/logic/MetaDataPermissionService.dart';
import 'package:decentproof/features/metadata/logic/metaDataServices/AudioMetaDataService.dart';
import 'package:decentproof/features/metadata/logic/metaDataServices/ImageMetaDataService.dart';
import 'package:decentproof/features/metadata/logic/metaDataServices/VideoMetaDataService.dart';
import 'package:decentproof/shared/Integrety/ApiKeyRequestService.dart';
import 'package:decentproof/shared/Integrety/AppCheck.dart';
import 'package:decentproof/shared/Integrety/SecureStorageWrapper.dart';
import 'package:mockito/annotations.dart';

///
///This is just a placeholder file for the genertion of mocks
///To prevent dupplication of generated code, all classes can be registered here for generation.
///

@GenerateNiceMocks([
  MockSpec<AppCheck>(),
  MockSpec<ApiKeyRequestService>(),
  MockSpec<SecureStorageService>(),
  MockSpec<LocationService>(),
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
  MockSpec<VideoHashingService>()
])
// ignore: unused_element
void main() {}
