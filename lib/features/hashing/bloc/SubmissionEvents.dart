import 'package:decentproof/features/metadata/enum/BlockChainEnum.dart';

abstract class SubmissionEvent {}

class SubmitHash extends SubmissionEvent {
  final String hash;
  final BlockChain blockChain;
  SubmitHash(this.hash, this.blockChain);
}

class ResetSubmissionState extends SubmissionEvent {}
