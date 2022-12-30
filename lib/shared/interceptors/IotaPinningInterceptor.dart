import 'dart:async';

import 'package:chopper/chopper.dart';
import 'package:http_certificate_pinning/http_certificate_pinning.dart';

class IotaSSLPinningInterceptor extends RequestInterceptor {
  @override
  FutureOr<Request> onRequest(Request request) async {
    String secure = await HttpCertificatePinning.check(
        headerHttp: request.headers,
        serverURL: request.url.toString(),
        sha: SHA.SHA256,
        timeout: 30,
        allowedSHAFingerprints: [
          "96:67:83:59:C9:AF:6C:73:F6:B7:A9:68:B5:C6:50:85:63:F1:E2:D6:13:E0:57:F0:C2:EA:4B:C6:5F:83:76:68",
          "B3:1C:6E:CB:D6:63:95:65:B8:1E:6A:D8:E7:37:A6:3A:6B:74:76:C0:23:0F:76:34:07:E3:79:9D:F6:F3:FB:B0"
        ]);
    if (secure == "CONNECTION_SECURE") {
      return request;
    }
    throw "Connection not secure!";
  }
}
