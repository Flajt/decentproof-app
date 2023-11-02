import 'package:decentproof/features/metadata/models/LocationModel.dart';
import 'package:decentproof/features/metadata/models/MetaDataModel.dart';
import 'package:test/test.dart';

void main() {
  test("MetaDataModel with all inputs", () {
    const secretHash = "secretHash";
    final locationModel = LocationModel(latitude: 0.0, longitude: -1.0);
    MetaDataModel metaDataModel = MetaDataModel(secretHash, locationModel);
    expect(metaDataModel.secretHash, secretHash);
    expect(metaDataModel.location, locationModel);
  });
  test("MetaDataModel with only secret", () {
    const secretHash = "secretHash";
    const locationModel = null;
    MetaDataModel metaDataModel = MetaDataModel(secretHash, locationModel);
    expect(metaDataModel.secretHash, secretHash);
    expect(metaDataModel.location, locationModel);
  });
  test("MetaDataModel with secret = null", () {
    const secretHash = null;
    final locationModel = LocationModel(latitude: 0.0, longitude: -1.0);
    MetaDataModel metaDataModel = MetaDataModel(secretHash, locationModel);
    expect(metaDataModel.secretHash, secretHash);
    expect(metaDataModel.location, locationModel);
  });
  test("MetaDataModel empty", () {
    final model = MetaDataModel(null, null);
    expect(model.location, null);
    expect(model.secretHash, null);
  });
}
