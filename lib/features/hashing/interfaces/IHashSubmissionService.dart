import 'package:decentproof/features/metadata/enum/BlockChainEnum.dart';

abstract class IHashSubmissionService {
  Future<void> submitHash(String hash, String? email, BlockChain blockChain);
}
