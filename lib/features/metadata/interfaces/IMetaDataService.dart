import 'package:decentproof/features/metadata/enum/BlockChainEnum.dart';
import 'package:decentproof/features/metadata/models/LocationModel.dart';
import 'package:decentproof/features/metadata/models/MetaDataModel.dart';

abstract class IMetaDataService {
  ///Adds location to metadata
  Future<String> addLocation(
      LocationModel locationModel, String filePath, BlockChain blockChain);

  ///Adds secret to file metatdata
  Future<String> addSecret(
      String secretHash, String filePath, BlockChain blockChain);

  ///Convenience method to add both location and secret
  Future<String> addLocationAndSecret(LocationModel locationModel,
      String secretHash, String filePath, BlockChain blockChain);

  Future<MetaDataModel> retriveMetaData(String filePath);

  /// Ads basic metadata to the file, this is the minimum required metadata
  /// to be added to the file. This includes the software version and the blockchain name
  Future<String> addBasicMetaData(String filePath, BlockChain blockChain);
}
