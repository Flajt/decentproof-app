import 'package:decentproof/features/verification/models/VerificationStatusModel.dart';

/// Interface for file verification service
abstract class IVerificationService {
  /// Verifies a file with the given hash
  Future<VerificationStatusModel> verify(String hash);
  Future<bool> verifySignature(String publicKey, String signature);
}
