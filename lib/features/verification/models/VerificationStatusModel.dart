import 'package:equatable/equatable.dart';

/// Holds all states of the verification process, can be used to display the final state
class VerificationStatusModel extends Equatable {
  final bool matchingHashes;
  final bool verifiedSignature;
  final DateTime dateTime;
  final int submissionStatus;

  const VerificationStatusModel(this.matchingHashes, this.verifiedSignature,
      this.dateTime, this.submissionStatus);

  VerificationStatusModel copyWith({
    bool? matchingHashes,
    bool? verifiedSignature,
    DateTime? dateTime,
    int? submissionStatus,
  }) {
    return VerificationStatusModel(
      matchingHashes ?? this.matchingHashes,
      verifiedSignature ?? this.verifiedSignature,
      dateTime ?? this.dateTime,
      submissionStatus ?? this.submissionStatus,
    );
  }

  @override
  List<Object?> get props => [
        matchingHashes,
        verifiedSignature,
        dateTime,
        submissionStatus,
      ];
}
