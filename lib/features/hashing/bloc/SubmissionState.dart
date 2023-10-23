import 'package:equatable/equatable.dart';

abstract class SubmissionStates extends Equatable {
  const SubmissionStates();
}

class SubmissionInitial extends SubmissionStates {
  @override
  List<Object?> get props => [];
}

class SubmissionInProgress extends SubmissionStates {
  @override
  List<Object?> get props => [];
}

class SubmissionSuccessfull extends SubmissionStates {
  @override
  List<Object?> get props => [];
}

class SubmissionError extends SubmissionStates {
  final String message;
  const SubmissionError(this.message);

  @override
  List<Object?> get props => [message];
}
