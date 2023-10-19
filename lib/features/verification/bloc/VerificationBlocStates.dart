import 'package:decentproof/features/verification/models/VerificationStatusModel.dart';
import 'package:equatable/equatable.dart';

abstract class VerificationBlocStates extends Equatable {}

class ErrorState extends VerificationBlocStates {
  final String message;

  ErrorState(this.message);

  @override
  List<Object?> get props => [message];
}

class LoadingState extends VerificationBlocStates {
  @override
  List<Object?> get props => [];
}

class VerifiedState extends VerificationBlocStates {
  final VerificationStatusModel statusModel;

  VerifiedState(this.statusModel);

  @override
  List<Object?> get props => [statusModel];
}

class InitialState extends VerificationBlocStates {
  @override
  List<Object?> get props => [];
}
