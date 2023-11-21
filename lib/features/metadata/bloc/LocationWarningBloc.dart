import 'package:bloc/bloc.dart';
import 'package:decentproof/features/metadata/interfaces/ILocationService.dart';
import 'package:decentproof/features/metadata/interfaces/IMetaDataPermissionService.dart';
import 'package:get_it/get_it.dart';

import 'LocationWarningBlocEvents.dart';
import 'LocationWarningBlocStates.dart';

class LocationWarningBloc
    extends Bloc<LocationWarningEvent, LocationWarningState> {
  final _locationService = GetIt.I.get<ILocationService>();
  final _dataPermissionService = GetIt.I.get<IMetaDataPermissionService>();

  LocationWarningBloc() : super(LocationServiceDisabled()) {
    on<CheckLocationService>((event, emit) async {
      try {
        bool locationRequried = _dataPermissionService.shouldEmbedLocation();
        if (locationRequried) {
          bool locationEnabled = await _locationService.serviceEnabled();
          emit(locationEnabled
              ? LocationServiceEnabled()
              : LocationServiceDisabled());
        } else {
          emit(LocationServiceEnabled());
        }
      } catch (e, stackTrace) {
        addError(e, stackTrace);
        emit(LocationServiceHasError(e.toString()));
      }
    });
  }
}
