abstract class IHashSubmissionService {
  Future<void> submitHash(String hash, String? email);
}
