abstract class IMetaDataPermissionService {
  Future<void> init();
  Future<void> allowLocationEmbedding(bool allow);
  Future<void> allowSecretEmbedding(bool allow);
  bool shouldEmbedLocation();
  bool shouldEmbedSecret();
}
