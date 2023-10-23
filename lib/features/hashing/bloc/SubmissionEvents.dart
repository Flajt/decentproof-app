abstract class SubmissionEvent {}

class SubmitHash extends SubmissionEvent {
  final String hash;
  SubmitHash(this.hash);
}
