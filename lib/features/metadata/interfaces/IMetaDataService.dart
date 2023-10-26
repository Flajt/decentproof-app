abstract class IMetaDataService {
  Future<bool> shouldEmbedLocation();
  Future<bool> shouldEmbedSecret();
}
