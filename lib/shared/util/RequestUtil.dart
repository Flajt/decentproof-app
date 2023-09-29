import 'dart:math';

import 'package:basic_utils/basic_utils.dart';
import 'package:decentproof/shared/integrety/ApiKeyRequestService.dart';
import 'package:decentproof/shared/integrety/SecureStorageWrapper.dart';
import 'package:decentproof/shared/integrety/interfaces/IDeviceIntegrity.dart';

import '../integrety/AppCheck.dart';
import '../integrety/interfaces/IApiKeyRequestService.dart';

///Utility class for different Request methods
class RequestUtil {
  static Future<void> updateOrRetriveKey() async {
    final IApiKeyRequestService apiKeyManager = ApiKeyRequestService();
    final SecureStorageWrapper storageWrapper = SecureStorageWrapper();
    final IDeviceIntegrety appCheck = AppCheck();
    String? apiKey = await storageWrapper.retriveApiKey();
    bool hasKey = apiKey != null;

    if (hasKey) {
      //Used to prevent overwhelming the service with requsts for a new key, as soon as it's available
      if (Random().nextInt(2) == 1) {
        bool hasNew = await apiKeyManager.checkForNewApiKey(apiKey);
        if (hasNew) {
          String token = await appCheck.getIntegrityToken();
          String newKey = await apiKeyManager.getNewNewKey(token);
          storageWrapper.saveApiKey(newKey);
          newKey = overWriteString(newKey);
        }
      }
    } else {
      String token = await appCheck.getIntegrityToken();
      String newKey = await apiKeyManager.getNewNewKey(token);
      storageWrapper.saveApiKey(newKey);
      storageWrapper.saveApiKey(newKey);
      newKey = overWriteString(newKey);
    }
  }

  static String overWriteString(String oldString) {
    SecureRandom rand = CryptoUtils.getSecureRandom();
    return String.fromCharCodes(rand.nextBytes(32));
  }
}
