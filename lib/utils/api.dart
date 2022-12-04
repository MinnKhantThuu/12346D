import 'dart:convert';
import 'dart:io';

import 'package:app/utils/api_status.dart';
import 'package:http/http.dart' as http;

class Api {
  static const String BASE_URL = 'http://localhost:3000';
  static Map<String, String> headers = {'content-type': 'application/json'};
  // static const Map<String, String> headers = {
  //       "Content-Type": "application/json",
  //       "Accept": "application/json",
  //       "Authorization": "Bearer $token"
  //     };

  static Future<Object> get({
    required String url,
    String? token,
  }) async {
    try {
      Uri uri = Uri.parse('$BASE_URL$url');
      if (token != null) {
        Api.headers = {
          "Content-Type": "application/json",
          "Accept": "application/json",
          "Authorization": "Bearer $token"
        };
      }
      var response = await http.get(uri, headers: headers);
      if (response.statusCode == 200) {
        var jsonRes = jsonDecode(response.body);
        if (jsonRes['con']) {
          return Success(
              code: response.statusCode, response: jsonRes['result']);
        }
        return Failure(code: response.statusCode, response: jsonRes['msg']);
      } else {
        return Failure(
            code: response.statusCode, response: 'Data Fetching Error');
      }
    } on SocketException {
      return Failure(code: 203, response: 'Internet Connection Down');
    } catch (e) {
      // print(e);
      return Failure(code: 203, response: 'Unknown Error');
    }
  }

  static Future<Object> post({
    required String url,
    required dynamic json,
    String? token,
  }) async {
    try {
      Uri uri = Uri.parse('$BASE_URL$url');
      if (token != null) {
        Api.headers = {
          "Content-Type": "application/json",
          "Accept": "application/json",
          "Authorization": "Bearer $token"
        };
      }
      var response = await http.post(uri, body: json, headers: headers);
      if (response.statusCode == 200) {
        var jsonRes = jsonDecode(response.body);
        if (jsonRes['con']) {
          return Success(
              code: response.statusCode, response: jsonRes['result']);
        }
        return Failure(code: response.statusCode, response: jsonRes['msg']);
      } else {
        return Failure(
            code: response.statusCode, response: 'Data Fetching Error');
      }
    } on SocketException {
      return Failure(code: 203, response: 'Internet Connection Down');
    } catch (e) {
      print(e);
      return Failure(code: 203, response: 'Unknown Error');
    }
  }

  // static Future<Object> postToken({
  //   required String url,
  //   required dynamic json,
  //   String? token,
  // }) async {
  //   try {
  //     Uri uri = Uri.parse('$BASE_URL$url');
  //     Map<String, String> headers = {
  //       "Content-Type": "application/json",
  //       "Accept": "application/json",
  //       "Authorization": "Bearer $token"
  //     };
  //     var response = await http.post(uri, body: json, headers: headers);
  //     if (response.statusCode == 200) {
  //       var jsonRes = jsonDecode(response.body);
  //       print(jsonRes);
  //       if (jsonRes['con']) {
  //         return Success(
  //             code: response.statusCode, response: jsonRes['result']);
  //       }
  //       return Failure(code: response.statusCode, response: jsonRes['msg']);
  //     } else {
  //       print('cannot response');
  //       return Failure(
  //           code: response.statusCode, response: 'Data Fetching Error');
  //     }
  //   } on SocketException {
  //     return Failure(code: 203, response: 'Internet Connection Down');
  //   } catch (e) {
  //     print(e);
  //     return Failure(code: 203, response: 'Unknown Error');
  //   }
  // }
}
