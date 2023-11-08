import 'dart:convert';
import 'package:http/http.dart' as http;
import 'interfaces/IApiKeyRequestService.dart';

class ApiKeyRequestService implements IApiKeyRequestService {
  final String checkKeyURL;
  final String getKeyURL;

  ApiKeyRequestService({required this.checkKeyURL, required this.getKeyURL});
  @override
  Future<bool> checkForNewApiKey(String? apiKey) async {
    http.Response resp = await http.get(Uri.parse("$checkKeyURL/"), headers: {
      "Authorization": "basic $apiKey",
      "Content-Type": "application/json"
    });
    if (resp.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(resp.body);
      bool hasNewer = json["hasNewKey"];
      return hasNewer;
    }
    throw resp.statusCode.toString();
  }

  @override
  Future<String> getNewNewKey(String token) async {
    http.Response resp = await http.get(Uri.parse("$getKeyURL/"), headers: {
      "X-AppCheck": token,
    });
    if (resp.statusCode == 200) {
      String apiKey = resp.body;
      return apiKey;
    } else {
      throw "${resp.statusCode.toString()} + Possible Invalid device!";
    }
  }
}
