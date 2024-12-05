import 'package:bloc_test/bloc_test.dart';
import 'package:decentproof/features/metadata/interfaces/ILocationService.dart';
import 'package:decentproof/features/metadata/interfaces/IMetaDataPermissionService.dart';
import 'package:decentproof/features/settings/bloc/SettingsBloc.dart';
import 'package:decentproof/features/settings/bloc/SettingsBlocEvents.dart';
import 'package:decentproof/features/settings/bloc/SettingsBlocStates.dart';
import 'package:decentproof/features/settings/interfaces/ISettingsStorageService.dart';
import 'package:decentproof/features/settings/logic/SettingsService.dart';
import 'package:decentproof/shared/Integrety/interfaces/ISecureStorageService.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';

import '../../mocks.mocks.dart';

/// Some of these tests are kinda "controversial" I guess, as they sometimes heavily mock the dependencies
void main() {
  final getIt = GetIt.I;
  final locationService = MockLocationServiceWrapper();
  final permissionService = MockMetaDataPermissionService();
  final secureStorageService = MockSecureStorageWrapper();
  final settingsStorageSerivce = MockSettingsStorageSerivce();
  setUp(
    () async {
      await getIt.reset();
      await settingsStorageSerivce.init();
    },
  );
  group("E-Mail", () {
    blocTest("input is invalid address",
        setUp: () {
          getIt.registerFactory<ISettingsStorageSerivce>(
              () => settingsStorageSerivce);
          getIt.registerFactory<IMetaDataPermissionService>(
              () => MockMetaDataPermissionService());
          getIt.registerFactory<ISecureStorageService>(
              () => MockSecureStorageWrapper());
          getIt.registerFactory<ILocationService>(
              () => MockLocationServiceWrapper());
        },
        act: (bloc) => bloc.add(SaveEmailEvent("invalid")),
        expect: () => [ErrorState("Invalid Email"), UpdatedSettingsState()],
        build: () => SettingsBloc());
    blocTest(
      "input is empty",
      setUp: () {
        getIt.registerFactory<ISettingsStorageSerivce>(
            () => settingsStorageSerivce);
        getIt
            .registerFactory<ISecureStorageService>(() => secureStorageService);
        getIt.registerFactory<ILocationService>(() => locationService);
        getIt.registerFactory<IMetaDataPermissionService>(
            () => permissionService);
      },
      act: (bloc) {
        bloc
          ..add(SettingsFetchInital())
          ..add(SaveEmailEvent(""));
      },
      build: () => SettingsBloc(),
      expect: () => [ErrorState("Invalid Email"), UpdatedSettingsState()],
    );
    blocTest<SettingsBloc, SettingsBlocStates>("is valid",
        build: () => SettingsBloc(),
        seed: () => UpdatedSettingsState(),
        setUp: () {
          getIt.registerFactory<ISettingsStorageSerivce>(
              () => settingsStorageSerivce);
          getIt.registerFactory<IMetaDataPermissionService>(
              () => MockMetaDataPermissionService());
          getIt.registerFactory<ISecureStorageService>(
              () => secureStorageService);
          getIt.registerFactory<ILocationService>(
              () => MockLocationServiceWrapper());
          when(secureStorageService.saveEmail(any))
              .thenAnswer((realInvocation) => Future.value());
        },
        act: (bloc) => bloc.add(SaveEmailEvent("test@test.com")),
        expect: () => [UpdatedSettingsState(hasEmail: true)]);
    blocTest("can be deleted",
        build: () => SettingsBloc(),
        setUp: () {
          getIt.registerFactory<ISettingsStorageSerivce>(
              () => settingsStorageSerivce);
          getIt.registerFactory<IMetaDataPermissionService>(
              () => MockMetaDataPermissionService());
          getIt.registerFactory<ISecureStorageService>(
              () => secureStorageService);
          getIt.registerFactory<ILocationService>(
              () => MockLocationServiceWrapper());
          when(secureStorageService.saveEmail(any))
              .thenAnswer((realInvocation) => Future.value());
        },
        act: (bloc) => bloc
          ..add(SettingsFetchInital())
          ..add(DeleteEmail()),
        wait: const Duration(seconds: 3, milliseconds: 500),
        expect: () => [UpdatedSettingsState(hasEmail: false)]);
  });
  group("Location embedding", () {
    blocTest("enabled successfully",
        setUp: () {
          getIt.registerFactory<ISettingsStorageSerivce>(
              () => settingsStorageSerivce);
          getIt.registerFactory<IMetaDataPermissionService>(
              () => permissionService);
          getIt.registerFactory<ISecureStorageService>(
              () => secureStorageService);
          getIt.registerFactory<ILocationService>(() => locationService);
          when(permissionService.allowLocationEmbedding(any))
              .thenAnswer((realInvocation) => Future.value());
          when(locationService.hasPermission())
              .thenAnswer((realInvocation) => Future.value(true));
        },
        act: (bloc) => bloc
          ..add(SettingsFetchInital())
          ..add(ModifyLocationEmbeddingPermission(true)),
        expect: () => [
              const UpdatedSettingsState(),
              const UpdatedSettingsState(locationEmbeddingPermission: true)
            ],
        wait: const Duration(milliseconds: 100),
        build: () => SettingsBloc());
    blocTest("failed, location permission denied",
        setUp: () {
          getIt.registerFactory<ISettingsStorageSerivce>(
              () => settingsStorageSerivce);
          getIt.registerFactory<IMetaDataPermissionService>(
              () => permissionService);
          getIt.registerFactory<ISecureStorageService>(
              () => secureStorageService);
          getIt.registerFactory<ILocationService>(() => locationService);
          when(permissionService.allowLocationEmbedding(any))
              .thenAnswer((realInvocation) => Future.value());
          when(locationService.hasPermission())
              .thenAnswer((realInvocation) => Future.value(false));
        },
        act: (bloc) => bloc.add(ModifyLocationEmbeddingPermission(true)),
        expect: () =>
            [ErrorState("Location Permission Denied!"), UpdatedSettingsState()],
        build: () => SettingsBloc());

    blocTest("successfull handle error",
        setUp: () {
          getIt.registerFactory<ISettingsStorageSerivce>(
              () => settingsStorageSerivce);
          getIt.registerFactory<IMetaDataPermissionService>(
              () => permissionService);
          getIt.registerFactory<ISecureStorageService>(
              () => secureStorageService);
          getIt.registerFactory<ILocationService>(() => locationService);
          when(permissionService.allowLocationEmbedding(any))
              .thenAnswer((realInvocation) => Future.value());
          when(locationService.hasPermission()).thenThrow("Error");
        },
        act: (bloc) => bloc.add(ModifyLocationEmbeddingPermission(true)),
        expect: () => [ErrorState("Error"), UpdatedSettingsState()],
        build: () => SettingsBloc());

    blocTest("successfull, location permission granted",
        setUp: () {
          getIt.registerFactory<ISettingsStorageSerivce>(
              () => settingsStorageSerivce);
          getIt.registerFactory<IMetaDataPermissionService>(
              () => permissionService);
          getIt.registerFactory<ISecureStorageService>(
              () => secureStorageService);
          getIt.registerFactory<ILocationService>(() => locationService);
          when(permissionService.allowLocationEmbedding(any))
              .thenAnswer((realInvocation) => Future.value());
          when(locationService.getPermission())
              .thenAnswer((realInvocation) => Future.value(true));
          when(locationService.hasPermission())
              .thenAnswer((realInvocation) => Future.value(false));
        },
        act: (bloc) {
          bloc.add(SettingsFetchInital());
          bloc.add(ModifyLocationEmbeddingPermission(true));
        },
        expect: () => const [
              UpdatedSettingsState(),
              UpdatedSettingsState(locationEmbeddingPermission: true)
            ],
        build: () => SettingsBloc());
    blocTest("disable successfully",
        setUp: () {
          getIt.registerFactory<ISettingsStorageSerivce>(
              () => settingsStorageSerivce);
          getIt.registerFactory<IMetaDataPermissionService>(
              () => permissionService);
          getIt.registerFactory<ISecureStorageService>(
              () => secureStorageService);
          getIt.registerFactory<ILocationService>(() => locationService);
          when(permissionService.allowLocationEmbedding(any))
              .thenAnswer((realInvocation) => Future.value());
        },
        act: (bloc) => bloc
          ..add(SettingsFetchInital())
          ..add(ModifyLocationEmbeddingPermission(false)),
        expect: () =>
            const [UpdatedSettingsState(locationEmbeddingPermission: false)],
        build: () => SettingsBloc());
  });
}
