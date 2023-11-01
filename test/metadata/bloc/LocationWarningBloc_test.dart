import 'package:bloc_test/bloc_test.dart';
import 'package:decentproof/features/metadata/bloc/LocationWarningBloc.dart';
import 'package:decentproof/features/metadata/bloc/LocationWarningBlocEvents.dart';
import 'package:decentproof/features/metadata/bloc/LocationWarningBlocStates.dart';
import 'package:decentproof/features/metadata/interfaces/ILocationService.dart';
import 'package:decentproof/features/metadata/interfaces/IMetaDataPermissionService.dart';
import 'package:decentproof/features/metadata/logic/LocationService.dart';
import 'package:decentproof/features/metadata/logic/MetaDataPermissionService.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks(
    [MockSpec<LocationService>(), MockSpec<MetaDataPermissionService>()])
import "LocationWarningBloc_test.mocks.dart";

void main() {
  final GetIt getIt = GetIt.I;
  setUp(() async {
    await getIt.reset();
  });
  group("no error", () {
    blocTest(
      "returns [LocationServiceEnabled] if location service is enabled",
      setUp: () {
        final permissionService = MockMetaDataPermissionService();
        final locationService = MockLocationService();

        when(permissionService.shouldEmbedLocation()).thenReturn(true);
        when(locationService.serviceEnabled())
            .thenAnswer((_) => Future.value(true));
        when(locationService.hasPermission())
            .thenAnswer((_) => Future.value(true));

        getIt.registerFactory<IMetaDataPermissionService>(
            () => permissionService);
        getIt.registerFactory<ILocationService>(() => locationService);
      },
      act: (bloc) => bloc.add(CheckLocationService()),
      build: () => LocationWarningBloc(),
      expect: () => [LocationServiceEnabled()],
    );
    blocTest(
        "Returns LocationServiceEnabled if location service is disabled but no permission required",
        setUp: () {
          final mockPermissionService = MockMetaDataPermissionService();

          when(mockPermissionService.shouldEmbedLocation()).thenReturn(false);

          getIt.registerSingleton<IMetaDataPermissionService>(
              mockPermissionService);
          getIt.registerFactory<ILocationService>(() => MockLocationService());
        },
        build: () => LocationWarningBloc(),
        act: (bloc) {
          bloc.add(CheckLocationService());
        },
        expect: () {
          return [LocationServiceEnabled()];
        });
  });
  group("With error", () {
    blocTest("in shouldEmbeddLocation",
        setUp: () {
          final permissionService = MockMetaDataPermissionService();

          when(permissionService.shouldEmbedLocation())
              .thenThrow("Something went wrong");

          getIt.registerFactory<ILocationService>(() => MockLocationService());
          getIt.registerFactory<IMetaDataPermissionService>(
              () => permissionService);
        },
        act: (bloc) => bloc.add(CheckLocationService()),
        expect: () => [LocationServiceHasError("Something went wrong")],
        build: () => LocationWarningBloc());
  });
  blocTest("in serviceEnabled",
      setUp: () {
        final locationService = MockLocationService();
        final permissionService = MockMetaDataPermissionService();

        when(permissionService.shouldEmbedLocation()).thenReturn(true);
        when(locationService.serviceEnabled())
            .thenThrow("Location service failed");

        getIt.registerFactory<ILocationService>(() => locationService);
        getIt.registerFactory<IMetaDataPermissionService>(
            () => permissionService);
      },
      act: (bloc) => bloc.add(CheckLocationService()),
      expect: () => [LocationServiceHasError("Location service failed")],
      build: () => LocationWarningBloc());
}
