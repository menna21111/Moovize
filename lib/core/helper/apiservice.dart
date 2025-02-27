import 'dart:developer';

import 'package:dio/dio.dart';

import '../constants/Url.dart';



class Apiservice {

  final _baseUrl = URL.baseUrl;
  final apikey = URL.apiKey;
  final sessionid = URL.sessionid;
  final Dio _dio;
  Apiservice(this._dio);
  Future<Map<String, dynamic>> get(
      {required String endpoint, Options? options}) async {
    var response =
        await _dio.get('$_baseUrl$endpoint?api_key=$apikey', options: options);
    log('url is');
    print('$_baseUrl$endpoint?api_key=$apikey');
    print(response.data);
    // log(response.data);
    return response.data;
  }
  Future<Map<String, dynamic>> getwsessionid(
      {required String endpoint, Options? options}) async {
    var response =
        await _dio.get('$_baseUrl$endpoint?api_key=$apikey&session_id=$sessionid', options: options);
    log('url is getwsessionid');
       String url = '$_baseUrl$endpoint?api_key=$apikey&session_id=$sessionid';
    print(response.data);
    print('$_baseUrl$endpoint?api_key=$apikey&session_id=$sessionid');
    print(response.data);
    // log(response.data);
    return response.data;
  }

  Future<Map<String, dynamic>> search(
      {required String endpoint,
      Options? options,
      String? query,
      String? name}) async {
    String url = '$_baseUrl$endpoint?api_key=$apikey&$name$query';
    var response = await _dio.get(
        name == null
            ? '$_baseUrl$endpoint?api_key=$apikey'
            : '$_baseUrl$endpoint?api_key=$apikey&$name$query',
        options: options);
    print(url);
    print(response.data);
    // log(response.data);
    return response.data;
  }

  Future<Map<String, dynamic>> post(
      {required String endpoint,
      Object? data,
      Map<String, dynamic>? queryParameters,
      Options? options}) async {
    var response = await _dio.post(
      '$_baseUrl$endpoint?api_key=$apikey&session_id=$sessionid',
      data: data,
      options: options,
    );
    String url = '$_baseUrl$endpoint?api_key=$apikey?session_id=$sessionid';
    print(response.data);
   print(url);
    log('response of post come');
    return response.data;
  }

  Future<Map<String, dynamic>> delete(
      {required String endpoint,
      Object? data,
      Map<String, dynamic>? queryParameters,
      Options? options}) async {
    var response = await _dio.delete(
      '$_baseUrl$endpoint?api_key=$apikey?session_id=$sessionid',
      data: data,
      options: options,
    );
  
  String url = '$_baseUrl$endpoint?api_key=$apikey?session_id=$sessionid';
    print(response.data);
   print(url);
    log('response of delete come');
    return response.data;
  }

  Future<Map<String, dynamic>> put(
      {required String endpoint,
      Object? data,
      Map<String, dynamic>? queryParameters,
      Options? options}) async {
    var response = await _dio.put(
      '$_baseUrl$endpoint?api_key=$apikey',
      data: data,
      options: options,
    );
    print(response.data);

    log('response of put come');
    return response.data;
  }
}