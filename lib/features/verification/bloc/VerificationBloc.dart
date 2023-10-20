import 'package:decentproof/features/verification/bloc/VerificationBlocEvents.dart';
import 'package:decentproof/features/verification/bloc/VerificationBlocStates.dart';
import 'package:decentproof/features/verification/interfaces/IFileSelectionService.dart';
import 'package:decentproof/features/verification/interfaces/IVerificationService.dart';
import 'package:decentproof/features/verification/models/VerificationStatusModel.dart';
import 'package:decentproof/shared/interface/IHashLogic.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class VerificationBloc
    extends Bloc<VerificationBlocEvents, VerificationBlocStates> {
  final _getIt = GetIt.I;
  late final IVerificationService _verificationService;
  late final IFileSelectionService _fileSelectionService;
  late final IHashLogic _hashLogic;
  VerificationBloc() : super(InitialState()) {
    _verificationService = _getIt.get<IVerificationService>();
    _fileSelectionService = _getIt.get<IFileSelectionService>();
    _hashLogic = _getIt.get<IHashLogic>();
    on<VerifyHashEvent>((event, emit) async {
      try {
        emit(LoadingState());
        Stream<List<int>>? byteStream =
            await _fileSelectionService.selectFileAsStream();
        if (byteStream != null) {
          String hash =
              await _hashLogic.hashBytesInChunksFromStream(byteStream);
          VerificationStatusModel model =
              await _verificationService.verify(hash);
          emit(VerifiedState(model));
        } else {
          emit(InitialState());
        }
      } catch (e) {
        emit(ErrorState(e.toString()));
      }
    });
    on<ResetEvent>((event, emit) => emit(InitialState()));
  }
}
