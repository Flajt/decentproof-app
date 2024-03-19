import 'dart:isolate';
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
import 'package:decentproof/shared/foregroundService/IForegroundService.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../../mocks.mocks.dart';

/// The whole suit is kinda a mess. Since it's hard to get a good stream of events, the worst thing is that I've got to simulate the stream of events.
/// Idealy this wouldn't be the case and we could just hook into a real stream, and do the testing that way. Any ideas are appreciated.
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
    final foregroundServiceWrapper = MockForegroundServiceWrapper();
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
                metaDataPermissionService,
                foregroundServiceWrapper);
            final testPort = ReceivePort.fromRawReceivePort(RawReceivePort());
            final sendPort = testPort.sendPort;
            when(foregroundServiceWrapper.getReceivePort())
                .thenAnswer((_) => Future.value(testPort));
            when(metaDataPermissionService.shouldEmbedLocation())
                .thenReturn(true);
            when(locationService.requestLocation()).thenAnswer(
                (realInvocation) => Future.value(sampleLocationModel));
            when(locationService.serviceEnabled())
                .thenAnswer((realInvocation) => Future.value(true));
            sendPort.send({"status": "AddingMetaData"});
            when(audioMetaDataService.addLocation(
                    sampleLocationModel, "sample/path/to/file.aac"))
                .thenAnswer((realInvocation) =>
                    Future.value("sample/path/to/file.mp3"));
            sendPort.send({"status": "Hashing", "progess": 0});
            when(audioHashingService.hash("sample/path/to/file.mp3"))
                .thenAnswer((realInvocation) => Future.value("cool-hash"));
            sendPort.send({
              "status": "Done",
              "content": "cool-hash",
              "filePath": "sample/path/to/file.mp3"
            });
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
                metaDataPermissionService,
                foregroundServiceWrapper);
            final testPort = ReceivePort.fromRawReceivePort(RawReceivePort());
            final sendPort = testPort.sendPort;
            when(foregroundServiceWrapper.getReceivePort())
                .thenAnswer((_) => Future.value(testPort));
            when(metaDataPermissionService.shouldEmbedLocation())
                .thenReturn(false);
            sendPort.send({"status": "Hashing", "progress": 0});
            when(audioHashingService.hash(any))
                .thenAnswer((realInvocation) => Future.value("cool-hash"));
            sendPort.send({
              "status": "Done",
              "filePath": "sample/path/to/file.aac",
              "content": "cool-hash"
            });
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
              metaDataPermissionService,
              foregroundServiceWrapper);
          final testPort = ReceivePort.fromRawReceivePort(RawReceivePort());
          final sendPort = testPort.sendPort;
          when(foregroundServiceWrapper.getReceivePort())
              .thenAnswer((_) => Future.value(testPort));
          when(metaDataPermissionService.shouldEmbedLocation())
              .thenReturn(false);
          sendPort.send({"status": "Hashing", "progress": 0});
          when(audioHashingService.hash(any)).thenThrow("Something went wrong");
          sendPort.send({
            "status": "Fail",
            "description": "Something went wrong",
            "stack": ""
          });
        },
        build: () => PreparationBloc(),
        act: (bloc) => bloc.add(PrepareAudio("sample/path/to/file.aac")),
        wait: const Duration(milliseconds: 100),
        expect: () => [
          PrepareationIsHashing(),
          PreparationHasError("Something went wrong")
        ],
      );
      blocTest(
          "w. error attempting to embed location without it beeing enabled",
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
                metaDataPermissionService,
                foregroundServiceWrapper);
            final testPort = ReceivePort.fromRawReceivePort(RawReceivePort());
            final sendPort = testPort.sendPort;
            when(foregroundServiceWrapper.getReceivePort())
                .thenAnswer((_) => Future.value(testPort));
            sendPort.send({"status": "AddingMetaData"});
            when(metaDataPermissionService.shouldEmbedLocation())
                .thenReturn(true);
            when(locationService.serviceEnabled())
                .thenAnswer((realInvocation) => Future.value(false));
            sendPort.send({
              "status": "Error",
              "description": "Location Service is not enabled!"
            });
          },
          build: () => PreparationBloc(),
          act: (bloc) => bloc.add(PrepareAudio("sample/path/to/file.aac")),
          wait: const Duration(milliseconds: 100),
          expect: () => [
                PrepareationIsAddingMetaData(),
                PreparationHasError("Location Service is not enabled!")
              ]);
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
                metaDataPermissionService,
                foregroundServiceWrapper);
            final testPort = ReceivePort.fromRawReceivePort(RawReceivePort());
            final sendPort = testPort.sendPort;
            when(foregroundServiceWrapper.getReceivePort())
                .thenAnswer((_) => Future.value(testPort));
            when(videoSavingService.saveFile())
                .thenAnswer((_) => Future.value("some/path/to/video.mp4"));
            sendPort.send({"status": "AddingWaterMark"});
            when(videoWaterMarkSerivce.addWaterMark(any))
                .thenAnswer((_) => Future.value("sample/path/to/video.mkv"));
            when(metaDataPermissionService.shouldEmbedLocation())
                .thenReturn(true);
            sendPort.send({"status": "AddingMetaData"});
            when(locationService.serviceEnabled())
                .thenAnswer((_) => Future.value(true));
            when(locationService.requestLocation()).thenAnswer(
                (realInvocation) => Future.value(sampleLocationModel));
            when(videoMetaDataService.addLocation(sampleLocationModel, any))
                .thenAnswer((_) => Future.value("sample/path/to/video.mkv"));
            sendPort.send({"status": "Hashing", "progress": 0});
            when(videoHashingService.hash(any))
                .thenAnswer((realInvocation) => Future.value("cool-hash"));
            sendPort.send({
              "status": "Done",
              "content": "cool-hash",
              "filePath": "sample/path/to/video.mkv"
            });
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
                metaDataPermissionService,
                foregroundServiceWrapper);
            final testPort = ReceivePort.fromRawReceivePort(RawReceivePort());
            final sendPort = testPort.sendPort;
            when(foregroundServiceWrapper.getReceivePort())
                .thenAnswer((_) => Future.value(testPort));
            when(videoSavingService.saveFile())
                .thenAnswer((_) => Future.value("sample/path/to/video.mp4"));
            sendPort.send({"status": "AddingWaterMark"});
            when(metaDataPermissionService.shouldEmbedLocation())
                .thenReturn(false);
            when(videoWaterMarkSerivce.addWaterMark(any))
                .thenAnswer((_) => Future.value("sample/path/to/video.mkv"));
            sendPort.send({"status": "Hashing", "progress": 0});
            when(videoHashingService.hash(any))
                .thenAnswer((realInvocation) => Future.value("cool-hash"));
            sendPort.send({
              "status": "Done",
              "content": "cool-hash",
              "filePath": "sample/path/to/video.mkv"
            });
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
              metaDataPermissionService,
              foregroundServiceWrapper);
          final testPort = ReceivePort.fromRawReceivePort(RawReceivePort());
          final sendPort = testPort.sendPort;
          when(foregroundServiceWrapper.getReceivePort())
              .thenAnswer((_) => Future.value(testPort));
          when(videoSavingService.saveFile())
              .thenAnswer((_) => Future.value("sample/path/to/video.mp4"));
          when(metaDataPermissionService.shouldEmbedLocation())
              .thenReturn(false);
          sendPort.send({"status": "AddingWaterMark"});
          when(videoWaterMarkSerivce.addWaterMark(any))
              .thenAnswer((_) => Future.value("sample/path/to/video.mkv"));
          sendPort.send({"status": "Hashing", "progress": 0});
          when(videoHashingService.hash(any)).thenThrow("Something went wrong");
          sendPort.send({
            "status": "Fail",
            "description": "Something went wrong",
            "stack": ""
          });
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
      blocTest(
          "w. error attempting to embed location without it beeing enabled",
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
                metaDataPermissionService,
                foregroundServiceWrapper);
            final testPort = ReceivePort.fromRawReceivePort(RawReceivePort());
            final sendPort = testPort.sendPort;
            when(foregroundServiceWrapper.getReceivePort())
                .thenAnswer((_) => Future.value(testPort));
            sendPort.send({
              "status": "AddingWaterMark"
            }); // Since stuff is returned from a stream it is in the currect order
            sendPort.send({"status": "AddingMetaData"});
            sendPort.send({
              "status": "Error",
              "description": "Location Service is not enabled!"
            });
            when(metaDataPermissionService.shouldEmbedLocation())
                .thenReturn(true);
            when(locationService.serviceEnabled())
                .thenAnswer((realInvocation) => Future.value(false));
          },
          build: () => PreparationBloc(),
          act: (bloc) => bloc.add(PrepareVideo()),
          wait: const Duration(milliseconds: 100),
          expect: () => [
                PrepareationIsAplyingWaterMark(),
                PrepareationIsAddingMetaData(),
                PreparationHasError("Location Service is not enabled!")
              ]);
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
                metaDataPermissionService,
                foregroundServiceWrapper);
            final testPort = ReceivePort.fromRawReceivePort(RawReceivePort());
            final sendPort = testPort.sendPort;
            when(foregroundServiceWrapper.getReceivePort())
                .thenAnswer((_) => Future.value(testPort));
            sendPort.send({
              "status": "AddingWaterMark"
            }); // Since stuff is returned from a stream it is in the currect order
            sendPort.send({"status": "AddingMetaData"});
            sendPort.send({"status": "Hashing", "progress": 0});
            sendPort.send({
              "status": "Done",
              "content": "cool-hash",
              "filePath": "sample/path/to/image.png"
            });
            when(imageSavingService.saveFile())
                .thenAnswer((_) => Future.value("some/path/to/image.png"));
            when(imageWaterMarkService.addWaterMark(any))
                .thenAnswer((_) => Future.value("sample/path/to/image.png"));
            when(metaDataPermissionService.shouldEmbedLocation())
                .thenReturn(true);
            when(locationService.requestLocation())
                .thenAnswer((_) => Future.value(sampleLocationModel));
            when(locationService.serviceEnabled())
                .thenAnswer((realInvocation) => Future.value(true));
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
                metaDataPermissionService,
                foregroundServiceWrapper);
            final testPort = ReceivePort.fromRawReceivePort(RawReceivePort());
            final sendPort = testPort.sendPort;
            when(foregroundServiceWrapper.getReceivePort())
                .thenAnswer((_) => Future.value(testPort));
            sendPort.send({
              "status": "AddingWaterMark"
            }); // Since stuff is returned from a stream it is in the currect order
            sendPort.send({"status": "Hashing", "progress": 0});
            sendPort.send({
              "status": "Done",
              "content": "cool-hash",
              "filePath": "sample/path/to/image.png"
            });

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
              metaDataPermissionService,
              foregroundServiceWrapper);
          final testPort = ReceivePort.fromRawReceivePort(RawReceivePort());
          final sendPort = testPort.sendPort;
          when(foregroundServiceWrapper.getReceivePort())
              .thenAnswer((_) => Future.value(testPort));
          sendPort.send({
            "status": "AddingWaterMark"
          }); // Since stuff is returned from a stream it is in the currect order
          sendPort.send({"status": "Hashing", "progress": 0});
          sendPort.send({
            "status": "Fail",
            "description": "Something went wrong",
            "stack": ""
          });

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
      blocTest(
          "w. error attempting to embed location without it beeing enabled",
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
                metaDataPermissionService,
                foregroundServiceWrapper);
            final testPort = ReceivePort.fromRawReceivePort(RawReceivePort());
            final sendPort = testPort.sendPort;
            when(foregroundServiceWrapper.getReceivePort())
                .thenAnswer((_) => Future.value(testPort));
            sendPort.send({
              "status": "AddingWaterMark"
            }); // Since stuff is returned from a stream it is in the currect order
            sendPort.send({"status": "AddingMetaData"});
            sendPort.send({
              "status": "Error",
              "description": "Location Service is not enabled!",
            });

            when(metaDataPermissionService.shouldEmbedLocation())
                .thenReturn(true);
            when(locationService.serviceEnabled())
                .thenAnswer((realInvocation) => Future.value(false));
            when(imageHashingService.hash(any))
                .thenAnswer((realInvocation) => Future.value("cool-hash"));
          },
          build: () => PreparationBloc(),
          act: (bloc) => bloc.add(PrepareImage()),
          wait: const Duration(milliseconds: 100),
          expect: () => [
                PrepareationIsAplyingWaterMark(),
                PrepareationIsAddingMetaData(),
                PreparationHasError("Location Service is not enabled!")
              ]);
      blocTest("w. error due to mock location",
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
                metaDataPermissionService,
                foregroundServiceWrapper);
            final testPort = ReceivePort.fromRawReceivePort(RawReceivePort());
            final sendPort = testPort.sendPort;
            when(foregroundServiceWrapper.getReceivePort())
                .thenAnswer((_) => Future.value(testPort));
            sendPort.send({
              "status": "AddingWaterMark"
            }); // Since stuff is returned from a stream it is in the currect order
            sendPort.send({"status": "AddingMetaData"});
            sendPort.send({"status": "Hashing", "progress": 0});
            sendPort.send({
              "status": "Fail",
              "description":
                  "Invalid Location: It seems like you are using a mock location service. Please disable it and try again.",
            });
            when(imageSavingService.saveFile())
                .thenAnswer((_) => Future.value("some/path/to/image.png"));
            when(imageWaterMarkService.addWaterMark(any))
                .thenAnswer((_) => Future.value("sample/path/to/image.png"));
            when(metaDataPermissionService.shouldEmbedLocation())
                .thenReturn(true);
            when(locationService.requestLocation()).thenThrow((_) =>
                "Invalid Location: It seems like you are using a mock location service. Please disable it and try again.");
            when(locationService.serviceEnabled())
                .thenAnswer((realInvocation) => Future.value(true));
          },
          act: (bloc) => bloc.add(PrepareImage()),
          build: () => PreparationBloc(),
          wait: const Duration(milliseconds: 100),
          expect: () => [
                PrepareationIsAplyingWaterMark(),
                PrepareationIsAddingMetaData(),
                PrepareationIsHashing(),
                PreparationHasError(
                    "Invalid Location: It seems like you are using a mock location service. Please disable it and try again.")
              ]);
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
    MockMetaDataPermissionService metaDataPermissionService,
    MockForegroundServiceWrapper foregroundServiceWrapper) {
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
  getIt.registerSingleton<IForegroundService>(foregroundServiceWrapper);
}
