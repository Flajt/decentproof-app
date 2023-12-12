import 'package:decentproof/features/metadata/models/MetaDataModel.dart';
import 'package:equatable/equatable.dart';

/// Holds all states of the verification process, can be used to display the final state
class VerificationStatusModel extends Equatable {
  final bool matchingHashes;
  final bool verifiedSignature;
  final DateTime dateTime;
  final int submissionStatus;
  final String? bitcoinTransaction;
  final String? ethereumTransaction;
  final MetaDataModel? metaDataModel;

  const VerificationStatusModel(
      this.matchingHashes,
      this.verifiedSignature,
      this.dateTime,
      this.submissionStatus,
      this.metaDataModel,
      this.bitcoinTransaction,
      this.ethereumTransaction);

  VerificationStatusModel copyWith(
      {bool? matchingHashes,
      bool? verifiedSignature,
      DateTime? dateTime,
      int? submissionStatus,
      String? bitcoinTransaction,
      String? ethereumTransaction,
      MetaDataModel? metaDataModel}) {
    return VerificationStatusModel(
      matchingHashes ?? this.matchingHashes,
      verifiedSignature ?? this.verifiedSignature,
      dateTime ?? this.dateTime,
      submissionStatus ?? this.submissionStatus,
      metaDataModel ?? this.metaDataModel,
      bitcoinTransaction ?? this.bitcoinTransaction,
      ethereumTransaction ?? this.ethereumTransaction,
    );
  }

  @override
  List<Object?> get props => [
        matchingHashes,
        verifiedSignature,
        dateTime,
        submissionStatus,
        bitcoinTransaction,
        ethereumTransaction,
        metaDataModel
      ];
}
