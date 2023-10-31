import 'package:decentproof/features/metadata/interfaces/IMetaDataPermissionService.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MetaDataPermissionService extends IMetaDataPermissionService {
  SharedPreferences? _sharedPreferences;

  @override
  Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  @override
  Future<void> allowLocationEmbedding(bool allow) async {
    await _sharedPreferences!.setBool("allowLocation", allow);
  }

  @override
  Future<void> allowSecretEmbedding(bool allow) async {
    await _sharedPreferences!.setBool("allowSecret", allow);
  }

  @override
  bool shouldEmbedLocation() {
    return _sharedPreferences!.getBool("allowLocation") ?? false;
  }

  @override
  bool shouldEmbedSecret() {
    return _sharedPreferences!.getBool("allowSecret") ?? false;
  }
}
