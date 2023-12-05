import 'package:bloc_test/bloc_test.dart';
import 'package:decentproof/features/metadata/interfaces/IMetaDataService.dart';
import 'package:decentproof/features/metadata/models/MetaDataModel.dart';
import 'package:decentproof/features/verification/bloc/VerificationBloc.dart';
import 'package:decentproof/features/verification/bloc/VerificationBlocEvents.dart';
import 'package:decentproof/features/verification/bloc/VerificationBlocStates.dart';
import 'package:decentproof/features/verification/interfaces/IFileSelectionService.dart';
import 'package:decentproof/features/verification/interfaces/IVerificationService.dart';
import 'package:decentproof/features/verification/models/FileDataMode.dart';
import 'package:decentproof/features/verification/models/VerificationStatusModel.dart';
import 'package:decentproof/shared/interface/IHashLogic.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';
import '../../mocks.dart';
import '../../mocks.mocks.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  group("VerificationBloc", () {
    final GetIt getIt = GetIt.I;
    final verificationService = MockVerificationService();
    final fileSelectionService = MockFilePickerWrapper();
    final imageMetaDataService = MockImageMetaDataService();
    final audioMetaDataService = MockAudioMetaDataService();
    final videoMetaDataService = MockVideoMetaDataService();
    final hashLogic = MockHashLogic();
    final statusModel = VerificationStatusModel(
        true, true, DateTime.now(), 0, "test", const MetaDataModel(null, null));

    setUp(() async {
      await GetIt.I.reset();
      PathProviderPlatform.instance = FakePathProviderPlatform();
    });

    blocTest("empty file model should trigger reset",
        setUp: () {
          register(
              getIt,
              verificationService,
              fileSelectionService,
              imageMetaDataService,
              audioMetaDataService,
              videoMetaDataService,
              hashLogic);
          when(fileSelectionService.selectFileAsStream())
              .thenAnswer((_) => Future.value(null));
        },
        build: () => VerificationBloc(),
        act: (bloc) => bloc.add(VerifyHashEvent()),
        expect: () => [LoadingState(), InitialState()]);

    blocTest("successfully return VerificationStatusModel for an image",
        setUp: () {
          register(
              getIt,
              verificationService,
              fileSelectionService,
              imageMetaDataService,
              audioMetaDataService,
              videoMetaDataService,
              hashLogic);
          when(fileSelectionService.selectFileAsStream()).thenAnswer((_) =>
              Future.value(FileDataModel(
                  fileName: "test.png", byteStream: const Stream.empty())));
          when(hashLogic.hashBytesInChunksFromStream(any))
              .thenAnswer((_) => Future.value("test"));
          when(imageMetaDataService.retriveMetaData(any))
              .thenAnswer((_) => Future.value(const MetaDataModel(null, null)));
          when(verificationService.verify(any))
              .thenAnswer((_) => Future.value(statusModel));
        },
        build: () => VerificationBloc(),
        act: (bloc) => bloc.add(VerifyHashEvent()),
        wait: const Duration(milliseconds: 50),
        expect: () => [LoadingState(), VerifiedState(statusModel)]);

    blocTest("successfully return VerificationStatusModel for a video",
        setUp: () {
          register(
              getIt,
              verificationService,
              fileSelectionService,
              imageMetaDataService,
              audioMetaDataService,
              videoMetaDataService,
              hashLogic);
          when(fileSelectionService.selectFileAsStream()).thenAnswer((_) =>
              Future.value(FileDataModel(
                  fileName: "test.mkv", byteStream: const Stream.empty())));
          when(hashLogic.hashBytesInChunksFromStream(any))
              .thenAnswer((_) => Future.value("test"));
          when(videoMetaDataService.retriveMetaData(any))
              .thenAnswer((_) => Future.value(const MetaDataModel(null, null)));
          when(verificationService.verify(any))
              .thenAnswer((_) => Future.value(statusModel));
        },
        build: () => VerificationBloc(),
        act: (bloc) => bloc.add(VerifyHashEvent()),
        wait: const Duration(milliseconds: 50),
        expect: () => [LoadingState(), VerifiedState(statusModel)]);

    blocTest(
        "successfully return VerificationStatusModel for an audio file (aac)",
        setUp: () {
          register(
              getIt,
              verificationService,
              fileSelectionService,
              imageMetaDataService,
              audioMetaDataService,
              videoMetaDataService,
              hashLogic);
          when(fileSelectionService.selectFileAsStream()).thenAnswer((_) =>
              Future.value(FileDataModel(
                  fileName: "test.aac", byteStream: const Stream.empty())));
          when(hashLogic.hashBytesInChunksFromStream(any))
              .thenAnswer((_) => Future.value("test"));
          when(audioMetaDataService.retriveMetaData(any))
              .thenAnswer((_) => Future.value(const MetaDataModel(null, null)));
          when(verificationService.verify(any))
              .thenAnswer((_) => Future.value(statusModel));
        },
        build: () => VerificationBloc(),
        act: (bloc) => bloc.add(VerifyHashEvent()),
        wait: const Duration(milliseconds: 25),
        expect: () => [LoadingState(), VerifiedState(statusModel)]);
    blocTest(
        "successfully return VerificationStatusModel for an audio file (mp3)",
        setUp: () {
          register(
              getIt,
              verificationService,
              fileSelectionService,
              imageMetaDataService,
              audioMetaDataService,
              videoMetaDataService,
              hashLogic);
          when(fileSelectionService.selectFileAsStream()).thenAnswer((_) =>
              Future.value(FileDataModel(
                  fileName: "test.mp3", byteStream: const Stream.empty())));
          when(hashLogic.hashBytesInChunksFromStream(any))
              .thenAnswer((_) => Future.value("test"));
          when(audioMetaDataService.retriveMetaData(any))
              .thenAnswer((_) => Future.value(const MetaDataModel(null, null)));
          when(verificationService.verify(any))
              .thenAnswer((_) => Future.value(statusModel));
        },
        build: () => VerificationBloc(),
        act: (bloc) => bloc.add(VerifyHashEvent()),
        wait: const Duration(milliseconds: 25),
        expect: () => [LoadingState(), VerifiedState(statusModel)]);
    blocTest("fail for invalid fileType (e.g. jpg)",
        setUp: () {
          register(
              getIt,
              verificationService,
              fileSelectionService,
              imageMetaDataService,
              audioMetaDataService,
              videoMetaDataService,
              hashLogic);
          when(fileSelectionService.selectFileAsStream()).thenAnswer((_) =>
              Future.value(FileDataModel(
                  fileName: "test.jpg", byteStream: const Stream.empty())));
          when(hashLogic.hashBytesInChunksFromStream(any))
              .thenAnswer((_) => Future.value("test"));
          when(audioMetaDataService.retriveMetaData(any))
              .thenAnswer((_) => Future.value(const MetaDataModel(null, null)));
          when(verificationService.verify(any))
              .thenAnswer((_) => Future.value(statusModel));
        },
        build: () => VerificationBloc(),
        act: (bloc) => bloc.add(VerifyHashEvent()),
        wait: const Duration(milliseconds: 50),
        expect: () => [
              LoadingState(),
              ErrorState("type 'Null' is not a subtype of type 'FileType'"),
              InitialState()
            ]);

    blocTest("successfully capture and return error & reset",
        setUp: () {
          register(
              getIt,
              verificationService,
              fileSelectionService,
              imageMetaDataService,
              audioMetaDataService,
              videoMetaDataService,
              hashLogic);
          when(fileSelectionService.selectFileAsStream()).thenThrow("Error");
        },
        build: () => VerificationBloc(),
        wait: const Duration(milliseconds: 50),
        act: (bloc) => bloc.add(VerifyHashEvent()),
        expect: () => [LoadingState(), ErrorState("Error"), InitialState()]);
  });
}

void register(
    GetIt getIt,
    MockVerificationService verificationService,
    MockFilePickerWrapper fileSelectionService,
    MockImageMetaDataService imageMetaDataService,
    MockAudioMetaDataService audioMetaDataService,
    MockVideoMetaDataService videoMetaDataService,
    MockHashLogic hashLogic) {
  getIt.registerFactory<IVerificationService>(() => verificationService);
  getIt.registerFactory<IFileSelectionService>(() => fileSelectionService);
  getIt.registerFactory<IMetaDataService>(() => imageMetaDataService,
      instanceName: "ImageMetaData");
  getIt.registerFactory<IMetaDataService>(() => audioMetaDataService,
      instanceName: "AudioMetaData");
  getIt.registerFactory<IMetaDataService>(() => videoMetaDataService,
      instanceName: "VideoMetaData");
  getIt.registerFactory<IHashLogic>(() => MockHashLogic());
}
