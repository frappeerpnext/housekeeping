import 'dart:convert';
import 'dart:io';

import 'package:housekeeping/models/api/response_model.dart';
import 'package:http/http.dart' as http;

class Api {
  static const int _timeoutDuration = 20;

  //get method
  static Future<GETResponse> get(
    String baseUrl,
    String endPoint, {
    Map<String, String>? header,
    String? cookie,
  }) async {
    Map<String, String> header_;
    if (header != null) {
      header_ = header;
    } else {
      header_ = <String, String>{
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      };
      if (cookie != null) {
        header_.addAll({'Cookie': cookie});
      }
    }

    var apiUrl = Uri.parse('$baseUrl$endPoint');
    try {
      http.Response r = await http
          .get(apiUrl, headers: header_)
          .timeout(const Duration(seconds: _timeoutDuration), onTimeout: () {
        return http.Response.bytes([], 408);
      });

      GETResponse resp = GETResponse(r.statusCode.toInt(), r.headers);
      if (resp.isSuccess) {
        resp.content = r.body.toString();
      }

      return resp;
    } on SocketException {
      GETResponse resp = GETResponse(600, null);
      return resp;
    }
  }

  //post method
  static Future<POSTResponse> post(
    String baseUrl,
    String endPoint, {
    Map<String, String>? header,
    Map<String, String>? cookie,
    Object? body,
  }) async {
    Map<String, String> header_;
    if (header != null) {
      header_ = header;
    } else {
      header_ = <String, String>{
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      };
      if (cookie != null) {
        header_.addAll({'Cookie': cookie['cookie'].toString()});
      }
    }

    var apiUrl = Uri.parse('$baseUrl$endPoint');
    try {
      if (body == null) {
        http.Response r = await http
            .post(apiUrl, headers: header_)
            .timeout(const Duration(seconds: _timeoutDuration), onTimeout: () {
          return http.Response.bytes([], 408);
        });
        //Custom Response API
        POSTResponse resp = POSTResponse(r.statusCode, r.headers);
        if (resp.isSuccess) {
          resp.content = r.body.toString();
        }
        return resp;
      } else {
        http.Response r = await http
            .post(apiUrl, headers: header_, body: body)
            .timeout(const Duration(seconds: _timeoutDuration), onTimeout: () {
          return http.Response.bytes([], 408);
        });

        POSTResponse resp = POSTResponse(r.statusCode, r.headers);
        if (resp.isSuccess) {
          resp.content = r.body.toString();
        } else {
          if (r.body != "") {
            dynamic data = jsonDecode(r.body);
            if (data['message'] != "") {
              resp.message = data['message'];
            }
          }
        }
        return resp;
      }
    } on SocketException {
      POSTResponse resp = POSTResponse(600, null);
      return resp;
    }
  }
}


//post