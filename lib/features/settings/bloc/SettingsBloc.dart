import 'package:bloc/bloc.dart';
import 'package:decentproof/features/metadata/interfaces/ILocationService.dart';
import 'package:decentproof/features/metadata/interfaces/IMetaDataPermissionService.dart';
import 'package:decentproof/features/settings/bloc/SettingsBlocEvents.dart';
import 'package:decentproof/features/settings/bloc/SettingsBlocStates.dart';
import 'package:decentproof/shared/Integrety/interfaces/ISecureStorageService.dart';
import 'package:get_it/get_it.dart';

/// This is a rather untypical bloc, as it has multiple events and states which would normaly warrant it's own bloc or at least cubit
/// It allows the user to save their email and secret, as well as modify the permissions for embedding the secret and location in the metadata
class SettingsBloc extends Bloc<SettingsBlocEvents, SettingsBlocStates> {
  SettingsBloc() : super(InitialSettingsState()) {
    final getIt = GetIt.I;
    final ISecureStorageService secureStorageService =
        getIt.get<ISecureStorageService>();
    final IMetaDataPermissionService metaDataPermissionService =
        getIt.get<IMetaDataPermissionService>();
    final ILocationService locationService = getIt.get<ILocationService>();

    on<SaveEmailEvent>((event, emit) async {
      try {
        if (event.email.isNotEmpty &&
            event.email
                .contains(RegExp(r"^[\w.+-]{2,}\@[\w.-]{2,}\.[a-z]{2,6}$"))) {
          //SRC: https://www.die-regexer.de/regexp/mit-regex-eine-e-mail-validieren/96/
          await secureStorageService.saveEmail(event.email);
          emit(EmailSavedState(event.email));
        } else {
          emit(ErrorState("Invalid Email"));
          emit(InitialSettingsState());
        }
      } catch (e, stackTrace) {
        addError(e, stackTrace);
        emit(ErrorState(e.toString()));
      }
    });
    on<DeleteEmail>((event, emit) async {
      try {
        await secureStorageService.deleteEmail();
        emit(EmailDeletedState());
        await Future.delayed(const Duration(seconds: 3))
            .then((value) => emit(InitialSettingsState()));
      } catch (e, stackTrace) {
        addError(e, stackTrace);
        emit(ErrorState(e.toString()));
        emit(InitialSettingsState());
      }
    });
    on<SaveSecretEvent>((event, emit) async {
      try {
        if (event.secret.isNotEmpty) {
          if (event.secret.lengthInBytes >= 32) {
            await secureStorageService.saveSecret(
                String.fromCharCodes(event.secret.buffer.asInt8List()));
            emit(SecretSavedState());
          } else {
            emit(ErrorState("Invalid Secret Length!"));
            emit(InitialSettingsState());
          }
        } else {
          emit(ErrorState("Invalid Secret"));
          emit(InitialSettingsState());
        }
      } catch (e, stackTrace) {
        addError(e, stackTrace);
        emit(ErrorState(e.toString()));
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
              emit(LocationEmbeddingPermissionModified(
                  permission: event.permission));
            } else {
              emit(ErrorState("Location Permission Denied!"));
              emit(InitialSettingsState());
            }
          } else {
            await metaDataPermissionService
                .allowLocationEmbedding(event.permission);
            emit(LocationEmbeddingPermissionModified(
                permission: event.permission));
          }
        } else {
          await metaDataPermissionService
              .allowLocationEmbedding(event.permission);
          emit(LocationEmbeddingPermissionModified(
              permission: event.permission));
        }
      } catch (e, stackTrace) {
        addError(e, stackTrace);
        emit(ErrorState(e.toString()));
        emit(InitialSettingsState());
      }
    });
    on<ModifySecretEmbeddingPermission>((event, emit) {
      try {
        metaDataPermissionService.allowSecretEmbedding(event.permission);
        emit(SecretEmbeddingPermissionModified());
      } catch (e, stackTrace) {
        addError(e, stackTrace);
        emit(ErrorState(e.toString()));
        emit(InitialSettingsState());
      }
    });
  }
}
