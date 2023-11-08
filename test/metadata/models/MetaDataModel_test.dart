import 'package:decentproof/features/metadata/models/LocationModel.dart';
import 'package:decentproof/features/metadata/models/MetaDataModel.dart';
import 'package:test/test.dart';

void main() {
  test("MetaDataModel with all inputs", () {
    const secretHash = "secretHash";
    const locationModel = LocationModel(latitude: 0.0, longitude: -1.0);
    const MetaDataModel metaDataModel =
        MetaDataModel(secretHash, locationModel);
    expect(metaDataModel.secretHash, secretHash);
    expect(metaDataModel.location, locationModel);
  });
  test("MetaDataModel with only secret", () {
    const secretHash = "secretHash";
    const locationModel = null;
    const MetaDataModel metaDataModel =
        MetaDataModel(secretHash, locationModel);
    expect(metaDataModel.secretHash, secretHash);
    expect(metaDataModel.location, locationModel);
  });
  test("MetaDataModel with secret = null", () {
    const secretHash = null;
    const locationModel = LocationModel(latitude: 0.0, longitude: -1.0);
    const MetaDataModel metaDataModel =
        MetaDataModel(secretHash, locationModel);
    expect(metaDataModel.secretHash, secretHash);
    expect(metaDataModel.location, locationModel);
  });
  test("MetaDataModel empty", () {
    const model = MetaDataModel(null, null);
    expect(model.location, null);
    expect(model.secretHash, null);
  });
}
