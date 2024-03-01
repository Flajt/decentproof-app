import 'package:decentproof/features/metadata/models/LocationModel.dart';
import 'package:test/test.dart';

// What people do for more coverage...
void main() {
  test('contains data', () {
    const latitude = 1.0;
    const longitude = -1.0;
    final LocationModel locationModel =
        LocationModel(latitude: latitude, longitude: longitude);
    expect(locationModel.latitude, latitude);
    expect(locationModel.longitude, longitude);
  });
}
