import 'package:decentproof/features/metadata/models/LocationModel.dart';

abstract class IMetaDataService {
  ///Adds location to metadata
  Future<String> addLocation(LocationModel locationModel);

  ///Adds secret to file metatdata
  Future<String> addSecret(String secretHash);

  ///Convenience method to add both location and secret
  Future<String> addLocationAndSecret(
      LocationModel locationModel, String secretHash);
}
