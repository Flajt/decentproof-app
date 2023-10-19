/// Interface for signature verification service
/// It's recommended that you implement methods to load public key and convert the signature to a format that can be verified
///These have not been specified in this interface to prevent beeing stuck with a specific algorithm
abstract class ISignatureVerificationService {
  bool verify(String hash, String sig);
}
