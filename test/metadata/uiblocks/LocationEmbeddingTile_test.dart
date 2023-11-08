import 'package:decentproof/features/metadata/interfaces/ILocationService.dart';
import 'package:decentproof/features/metadata/interfaces/IMetaDataPermissionService.dart';
import 'package:decentproof/features/metadata/uiblocks/LocationEmbeddingTile.dart';
import 'package:decentproof/features/settings/bloc/SettingsBloc.dart';
import 'package:decentproof/shared/Integrety/interfaces/ISecureStorageService.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';

import '../../mocks.mocks.dart';

void main() {
  final getIt = GetIt.I;

  setUp(() async => await GetIt.I.reset());
  final permissionService = MockMetaDataPermissionService();
  final locationService = MockLocationService();
  final storageService = MockSecureStorageService();
  group("LocationEmbeddingTile", () {
    testWidgets("should change icon & state on tap", (widgetTester) async {
      getIt
          .registerFactory<IMetaDataPermissionService>(() => permissionService);
      getIt.registerFactory<ILocationService>(() => locationService);
      getIt.registerFactory<ISecureStorageService>(() => storageService);
      when(permissionService.shouldEmbedLocation())
          .thenReturnInOrder([false, true]);
      when(locationService.hasPermission())
          .thenAnswer((realInvocation) async => true);
      await widgetTester.pumpWidget(BlocProvider(
        create: (context) => SettingsBloc(),
        child: const MaterialApp(
          home: Scaffold(
            body: SizedBox(
                width: 250, height: 250, child: LocationEmbeddingTile()),
          ),
        ),
      ));
      await widgetTester.tap(find.byType(Checkbox).first);
      await widgetTester.pumpAndSettle();
      final finder = find.byType(Checkbox).first;
      final checkbox = widgetTester.firstWidget<Checkbox>(finder);
      expect(checkbox.value, true);
    });
  });
}
