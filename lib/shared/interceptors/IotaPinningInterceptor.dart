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
          "21:5F:37:BB:80:7F:FB:04:38:CE:6D:65:E1:C6:9B:A9:8A:39:89:D6:0D:29:75:3E:1C:2A:59:CB:59:62:4D:12"
        ]);
    if (secure == "CONNECTION_SECURE") {
      return request;
    }
    throw "Connection not secure!";
  }
}
