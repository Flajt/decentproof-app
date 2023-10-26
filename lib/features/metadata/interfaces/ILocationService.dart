abstract class ILocationService {
  Future<bool> hasPermission();
  Future<bool> getPermission();
  Future<bool> requestLocation();
}
