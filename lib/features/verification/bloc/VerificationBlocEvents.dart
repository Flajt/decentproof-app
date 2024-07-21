import 'package:decentproof/features/metadata/enum/BlockChainEnum.dart';

abstract class VerificationBlocEvents {}

class VerifyHashEvent extends VerificationBlocEvents {
  final BlockChain blockChain;

  VerifyHashEvent({required this.blockChain});
}

class ResetEvent extends VerificationBlocEvents {}
