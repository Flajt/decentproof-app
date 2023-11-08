import 'package:decentproof/features/metadata/bloc/LocationWarningBloc.dart';
import 'package:decentproof/features/metadata/bloc/LocationWarningBlocEvents.dart';
import 'package:decentproof/features/metadata/interfaces/ILocationService.dart';
import 'package:decentproof/features/metadata/interfaces/IMetaDataPermissionService.dart';
import 'package:decentproof/features/metadata/uiblocks/EnableLocationWarning.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';

import '../../mocks.mocks.dart';

void main() {
  group("EnableLocationWarning", () {
    final GetIt getIt = GetIt.instance;
    final locationService = MockLocationService();
    final metaDataPermissionService = MockMetaDataPermissionService();
    setUp(() async => await getIt.reset());

    testWidgets("show location disable warning if disabled",
        (widgetTester) async {
      getIt.registerFactory<ILocationService>(() => locationService);
      getIt.registerFactory<IMetaDataPermissionService>(
          () => metaDataPermissionService);
      when(metaDataPermissionService.shouldEmbedLocation()).thenReturn(true);
      when(locationService.serviceEnabled())
          .thenAnswer((realInvocation) async => false);
      await widgetTester.pumpWidget(BlocProvider(
          create: (context) =>
              LocationWarningBloc()..add(CheckLocationService()),
          child: const MaterialApp(
              home: Scaffold(
                  body: EnableLocationWarning(width: 400, height: 200)))));
      await widgetTester.pumpAndSettle();
      expect(find.text("homePage.locationWarning"), findsOneWidget);
    });

    testWidgets("show container if location is enabled", (widgetTester) async {
      getIt.registerFactory<ILocationService>(() => locationService);
      getIt.registerFactory<IMetaDataPermissionService>(
          () => metaDataPermissionService);
      when(metaDataPermissionService.shouldEmbedLocation()).thenReturn(true);
      when(locationService.serviceEnabled())
          .thenAnswer((realInvocation) async => true);
      await widgetTester.pumpWidget(BlocProvider(
          create: (context) =>
              LocationWarningBloc()..add(CheckLocationService()),
          child: const MaterialApp(
              home: Scaffold(
                  body: EnableLocationWarning(width: 200, height: 200)))));
      await widgetTester.pumpAndSettle();

      expect(find.text("homePage.locationWarning"), findsNothing);
    });
  });
}
