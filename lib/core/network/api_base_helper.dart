import 'dart:convert';
import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import 'api_exception.dart';

class ApiBaseHelper {
  Dio dio = Dio();

  static Future<bool> checkConnection() async {
    if (kIsWeb) return true;
    var result = await Connectivity().checkConnectivity();
    return result == ConnectivityResult.mobile ||
        result == ConnectivityResult.wifi;
  }

  Future<Response> get(String url) async {
    debugPrint('Url : $url ');
    Response response;
    try {
      dio.options.headers['content-Type'] = 'application/json';
      // dio.options.headers['Authorization'] = 'Bearer $token';
      response = await dio.get(url);
      // debugPrint(response.data.toString());
    } on SocketException {
      throw FetchDataException('No Internet connection.');
    }
    return response;
  }

  Future<Response> post(String url, dynamic data) async {
    debugPrint('{Url : $url,\nbody: ${data.toString()}');
    // String? token = await LocalPrefs.getToken();
    Response response;
    try {
      dio.options.headers['content-Type'] = 'application/json';
      // dio.options.headers['Authorization'] = 'Bearer $token';
      response = await dio.post(
        url,
        data: data,
        options: Options(
          followRedirects: false,
          validateStatus: (status) {
            return status! < 500;
          },
        ),
      );
      debugPrint(response.data.toString());
    } on SocketException {
      throw FetchDataException('No Internet connection.');
    }
    return response;
  }

  Future<Response> put(String url, dynamic data) async {
    debugPrint('{Url : $url,\nbody: ${data.toString()}');
    // String? token = await LocalPrefs.getToken();
    Response response;
    try {
      dio.options.headers['content-Type'] = 'application/json';
      // dio.options.headers['Authorization'] = 'Bearer $token';
      response = await dio.put(
        url,
        data: data,
        options: Options(
          followRedirects: false,
          validateStatus: (status) {
            return status! < 500;
          },
        ),
      );
      debugPrint(response.data.toString());
    } on SocketException {
      throw FetchDataException('No Internet connection.');
    }
    return response;
  }

  Future<Response> delete(String url, {dynamic data}) async {
    debugPrint('{Url : $url,\nbody: ${data.toString()}');
    // String? token = await LocalPrefs.getToken();
    Response response;
    try {
      dio.options.headers['content-Type'] = 'application/json';
      // dio.options.headers['Authorization'] = 'Bearer $token';
      response = await dio.delete(url, data: data);
    } on SocketException {
      throw FetchDataException('No Internet connection.');
    }
    return response;
  }

  dynamic _returnResponse(Response response) {
    switch (response.statusCode) {
      case 200:
        return json.decode(response.data.toString());
      case 400:
        return json.decode(response.data.toString());
      case 401:
      case 403:
        return json.decode(response.data.toString());
      case 500:
      default:
        return FetchDataException(
            'Error occurred while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
