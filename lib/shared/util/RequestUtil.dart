import 'dart:math';

import 'package:basic_utils/basic_utils.dart';
import 'package:get_it/get_it.dart';
import '../Integrety/interfaces/IApiKeyRequestService.dart';
import '../Integrety/interfaces/IDeviceIntegrity.dart';
import '../Integrety/interfaces/ISecureStorageService.dart';

///Utility class for different Request methods
class RequestUtil {
  static Future<void> updateOrRetriveKey() async {
    final GetIt getIt = GetIt.I;
    final IApiKeyRequestService apiKeyManager =
        getIt.get<IApiKeyRequestService>();
    final ISecureStorageService storageWrapper =
        getIt.get<ISecureStorageService>();
    final IDeviceIntegrety appCheck = getIt.get<IDeviceIntegrety>();
    String? apiKey = await storageWrapper.retriveApiKey();
    bool hasKey = apiKey != null;

    if (hasKey) {
      // Used to prevent the app from checking everytime
      if (Random().nextInt(3) == 1) {
        bool hasNew = await apiKeyManager.checkForNewApiKey(apiKey);
        if (hasNew) {
          String token = await appCheck.getIntegrityToken();
          String newKey = await apiKeyManager.getNewNewKey(token);
          await storageWrapper.saveApiKey(newKey);
          newKey = overWriteString(newKey);
        }
      }
    } else {
      String token = await appCheck.getIntegrityToken();
      String newKey = await apiKeyManager.getNewNewKey(token);
      await storageWrapper.saveApiKey(newKey);
      newKey = overWriteString(newKey);
    }
  }

  static String overWriteString(String oldString) {
    SecureRandom rand = CryptoUtils.getSecureRandom();
    return String.fromCharCodes(rand.nextBytes(32));
  }
}
