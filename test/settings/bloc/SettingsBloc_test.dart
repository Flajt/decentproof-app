import 'package:bloc_test/bloc_test.dart';
import 'package:decentproof/features/metadata/interfaces/ILocationService.dart';
import 'package:decentproof/features/metadata/interfaces/IMetaDataPermissionService.dart';
import 'package:decentproof/features/settings/bloc/SettingsBloc.dart';
import 'package:decentproof/features/settings/bloc/SettingsBlocEvents.dart';
import 'package:decentproof/features/settings/bloc/SettingsBlocStates.dart';
import 'package:decentproof/shared/Integrety/interfaces/ISecureStorageService.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';

import '../../mocks.mocks.dart';

void main() {
  final getIt = GetIt.I;
  final locationService = MockLocationService();
  final permissionService = MockMetaDataPermissionService();
  final secureStorageService = MockSecureStorageService();
  setUp(() async => {
        await getIt.reset(),
      });
  group("save E-Mail", () {
    blocTest("invalid address",
        setUp: () {
          getIt.registerFactory<IMetaDataPermissionService>(
              () => MockMetaDataPermissionService());
          getIt.registerFactory<ISecureStorageService>(
              () => MockSecureStorageService());
          getIt.registerFactory<ILocationService>(() => MockLocationService());
        },
        act: (bloc) => bloc.add(SaveEmailEvent("invalid")),
        expect: () => [ErrorState("Invalid Email")],
        build: () => SettingsBloc());
    blocTest(
      "empty input",
      setUp: () {
        getIt
            .registerFactory<ISecureStorageService>(() => secureStorageService);
        getIt.registerFactory<ILocationService>(() => locationService);
        getIt.registerFactory<IMetaDataPermissionService>(
            () => permissionService);
      },
      act: (bloc) => bloc.add(SaveEmailEvent("")),
      build: () => SettingsBloc(),
      expect: () => [ErrorState("Invalid Email")],
    );
    blocTest("valid email",
        build: () => SettingsBloc(),
        setUp: () {
          getIt.registerFactory<IMetaDataPermissionService>(
              () => MockMetaDataPermissionService());
          getIt.registerFactory<ISecureStorageService>(
              () => secureStorageService);
          getIt.registerFactory<ILocationService>(() => MockLocationService());
          when(secureStorageService.saveEmail(any))
              .thenAnswer((realInvocation) => Future.value());
        },
        act: (bloc) => bloc.add(SaveEmailEvent("test@test.com")),
        expect: () => [EmailSavedState("test@test.com")]);
  });
  group("location embedding", () {
    blocTest("enable successfully",
        setUp: () {
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
        act: (bloc) => bloc.add(ModifyLocationEmbeddingPermission(true)),
        expect: () => [LocationEmbeddingPermissionModified()],
        build: () => SettingsBloc());
    blocTest("fail, location permission denied",
        setUp: () {
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
        expect: () => [ErrorState("Location Permission Denied!")],
        build: () => SettingsBloc());

    blocTest("success, location permission granted",
        setUp: () {
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
        act: (bloc) => bloc.add(ModifyLocationEmbeddingPermission(true)),
        expect: () => [LocationEmbeddingPermissionModified()],
        build: () => SettingsBloc());
    blocTest("disable successfully",
        setUp: () {
          getIt.registerFactory<IMetaDataPermissionService>(
              () => permissionService);
          getIt.registerFactory<ISecureStorageService>(
              () => secureStorageService);
          getIt.registerFactory<ILocationService>(() => locationService);
          when(permissionService.allowLocationEmbedding(any))
              .thenAnswer((realInvocation) => Future.value());
        },
        act: (bloc) => bloc.add(ModifyLocationEmbeddingPermission(false)),
        expect: () => [LocationEmbeddingPermissionModified()],
        build: () => SettingsBloc());
  });
}
