import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';



final apiUrl = 'http://192.168.1.103:4000';

abstract class SaloonAppService<T> {


  // ignore: missing_return
  Future<List<T>> getAll(String route) async {
  //  print(route);
  //  print("$apiUrl/$route");
    final response = await http.get('$apiUrl/$route', headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer '
    },
    );

    switch(response.statusCode){
      case 200:
        final decodedData = await compute<String, List<Map<String, dynamic>>>(_decodeData, response.body);
        return decodedData.map<T>((item) => parse(item)).toList();
        break;
      case 401:
        var responseData = json.decode(response.body);
        print(responseData);
        break;
      case 404:
        throw Exception("404 error Error while fetching Data. from $apiUrl");
        break;
      case 405:
        throw Exception("405 error Error while fetching Data. from $apiUrl");
        break;
      case 422:
        throw Exception("422 error Error while fetching Data. from $apiUrl");
        break;
      case 500:
        throw Exception("${response.body} 500 error Error while fetching Data. from $apiUrl");
        break;
      default:
    }
//    if (response.statusCode == 200) {
//      final decodedData = await compute<String, List<Map<String, dynamic>>>(_decodeData, response.body);
//
//      return decodedData.map<T>((item) => parse(item)).toList();
//    } else {
//      throw Exception("Error while fetching Data. from $apiUrl");
//    }
  }
//
  static List<Map<String, dynamic>> _decodeData(String encodedData) {
    return jsonDecode(encodedData).cast<Map<String, dynamic>>();
  }

  static getConvertedImageUrl(String url) {
      return "http://192.168.1.103:4000/$url";
  }

  T parse(Map<String, dynamic> item);

  static post(String route, data) async {
    Dio dio =  Dio();
    try {
      Response response = await dio.post("$apiUrl/$route", data: data, options: Options(
        headers: {
          "Authorization": " Bearer" + 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC9zYXFpYi1wYzo4MDAwXC9hcGlcL2F1dGhcL2xvZ2luIiwiaWF0IjoxNTkyMjA4OTM3LCJleHAiOjE1OTIyMTI1MzcsIm5iZiI6MTU5MjIwODkzNywianRpIjoic3hsTWowakNLbmN4TjBhayIsInN1YiI6NiwicHJ2IjoiODdlMGFmMWVmOWZkMTU4MTJmZGVjOTcxNTNhMTRlMGIwNDc1NDZhYSJ9.whqalMrRzRQqBPkcXzaCbFLHA5SlyJpBLulWmG3-ccQ',
          "Accept": "application/json",
          "Content-Type": "application/json"
        }
      ));

      return response;
    }
    on DioError catch(e) {

      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        print(e.response.data);
        print(e.response.headers);
        print(e.response.request);
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e.request);
        print(e.message);
      }
    }
  }

}
