import 'dart:convert';
import 'dart:io';

String _getAuth({required String serviceSecret, required String licenseKey}) {
  var auth = "$serviceSecret:$licenseKey";
  Codec<String, String> stringToBase64 = utf8.fuse(base64);
  return stringToBase64.encode(auth);
}

Map<String, String> getJsonHeader(
    {required String serviceSecret, required String licenseKey}) {
  return {
    "Content-Type": "application/json; charset=utf-8",
    HttpHeaders.authorizationHeader:
        "ESA ${_getAuth(serviceSecret: serviceSecret, licenseKey: licenseKey)}",
  };
}
