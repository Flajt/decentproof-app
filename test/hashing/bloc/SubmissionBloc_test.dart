import 'package:basic_utils/basic_utils.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:decentproof/features/hashing/bloc/SubmissionBloc.dart';
import 'package:decentproof/features/hashing/bloc/SubmissionEvents.dart';
import 'package:decentproof/features/hashing/bloc/SubmissionState.dart';
import 'package:decentproof/features/hashing/interfaces/IHashSubmissionService.dart';
import 'package:decentproof/shared/HashLogic.dart';
import 'package:decentproof/shared/Integrety/interfaces/ISecureStorageService.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../../mocks.mocks.dart';

void main() {
  setUp(() async => await GetIt.I.reset());
  group("SubmissionBloc success", () {
    final GetIt getIt = GetIt.I;
    final MockSecureStorageWrapper mockSecureStorageService =
        MockSecureStorageWrapper();
    final MockHashSubmissionService mockHashSubmissionService =
        MockHashSubmissionService();
    blocTest(
      "Submit Hash without E-Mail",
      setUp: () {
        getIt.registerFactory<ISecureStorageService>(
            () => mockSecureStorageService);
        getIt.registerFactory<IHashSubmissionService>(
            () => mockHashSubmissionService);
        when(mockSecureStorageService.retriveEmail())
            .thenAnswer((realInvocation) => Future.value(null));
      },
      build: () => SubmissionBloc(),
      act: (bloc) => bloc.add(SubmitHash(StringUtils.generateRandomString(64))),
      expect: () => [SubmissionInProgress(), SubmissionSuccessfull()],
    );
    blocTest(
      "Submit Hash with E-Mail",
      setUp: () {
        getIt.registerFactory<ISecureStorageService>(
            () => mockSecureStorageService);
        getIt.registerFactory<IHashSubmissionService>(
            () => mockHashSubmissionService);
        when(mockSecureStorageService.retriveEmail())
            .thenAnswer((realInvocation) => Future.value("test@test.com"));
      },
      verify: (_) {
        verify(mockHashSubmissionService.submitHash(
                "3639efcd08abb273b1619e82e78c29a7df02c1051b1820e99fc395dcaa3326b8",
                "test@test.com"))
            .called(1);
      },
      build: () => SubmissionBloc(),
      act: (bloc) => bloc.add(SubmitHash(
          "3639efcd08abb273b1619e82e78c29a7df02c1051b1820e99fc395dcaa3326b8")),
      expect: () => [SubmissionInProgress(), SubmissionSuccessfull()],
    );
    blocTest(
      "Submit Hash (calculated) with E-Mail",
      setUp: () {
        getIt.registerFactory<ISecureStorageService>(
            () => mockSecureStorageService);
        getIt.registerFactory<IHashSubmissionService>(
            () => mockHashSubmissionService);
        when(mockSecureStorageService.retriveEmail())
            .thenAnswer((realInvocation) => Future.value(null));
      },
      build: () => SubmissionBloc(),
      act: (bloc) async {
        final bytes = Uint8List.fromList("hello".codeUnits);
        final hash = await HashLogic().hashBytes(bytes);
        bloc.add(SubmitHash(hash));
      },
      expect: () => [SubmissionInProgress(), SubmissionSuccessfull()],
    );

    blocTest(
      "Submit valid Hash with E-Mail",
      setUp: () {
        getIt.registerFactory<ISecureStorageService>(
            () => mockSecureStorageService);
        getIt.registerFactory<IHashSubmissionService>(
            () => mockHashSubmissionService);
        when(mockSecureStorageService.retriveEmail())
            .thenAnswer((realInvocation) => Future.value("test@test.com"));
      },
      verify: (_) {
        verify(mockHashSubmissionService.submitHash(
                "3639efcd08abb273b1619e82e78c29a7df02c1051b1820e99fc395dcaa3326b8",
                "test@test.com"))
            .called(1);
      },
      build: () => SubmissionBloc(),
      act: (bloc) => bloc.add(SubmitHash(
          "3639efcd08abb273b1619e82e78c29a7df02c1051b1820e99fc395dcaa3326b8")),
      expect: () => [SubmissionInProgress(), SubmissionSuccessfull()],
    );
  });
  group("SubmissionBloc error", () {
    final GetIt getIt = GetIt.I;
    final MockSecureStorageWrapper mockSecureStorageService =
        MockSecureStorageWrapper();
    final MockHashSubmissionService mockHashSubmissionService =
        MockHashSubmissionService();
    blocTest(
      "Submit empty Hash",
      setUp: () {
        getIt.registerFactory<ISecureStorageService>(
            () => mockSecureStorageService);
        getIt.registerFactory<IHashSubmissionService>(
            () => mockHashSubmissionService);
        when(mockSecureStorageService.retriveEmail())
            .thenAnswer((realInvocation) => Future.value(null));
      },
      build: () => SubmissionBloc(),
      act: (bloc) => bloc.add(SubmitHash("")),
      expect: () =>
          [SubmissionInProgress(), const SubmissionError("Hash is invalid")],
    );
    blocTest(
      "Submit to short Hash",
      setUp: () {
        getIt.registerFactory<ISecureStorageService>(
            () => mockSecureStorageService);
        getIt.registerFactory<IHashSubmissionService>(
            () => mockHashSubmissionService);
        when(mockSecureStorageService.retriveEmail())
            .thenAnswer((realInvocation) => Future.value(null));
      },
      build: () => SubmissionBloc(),
      act: (bloc) => bloc.add(SubmitHash(StringUtils.generateRandomString(63))),
      expect: () =>
          [SubmissionInProgress(), const SubmissionError("Hash is invalid")],
    );
    blocTest(
      "Submit to long Hash",
      setUp: () {
        getIt.registerFactory<ISecureStorageService>(
            () => mockSecureStorageService);
        getIt.registerFactory<IHashSubmissionService>(
            () => mockHashSubmissionService);
        when(mockSecureStorageService.retriveEmail())
            .thenAnswer((realInvocation) => Future.value(null));
      },
      build: () => SubmissionBloc(),
      act: (bloc) => bloc.add(SubmitHash(StringUtils.generateRandomString(65))),
      expect: () =>
          [SubmissionInProgress(), const SubmissionError("Hash is invalid")],
    );
    blocTest(
      "Catch error while submitting hash",
      setUp: () {
        getIt.registerFactory<ISecureStorageService>(
            () => mockSecureStorageService);
        getIt.registerFactory<IHashSubmissionService>(
            () => mockHashSubmissionService);
        when(mockSecureStorageService.retriveEmail()).thenThrow(
            "Something went wrong uwu"); // It's too late for this stuff....
      },
      build: () => SubmissionBloc(),
      act: (bloc) => bloc.add(SubmitHash(StringUtils.generateRandomString(64))),
      expect: () => [
        SubmissionInProgress(),
        const SubmissionError("Something went wrong uwu")
      ],
    );
  });
}
