import 'package:decentproof/features/metadata/interfaces/ILocationService.dart';
import 'package:decentproof/features/metadata/interfaces/IMetaDataPermissionService.dart';
import 'package:decentproof/features/settings/bloc/SettingsBlocEvents.dart';
import 'package:decentproof/features/settings/bloc/SettingsBlocStates.dart';
import 'package:decentproof/features/settings/interfaces/ISettingsStorageService.dart';
import 'package:decentproof/shared/Integrety/interfaces/ISecureStorageService.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

/// This is a rather untypical bloc, as it has multiple events and states which would normaly warrant it's own bloc or at least cubit
/// It allows the user to save their email and secret, as well as modify the permissions for embedding the secret and location in the metadata
class SettingsBloc extends Bloc<SettingsBlocEvents, SettingsBlocStates> {
  SettingsBloc() : super(const InitialSettingsState()) {
    final getIt = GetIt.I;
    final ISecureStorageService secureStorageService =
        getIt.get<ISecureStorageService>();
    final IMetaDataPermissionService metaDataPermissionService =
        getIt.get<IMetaDataPermissionService>();
    final ILocationService locationService = getIt.get<ILocationService>();
    final ISettingsStorageSerivce settingsStorageSerivce =
        getIt.get<ISettingsStorageSerivce>();

    on<SettingsFetchInital>((event, emit) async {
      try {
        bool hasEmail = await secureStorageService.retriveEmail() != null;
        bool locationEmbeddingPermission =
            metaDataPermissionService.shouldEmbedLocation();
        bool secretEmbeddingPermission =
            metaDataPermissionService.shouldEmbedLocation();
        bool errorReportingPermission =
            await settingsStorageSerivce.getErrorReportingPermissionState();
        emit(UpdatedSettingsState(
            hasEmail: hasEmail,
            locationEmbeddingPermission: locationEmbeddingPermission,
            secretEmbeddingPermission: secretEmbeddingPermission,
            errorReportingPermission: errorReportingPermission));
      } catch (e, stackTrace) {
        addError(e, stackTrace);
        emit(ErrorState(e.toString()));
        // If this fails, we can't really do much...
      }
    });

    on<SaveEmailEvent>((event, emit) async {
      try {
        if (event.email.isNotEmpty &&
            event.email
                .contains(RegExp(r"^[\w.+-]{2,}\@[\w.-]{2,}\.[a-z]{2,6}$"))) {
          //SRC: https://www.die-regexer.de/regexp/mit-regex-eine-e-mail-validieren/96/
          await secureStorageService.saveEmail(event.email);
          emit((state as UpdatedSettingsState).copyWith(hasEmail: true));
        } else {
          emit(const ErrorState("Invalid Email"));
          add(SettingsFetchInital());
        }
      } catch (e, stackTrace) {
        addError(e, stackTrace);
        emit(ErrorState(e.toString()));
        add(SettingsFetchInital());
      }
    });
    on<DeleteEmail>((event, emit) async {
      try {
        await secureStorageService.deleteEmail();
        emit((state as UpdatedSettingsState).copyWith(hasEmail: false));
        await Future.delayed(const Duration(seconds: 3))
            .then((value) => add(SettingsFetchInital()));
      } catch (e, stackTrace) {
        addError(e, stackTrace);
        emit(ErrorState(e.toString()));
        add(SettingsFetchInital());
      }
    });
    on<SaveSecretEvent>((event, emit) async {
      try {
        if (event.secret.isNotEmpty) {
          if (event.secret.lengthInBytes >= 32) {
            await secureStorageService.saveSecret(
                String.fromCharCodes(event.secret.buffer.asInt8List()));
            emit((state as UpdatedSettingsState)
                .copyWith(secretEmbeddingPermission: true));
          } else {
            emit(const ErrorState("Invalid Secret Length!"));
            add(SettingsFetchInital());
          }
        } else {
          emit(const ErrorState("Invalid Secret"));
          add(SettingsFetchInital());
        }
      } catch (e, stackTrace) {
        addError(e, stackTrace);
        emit(ErrorState(e.toString()));
        add(SettingsFetchInital());
      }
    });
    on<ModifyLocationEmbeddingPermission>((event, emit) async {
      try {
        if (event.permission) {
          bool hasPermission = await locationService.hasPermission();
          if (!hasPermission) {
            bool gotPermission = await locationService.getPermission();
            if (gotPermission) {
              await metaDataPermissionService
                  .allowLocationEmbedding(event.permission);
              emit((state as UpdatedSettingsState)
                  .copyWith(locationEmbeddingPermission: event.permission));
            } else {
              emit(const ErrorState("Location Permission Denied!"));
              add(SettingsFetchInital());
            }
          } else {
            await metaDataPermissionService
                .allowLocationEmbedding(event.permission);
            emit((state as UpdatedSettingsState)
                .copyWith(locationEmbeddingPermission: event.permission));
          }
        } else {
          await metaDataPermissionService
              .allowLocationEmbedding(event.permission);
          emit((state as UpdatedSettingsState)
              .copyWith(locationEmbeddingPermission: event.permission));
        }
      } catch (e, stackTrace) {
        addError(e, stackTrace);
        emit(ErrorState(e.toString()));
        add(SettingsFetchInital());
      }
    });
    on<ModifySecretEmbeddingPermission>((event, emit) {
      try {
        metaDataPermissionService.allowSecretEmbedding(event.permission);
        emit((state as UpdatedSettingsState)
            .copyWith(secretEmbeddingPermission: event.permission));
      } catch (e, stackTrace) {
        addError(e, stackTrace);
        emit(ErrorState(e.toString()));
        add(SettingsFetchInital());
      }
    });
    on<ModifyErrorReportingPermission>((event, emit) async {
      try {
        await settingsStorageSerivce
            .saveErrorReportingPermissionState(event.permission);
        final newState = (state as UpdatedSettingsState)
            .copyWith(errorReportingPermission: event.permission);
        emit(newState);
      } catch (e, stackTrace) {
        addError(e, stackTrace);
        emit(ErrorState(e.toString()));
        add(SettingsFetchInital());
      }
    });
  }
}
