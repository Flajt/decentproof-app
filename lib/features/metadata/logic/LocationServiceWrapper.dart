import 'package:decentproof/features/metadata/interfaces/ILocationService.dart';
import 'package:decentproof/features/metadata/models/LocationModel.dart';
import 'package:location/location.dart';

class LocationServiceWrapper implements ILocationService {
  final Location _location = Location();
  @override
  Future<bool> getPermission() async {
    PermissionStatus permissionStatus = await _location.requestPermission();
    if (permissionStatus == PermissionStatus.granted ||
        permissionStatus == PermissionStatus.grantedLimited) {
      return true;
    }
    return false;
  }

  @override
  Future<bool> hasPermission() async {
    PermissionStatus permissionStatus = await _location.hasPermission();
    if (permissionStatus == PermissionStatus.granted ||
        permissionStatus == PermissionStatus.grantedLimited) {
      return true;
    }
    return false;
  }

  @override
  Future<LocationModel> requestLocation() async {
    LocationData locationData = await _location.getLocation();
    return LocationModel(
        latitude: locationData.latitude!, longitude: locationData.longitude!);
  }

  @override
  Future<bool> serviceEnabled() async {
    return await _location.serviceEnabled();
  }
}
