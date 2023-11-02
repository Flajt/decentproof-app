import 'package:decentproof/features/hashing/interfaces/IFileSavingService.dart';
import 'package:decentproof/features/hashing/interfaces/IHashSubmissionService.dart';
import 'package:decentproof/features/hashing/interfaces/IHashingService.dart';
import 'package:decentproof/features/hashing/interfaces/IMediaPickerService.dart';
import 'package:decentproof/features/hashing/interfaces/IWaterMarkService.dart';
import 'package:decentproof/features/hashing/logic/AudioSavingService.dart';
import 'package:decentproof/features/hashing/logic/ImagePickerWrapper.dart';
import 'package:decentproof/features/hashing/logic/ImageSavingService.dart';
import 'package:decentproof/features/hashing/logic/VideoSavingService.dart';
import 'package:decentproof/features/hashing/logic/backend/HashSubmissionService.dart';
import 'package:decentproof/features/hashing/logic/hasher/AudioHashingService.dart';
import 'package:decentproof/features/hashing/logic/hasher/ImageHashingService.dart';
import 'package:decentproof/features/hashing/logic/hasher/VideoHashingService.dart';
import 'package:decentproof/features/hashing/logic/water_mark/ImageWaterMarkService.dart';
import 'package:decentproof/features/hashing/logic/water_mark/VideoWaterMarkService.dart';
import 'package:decentproof/features/metadata/interfaces/ILocationService.dart';
import 'package:decentproof/features/metadata/interfaces/IMetaDataPermissionService.dart';
import 'package:decentproof/features/metadata/interfaces/IMetaDataService.dart';
import 'package:decentproof/features/metadata/logic/LocationService.dart';
import 'package:decentproof/features/metadata/logic/MetaDataPermissionService.dart';
import 'package:decentproof/features/metadata/logic/metaDataServices/ImageMetaDataService.dart';
import 'package:decentproof/features/metadata/logic/metaDataServices/VideoMetaDataService.dart';
import 'package:decentproof/features/verification/interfaces/IFileSelectionService.dart';
import 'package:decentproof/features/verification/interfaces/ISignatureVerifcationService.dart';
import 'package:decentproof/features/verification/interfaces/IVerificationService.dart';
import 'package:decentproof/features/verification/logic/FileSelectionService.dart';
import 'package:decentproof/features/verification/logic/SignatureVerificationService.dart';
import 'package:decentproof/features/verification/logic/VerificationService.dart';
import 'package:decentproof/shared/HashLogic.dart';
import 'package:decentproof/shared/Integrety/ApiKeyRequestService.dart';
import 'package:decentproof/shared/Integrety/AppCheck.dart';
import 'package:decentproof/shared/Integrety/interfaces/IApiKeyRequestService.dart';
import 'package:decentproof/shared/Integrety/interfaces/IDeviceIntegrity.dart';
import 'package:decentproof/shared/interface/IHashLogic.dart';
import 'package:get_it/get_it.dart';

import '../../features/metadata/logic/metaDataServices/AudioMetaDataService.dart';
import '../Integrety/SecureStorageWrapper.dart';
import '../Integrety/interfaces/ISecureStorageService.dart';

/// Register classed for dependency injection
Future<void> registar() async {
  // Example:
  // GetIt.I.registerLazySingleton<ISecureStorageService>(() => SecureStorageService());

  final getIt = GetIt.I;
  getIt.registerFactory<ISecureStorageService>(() => SecureStorageService());
  getIt.registerFactory<IApiKeyRequestService>(() => ApiKeyRequestService());
  getIt.registerFactory<IDeviceIntegrety>(() => AppCheck());
  getIt.registerFactory<ISignatureVerificationService>(
      () => SignatureVerificationService());
  getIt.registerFactory<IVerificationService>(() => VerificatinService());
  getIt.registerFactory<IFileSelectionService>(() => FileSelectionService());
  getIt.registerFactory<IHashLogic>(() => HashLogic());
  getIt.registerFactory<IHashSubmissionService>(() => HashSubmissionService());
  getIt.registerFactory<IHashingService>(() => ImageHashingService(),
      instanceName: "ImageHashing");
  getIt.registerFactory<IHashingService>(() => VideoHashingService(),
      instanceName: "VideoHashing");
  getIt.registerFactory<IHashingService>(() => AudioHashingService(),
      instanceName: "AudioHashing");
  getIt.registerFactory<IMediaPickerService>(() => ImagePickerWrapper());
  getIt.registerFactory<IFileSavingService>(() => ImageSavingService(),
      instanceName: "ImageSaving");
  getIt.registerFactory<IFileSavingService>(() => VideoSavingService(),
      instanceName: "VideoSaving");
  getIt.registerFactory<IFileSavingService>(() => AudioSavingService(),
      instanceName: "AudioSaving");
  getIt.registerFactory<IWaterMarkService>(() => VideoWaterMarkService(),
      instanceName: "VideoWaterMark");
  getIt.registerFactory<IWaterMarkService>(() => ImageWaterMarkService(),
      instanceName: "ImageWaterMark");
  getIt.registerFactory<ILocationService>(() => LocationService());
  getIt.registerSingleton<IMetaDataPermissionService>(
      MetaDataPermissionService());
  await getIt
      .get<IMetaDataPermissionService>()
      .init(); // Workaround to fix initalisation issues
  getIt.registerFactory<IMetaDataService>(() => ImageMetaDataService(),
      instanceName: "ImageMetaData");
  getIt.registerFactory<IMetaDataService>(() => VideoMetaDataService(),
      instanceName: "VideoMetaData");
  getIt.registerFactory<IMetaDataService>(() => AudioMetaDataService(),
      instanceName: "AudioMetaData");
  await getIt.allReady();
}
