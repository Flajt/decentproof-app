/// Interface for device integrety
abstract class IDeviceIntegrety {
  ///Returns the integrity token used for device verification in the backend
  Future<String> getIntegrityToken();
}
