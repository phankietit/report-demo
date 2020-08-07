import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:PVGasReport/src/constants.dart' as Constants;

import 'package:PVGasReport/src/util/network_util.dart';

class Services {
  NetworkUtil _netUtil = new NetworkUtil();

  Future<dynamic> login(String username, String password) async {
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.acceptHeader:
          "text/html,application/xhtml+xml,application/xml,;q=0.9,image/webp,*/*;q=0.8",
    };
    final dataPost = jsonEncode({"username": username, "password": password});
    try {
      return await http
          .post(Constants.LOGIN, body: dataPost, headers: headers)
          .then((http.Response response) {
        int statusCode = response.statusCode;
//        dynamic headers = response.headers;
        dynamic body = json.decode(response.body.toString());
        if (statusCode == 200 && body["success"]) {
          var xxx = new User.map(body["user"]);
          print('xxx1: ' + body["user"].toString());
          user = new User.map(body["user"]);
          print(user.fullName);
          return null;
        }
        throw new Exception(body["error"]);
      });
    } on SocketException {
      throw new Exception('No Internet connection');
    }
  }
}
