import 'package:bloc/bloc.dart';
import 'package:decentproof/features/metadata/interfaces/IMetaDataPermissionService.dart';
import 'package:decentproof/features/settings/bloc/SettingsBlocEvents.dart';
import 'package:decentproof/features/settings/bloc/SettingsBlocStates.dart';
import 'package:decentproof/shared/Integrety/interfaces/ISecureStorageService.dart';
import 'package:get_it/get_it.dart';

class SettingsBloc extends Bloc<SettingsBlocEvents, SettingsBlocStates> {
  SettingsBloc() : super(InitialSecureStorageState()) {
    final getIt = GetIt.I;
    final ISecureStorageService secureStorageService =
        getIt.get<ISecureStorageService>();
    final IMetaDataPermissionService metaDataPermissionService =
        getIt.get<IMetaDataPermissionService>();

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
        }
      } catch (e) {
        emit(ErrorState(e.toString()));
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
          }
        } else {
          emit(ErrorState("Invalid Secret"));
        }
      } catch (e) {
        emit(ErrorState(e.toString()));
      }
    });
    on<ModifyLocationEmbeddingPermission>((event, emit) async {
      try {
        await metaDataPermissionService
            .allowLocationEmbedding(event.permission);
        emit(LocationEmbeddingPermissionModified());
      } catch (e) {
        emit(ErrorState(e.toString()));
      }
    });
    on<ModifySecretEmbeddingPermission>((event, emit) {
      try {
        metaDataPermissionService.allowSecretEmbedding(event.permission);
        emit(SecretEmbeddingPermissionModified());
      } catch (e) {
        emit(ErrorState(e.toString()));
      }
    });
  }
}
