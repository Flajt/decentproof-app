import 'package:decentproof/constants.dart';
import 'package:decentproof/features/metadata/enum/BlockChainEnum.dart';
import 'package:decentproof/features/metadata/models/LocationModel.dart';
import 'package:decentproof/features/metadata/models/MetaDataModel.dart';
import 'package:test/test.dart';

void main() {
  test("MetaDataModel with all inputs", () {
    const secretHash = "secretHash";
    const locationModel = LocationModel(latitude: 0.0, longitude: -1.0);
    const MetaDataModel metaDataModel =
        MetaDataModel(secretHash, locationModel, DPM_VERSION, BlockChain.BTC);
    expect(metaDataModel.secretHash, secretHash);
    expect(metaDataModel.location, locationModel);
    expect(metaDataModel.dpmVersion, DPM_VERSION);
    expect(metaDataModel.blockChain, BlockChain.BTC);
  });
  test("MetaDataModel with only secret", () {
    const secretHash = "secretHash";
    const locationModel = null;
    const MetaDataModel metaDataModel =
        MetaDataModel(secretHash, locationModel, DPM_VERSION, BlockChain.BTC);
    expect(metaDataModel.secretHash, secretHash);
    expect(metaDataModel.location, locationModel);
    expect(metaDataModel.dpmVersion, DPM_VERSION);
    expect(metaDataModel.blockChain, BlockChain.BTC);
  });
  test("MetaDataModel with secret = null", () {
    const secretHash = null;
    const locationModel = LocationModel(latitude: 0.0, longitude: -1.0);
    const MetaDataModel metaDataModel =
        MetaDataModel(secretHash, locationModel, DPM_VERSION, BlockChain.BTC);
    expect(metaDataModel.secretHash, secretHash);
    expect(metaDataModel.location, locationModel);
    expect(metaDataModel.dpmVersion, DPM_VERSION);
    expect(metaDataModel.blockChain, BlockChain.BTC);
  });
  test("MetaDataModel empty", () {
    const model = MetaDataModel(null, null, DPM_VERSION, BlockChain.BTC);
    expect(model.location, null);
    expect(model.secretHash, null);
    expect(model.dpmVersion, DPM_VERSION);
    expect(model.blockChain, BlockChain.BTC);
  });
  test("MetaDataModel fromJson", () {
    const model = MetaDataModel(
        "abc",
        LocationModel(latitude: 0.0, longitude: 0.0),
        DPM_VERSION,
        BlockChain.BTC);
    final json = model.toJson();
    final fromJson = MetaDataModel.fromJson(json);
    expect(fromJson.secretHash, model.secretHash);
    expect(fromJson.location!.latitude, model.location!.latitude);
    expect(fromJson.location!.longitude, model.location!.longitude);
    expect(fromJson.dpmVersion, model.dpmVersion);
  });
}
