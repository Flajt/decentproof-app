import 'dart:async';
import 'package:chopper/chopper.dart';
import 'package:http_certificate_pinning/http_certificate_pinning.dart';

class BackendSSLPinningInterceptor extends RequestInterceptor {
  @override
  FutureOr<Request> onRequest(Request request) async {
    String secure = await HttpCertificatePinning.check(
        headerHttp: request.headers,
        serverURL: request.url.toString(),
        sha: SHA.SHA256,
        timeout: 30,
        allowedSHAFingerprints: []);
    if (secure == "CONNECTION_SECURE") {
      return request;
    }
    throw "Connection not secure!";
  }
}
