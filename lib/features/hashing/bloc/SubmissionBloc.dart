import 'package:bloc/bloc.dart';
import 'package:decentproof/features/hashing/bloc/SubmissionEvents.dart';
import 'package:decentproof/features/hashing/bloc/SubmissionState.dart';
import 'package:decentproof/features/hashing/interfaces/IHashSubmissionService.dart';
import 'package:decentproof/shared/Integrety/interfaces/ISecureStorageService.dart';
import 'package:get_it/get_it.dart';

class SubmissionBloc extends Bloc<SubmissionEvent, SubmissionStates> {
  final GetIt getIt = GetIt.I;
  late final IHashSubmissionService _hashSubmissionService;
  late final ISecureStorageService _secureStorageService;

  SubmissionBloc() : super(SubmissionInitial()) {
    _secureStorageService = getIt.get<ISecureStorageService>();
    _hashSubmissionService = getIt.get<IHashSubmissionService>();
    on<SubmitHash>((event, emit) async {
      try {
        emit(SubmissionInProgress());
        String? email = await _secureStorageService.retriveEmail();
        await _hashSubmissionService.submitHash(event.hash, email);
        emit(SubmissionSuccessfull());
      } catch (e) {
        emit(SubmissionError(e.toString()));
      }
    });
  }
}