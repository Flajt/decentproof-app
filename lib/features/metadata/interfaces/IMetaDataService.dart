abstract class IMetaDataService {
  Future<bool> shouldEmbedLocation();
  Future<bool> shouldEmbedSecret();
  Future<void> embedLocation(bool should);
  Future<void> embedSecret(bool should);
  Future<String> embedLocationASecret();
}
