import 'package:decentproof/features/metadata/enum/BlockChainEnum.dart';
import 'package:decentproof/features/verification/models/VerificationStatusModel.dart';

/// Interface for file verification service
abstract class IVerificationService {
  /// Verifies a file with the given hash
  Future<VerificationStatusModel> verify(String hash, BlockChain blockChain);
  Future<bool> verifySignature(String publicKey, String signature);
}
