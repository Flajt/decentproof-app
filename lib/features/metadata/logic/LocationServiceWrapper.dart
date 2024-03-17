import 'package:decentproof/features/metadata/interfaces/ILocationService.dart';
import 'package:decentproof/features/metadata/models/LocationModel.dart';
import 'package:geolocator/geolocator.dart';

class LocationServiceWrapper implements ILocationService {
  @override
  Future<bool> getPermission() async {
    LocationPermission permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse) {
      return true;
    } else if (permission == LocationPermission.deniedForever) {
      await Geolocator.openLocationSettings();
      await getPermission(); // Lets hope that doesn't run forever
    }
    return false;
  }

  @override
  Future<bool> hasPermission() async {
    LocationPermission permissionStatus = await Geolocator.checkPermission();
    if (permissionStatus == LocationPermission.always ||
        permissionStatus == LocationPermission.whileInUse) {
      return true;
    }
    return false;
  }

  @override
  Future<LocationModel> requestLocation() async {
    Position locationData = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
    return LocationModel(
        latitude: locationData.latitude, longitude: locationData.longitude);
  }

  @override
  Future<bool> serviceEnabled() async {
    final resp = await Geolocator.isLocationServiceEnabled();
    return resp;
  }
}
