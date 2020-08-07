import 'dart:convert';
import 'dart:io';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class NetworkUtil {
  final storage = new FlutterSecureStorage();

  Future<dynamic> get(String url, {Map headers}) async {
    try {
      dynamic token = storage.read(key: "jwt");
      print(token);
      Map<String, String> defaultHeaders = {
        "Content-Type": "application/json",
        "Accept":
            "text/html,application/xhtml+xml,application/xml,application/json;q=0.9,image/webp,*/*;q=0.8",
        "Authorization": "Bearer $token"
      };
      return await http
          .get(url, headers: headers != null ? headers : defaultHeaders)
          .then((http.Response response) {
        return _returnResponse(response);
      });
    } on SocketException {
      throw new Exception('No Internet connection');
    }
  }

  Future<dynamic> post(String url, {Map headers, body, encoding}) async {
    try {
      dynamic token = storage.read(key: "jwt");
      Map<String, String> defaultHeaders = {
        "Content-Type": "application/json",
        "Accept":
            "text/html,application/xhtml+xml,application/xml,application/json;q=0.9,image/webp,*/*;q=0.8",
        "Authorization": "Bearer $token"
      };
      return await http
          .post(url,
              body: body,
              headers: headers != null ? headers : defaultHeaders,
              encoding: encoding)
          .then((http.Response response) {
        return _returnResponse(response);
      });
    } on SocketException {
      throw new Exception('No Internet connection');
    }
  }

  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        print(response.headers.toString());
        return json.decode(response.body.toString());
      case 400:
        throw new Exception(response.body.toString());
      case 401:
      case 403:
        throw new Exception(response.body.toString());
      case 500:
      default:
        throw new Exception(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
