import 'package:bloc_test/bloc_test.dart';
import 'package:decentproof/features/hashing/bloc/PreparationBloc/PerparationEvents.dart';
import 'package:decentproof/features/hashing/bloc/PreparationBloc/PerparationStates.dart';
import 'package:decentproof/features/hashing/bloc/PreparationBloc/PreparationBloc.dart';
import 'package:decentproof/features/hashing/interfaces/IFileSavingService.dart';
import 'package:decentproof/features/hashing/interfaces/IHashingService.dart';
import 'package:decentproof/features/hashing/interfaces/IWaterMarkService.dart';
import 'package:decentproof/features/metadata/interfaces/ILocationService.dart';
import 'package:decentproof/features/metadata/interfaces/IMetaDataPermissionService.dart';
import 'package:decentproof/features/metadata/interfaces/IMetaDataService.dart';
import 'package:decentproof/features/metadata/models/LocationModel.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../../mocks.mocks.dart';

void main() {
  setUp(() async {
    await GetIt.I.reset();
  });
  group("PreparationBloc", () {
    final videoSavingService = MockVideoSavingService();
    final imageSavingService = MockImageSavingService();
    final imageHashingService = MockImageHashingService();
    final videoHashingService = MockVideoHashingService();
    final videoWaterMarkSerivce = MockVideoWaterMarkService();
    final imageWaterMarkService = MockImageWaterMarkService();
    final audioMetaDataService = MockAudioMetaDataService();
    final videoMetaDataService = MockVideoMetaDataService();
    final imageMetaDataService = MockImageMetaDataService();
    final metaDataPermissionService = MockMetaDataPermissionService();
    final audioHashingService = MockAudioHashingService();
    final locationService = MockLocationServiceWrapper();
    const sampleLocationModel = LocationModel(latitude: 0.0, longitude: 0.0);

    group("prepare audio", () {
      blocTest("w. embedded location",
          setUp: () {
            register(
                videoSavingService,
                imageSavingService,
                imageHashingService,
                videoHashingService,
                videoWaterMarkSerivce,
                imageWaterMarkService,
                audioMetaDataService,
                videoMetaDataService,
                imageMetaDataService,
                audioHashingService,
                locationService,
                metaDataPermissionService);

            when(metaDataPermissionService.shouldEmbedLocation())
                .thenReturn(true);
            when(locationService.requestLocation()).thenAnswer(
                (realInvocation) => Future.value(sampleLocationModel));
            when(audioMetaDataService.addLocation(
                    sampleLocationModel, "sample/path/to/file.aac"))
                .thenAnswer((realInvocation) =>
                    Future.value("sample/path/to/file.mp3"));
            when(audioHashingService.hash("sample/path/to/file.mp3"))
                .thenAnswer((realInvocation) => Future.value("cool-hash"));
          },
          act: (bloc) => bloc.add(PrepareAudio("sample/path/to/file.aac")),
          build: () => PreparationBloc(),
          wait: const Duration(milliseconds: 100),
          expect: () => [
                PrepareationIsAddingMetaData(),
                PrepareationIsHashing(),
                PreparationIsSuccessfull("sample/path/to/file.mp3", "cool-hash")
              ]);
      blocTest("without ebedding location",
          setUp: () {
            register(
                videoSavingService,
                imageSavingService,
                imageHashingService,
                videoHashingService,
                videoWaterMarkSerivce,
                imageWaterMarkService,
                audioMetaDataService,
                videoMetaDataService,
                imageMetaDataService,
                audioHashingService,
                locationService,
                metaDataPermissionService);

            when(metaDataPermissionService.shouldEmbedLocation())
                .thenReturn(false);
            when(audioHashingService.hash(any))
                .thenAnswer((realInvocation) => Future.value("cool-hash"));
          },
          build: () => PreparationBloc(),
          act: (bloc) => bloc.add(PrepareAudio("sample/path/to/file.aac")),
          wait: const Duration(milliseconds: 100),
          expect: () => [
                PrepareationIsHashing(),
                PreparationIsSuccessfull("sample/path/to/file.aac", "cool-hash")
              ]);
      blocTest(
        "w. error",
        setUp: () {
          register(
              videoSavingService,
              imageSavingService,
              imageHashingService,
              videoHashingService,
              videoWaterMarkSerivce,
              imageWaterMarkService,
              audioMetaDataService,
              videoMetaDataService,
              imageMetaDataService,
              audioHashingService,
              locationService,
              metaDataPermissionService);

          when(metaDataPermissionService.shouldEmbedLocation())
              .thenReturn(false);
          when(audioHashingService.hash(any)).thenThrow("Something went wrong");
        },
        build: () => PreparationBloc(),
        act: (bloc) => bloc.add(PrepareAudio("sample/path/to/file.aac")),
        wait: const Duration(milliseconds: 100),
        expect: () => [
          PrepareationIsHashing(),
          PreparationHasError("Something went wrong")
        ],
      );
    });
    group("prepareVideo", () {
      blocTest("w. embedded location",
          setUp: () {
            register(
                videoSavingService,
                imageSavingService,
                imageHashingService,
                videoHashingService,
                videoWaterMarkSerivce,
                imageWaterMarkService,
                audioMetaDataService,
                videoMetaDataService,
                imageMetaDataService,
                audioHashingService,
                locationService,
                metaDataPermissionService);

            when(videoSavingService.saveFile())
                .thenAnswer((_) => Future.value("some/path/to/video.mp4"));
            when(videoWaterMarkSerivce.addWaterMark(any))
                .thenAnswer((_) => Future.value("sample/path/to/video.mkv"));
            when(metaDataPermissionService.shouldEmbedLocation())
                .thenReturn(true);
            when(locationService.requestLocation()).thenAnswer(
                (realInvocation) => Future.value(sampleLocationModel));
            when(videoMetaDataService.addLocation(sampleLocationModel, any))
                .thenAnswer((_) => Future.value("sample/path/to/video.mkv"));
            when(videoHashingService.hash(any))
                .thenAnswer((realInvocation) => Future.value("cool-hash"));
          },
          act: (bloc) => bloc.add(PrepareVideo()),
          build: () => PreparationBloc(),
          wait: const Duration(milliseconds: 100),
          expect: () => [
                PrepareationIsAplyingWaterMark(),
                PrepareationIsAddingMetaData(),
                PrepareationIsHashing(),
                PreparationIsSuccessfull(
                    "sample/path/to/video.mkv", "cool-hash")
              ]);

      blocTest("without ebedding location",
          setUp: () {
            register(
                videoSavingService,
                imageSavingService,
                imageHashingService,
                videoHashingService,
                videoWaterMarkSerivce,
                imageWaterMarkService,
                audioMetaDataService,
                videoMetaDataService,
                imageMetaDataService,
                audioHashingService,
                locationService,
                metaDataPermissionService);

            when(videoSavingService.saveFile())
                .thenAnswer((_) => Future.value("sample/path/to/video.mp4"));
            when(metaDataPermissionService.shouldEmbedLocation())
                .thenReturn(false);
            when(videoWaterMarkSerivce.addWaterMark(any))
                .thenAnswer((_) => Future.value("sample/path/to/video.mkv"));
            when(videoHashingService.hash(any))
                .thenAnswer((realInvocation) => Future.value("cool-hash"));
          },
          build: () => PreparationBloc(),
          act: (bloc) => bloc.add(PrepareVideo()),
          wait: const Duration(milliseconds: 100),
          expect: () => [
                PrepareationIsAplyingWaterMark(),
                PrepareationIsHashing(),
                PreparationIsSuccessfull(
                    "sample/path/to/video.mkv", "cool-hash")
              ]);
      blocTest(
        "w. error",
        setUp: () {
          register(
              videoSavingService,
              imageSavingService,
              imageHashingService,
              videoHashingService,
              videoWaterMarkSerivce,
              imageWaterMarkService,
              audioMetaDataService,
              videoMetaDataService,
              imageMetaDataService,
              audioHashingService,
              locationService,
              metaDataPermissionService);

          when(videoSavingService.saveFile())
              .thenAnswer((_) => Future.value("sample/path/to/video.mp4"));
          when(metaDataPermissionService.shouldEmbedLocation())
              .thenReturn(false);
          when(videoWaterMarkSerivce.addWaterMark(any))
              .thenAnswer((_) => Future.value("sample/path/to/video.mkv"));
          when(videoHashingService.hash(any)).thenThrow("Something went wrong");
        },
        build: () => PreparationBloc(),
        act: (bloc) => bloc.add(PrepareVideo()),
        wait: const Duration(milliseconds: 100),
        expect: () => [
          PrepareationIsAplyingWaterMark(),
          PrepareationIsHashing(),
          PreparationHasError("Something went wrong")
        ],
      );
    });
    group("prepareImage", () {
      blocTest("w. embedded location",
          setUp: () {
            register(
                videoSavingService,
                imageSavingService,
                imageHashingService,
                videoHashingService,
                videoWaterMarkSerivce,
                imageWaterMarkService,
                audioMetaDataService,
                videoMetaDataService,
                imageMetaDataService,
                audioHashingService,
                locationService,
                metaDataPermissionService);

            when(imageSavingService.saveFile())
                .thenAnswer((_) => Future.value("some/path/to/image.png"));
            when(imageWaterMarkService.addWaterMark(any))
                .thenAnswer((_) => Future.value("sample/path/to/image.png"));
            when(metaDataPermissionService.shouldEmbedLocation())
                .thenReturn(true);
            when(locationService.requestLocation())
                .thenAnswer((_) => Future.value(sampleLocationModel));
            when(imageMetaDataService.addLocation(sampleLocationModel, any))
                .thenAnswer((_) => Future.value("sample/path/to/image.png"));
            when(imageHashingService.hash(any))
                .thenAnswer((_) => Future.value("cool-hash"));
          },
          act: (bloc) => bloc.add(PrepareImage()),
          build: () => PreparationBloc(),
          wait: const Duration(milliseconds: 100),
          expect: () => [
                PrepareationIsAplyingWaterMark(),
                PrepareationIsAddingMetaData(),
                PrepareationIsHashing(),
                PreparationIsSuccessfull(
                    "sample/path/to/image.png", "cool-hash")
              ]);

      blocTest("without ebedding location",
          setUp: () {
            register(
                videoSavingService,
                imageSavingService,
                imageHashingService,
                videoHashingService,
                videoWaterMarkSerivce,
                imageWaterMarkService,
                audioMetaDataService,
                videoMetaDataService,
                imageMetaDataService,
                audioHashingService,
                locationService,
                metaDataPermissionService);

            when(imageSavingService.saveFile())
                .thenAnswer((_) => Future.value("sample/path/to/image.png"));
            when(metaDataPermissionService.shouldEmbedLocation())
                .thenReturn(false);
            when(imageWaterMarkService.addWaterMark(any))
                .thenAnswer((_) => Future.value("sample/path/to/image.png"));
            when(imageHashingService.hash(any))
                .thenAnswer((realInvocation) => Future.value("cool-hash"));
          },
          build: () => PreparationBloc(),
          act: (bloc) => bloc.add(PrepareImage()),
          wait: const Duration(milliseconds: 100),
          expect: () => [
                PrepareationIsAplyingWaterMark(),
                PrepareationIsHashing(),
                PreparationIsSuccessfull(
                    "sample/path/to/image.png", "cool-hash")
              ]);
      blocTest(
        "w. error",
        setUp: () {
          register(
              videoSavingService,
              imageSavingService,
              imageHashingService,
              videoHashingService,
              videoWaterMarkSerivce,
              imageWaterMarkService,
              audioMetaDataService,
              videoMetaDataService,
              imageMetaDataService,
              audioHashingService,
              locationService,
              metaDataPermissionService);

          when(imageSavingService.saveFile())
              .thenAnswer((_) => Future.value("sample/path/to/image.png"));
          when(metaDataPermissionService.shouldEmbedLocation())
              .thenReturn(false);
          when(imageWaterMarkService.addWaterMark(any))
              .thenAnswer((_) => Future.value("sample/path/to/image.png"));
          when(imageHashingService.hash(any)).thenThrow("Something went wrong");
        },
        build: () => PreparationBloc(),
        act: (bloc) => bloc.add(PrepareImage()),
        wait: const Duration(milliseconds: 100),
        expect: () => [
          PrepareationIsAplyingWaterMark(),
          PrepareationIsHashing(),
          PreparationHasError("Something went wrong")
        ],
      );
    });
  });
}

void register(
    MockVideoSavingService videoSavingService,
    MockImageSavingService imageSavingService,
    MockImageHashingService imageHashingService,
    MockVideoHashingService videoHashingService,
    MockVideoWaterMarkService videoWaterMarkSerivce,
    MockImageWaterMarkService imageWaterMarkService,
    MockAudioMetaDataService audioMetaDataService,
    MockVideoMetaDataService videoMetaDataService,
    MockImageMetaDataService imageMetaDataService,
    MockAudioHashingService audioHashingService,
    MockLocationServiceWrapper locationService,
    MockMetaDataPermissionService metaDataPermissionService) {
  final GetIt getIt = GetIt.I;

  getIt.registerFactory<IFileSavingService>(() => videoSavingService,
      instanceName: "VideoSaving");
  getIt.registerFactory<IFileSavingService>(() => imageSavingService,
      instanceName: "ImageSaving");
  getIt.registerFactory<IHashingService>(() => imageHashingService,
      instanceName: "ImageHashing");
  getIt.registerFactory<IHashingService>(() => videoHashingService,
      instanceName: "VideoHashing");
  getIt.registerFactory<IWaterMarkService>(() => videoWaterMarkSerivce,
      instanceName: "VideoWaterMark");
  getIt.registerFactory<IWaterMarkService>(() => imageWaterMarkService,
      instanceName: "ImageWaterMark");
  getIt.registerFactory<IMetaDataService>(() => audioMetaDataService,
      instanceName: "AudioMetaData");
  getIt.registerFactory<IMetaDataService>(() => videoMetaDataService,
      instanceName: "VideoMetaData");
  getIt.registerFactory<IMetaDataService>(() => imageMetaDataService,
      instanceName: "ImageMetaData");
  getIt.registerFactory<IMetaDataPermissionService>(
      () => metaDataPermissionService);
  getIt.registerFactory<IHashingService>(() => audioHashingService,
      instanceName: "AudioHashing");
  getIt.registerFactory<ILocationService>(() => locationService);
}
