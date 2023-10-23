import 'package:bloc/bloc.dart';
import 'package:decentproof/features/settings/bloc/SecureStorageBlocEvents.dart';
import 'package:decentproof/features/settings/bloc/SecureStorageBlocState.dart';
import 'package:decentproof/shared/Integrety/interfaces/ISecureStorageService.dart';
import 'package:get_it/get_it.dart';

class SecureStorageBloc
    extends Bloc<SecureStorageBlocEvent, SecureStorageState> {
  SecureStorageBloc() : super(InitialSecureStorageState()) {
    final getIt = GetIt.I;
    final ISecureStorageService secureStorageService =
        getIt.get<ISecureStorageService>();

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
  }
}
