import 'package:decentproof/features/metadata/models/LocationModel.dart';

abstract class ILocationService {
  Future<bool> hasPermission();
  Future<bool> getPermission();
  Future<LocationModel> requestLocation();
  Future<bool> serviceEnabled();
}
