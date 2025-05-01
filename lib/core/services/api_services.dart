import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gaphy_mobile_app/core/constant/urls.dart';

class ApiServices {
  /// base option setup
  static final Dio _dio = Dio(BaseOptions(
      baseUrl: Urls.baseUrl,
      connectTimeout: Duration(seconds: 10),
      receiveTimeout: Duration(seconds: 10),
      headers: {"accept": "application/json"}));

  /// get request
  static Future<Response> getAPICall(String endPoint,
      {Map<String, dynamic>? queryParams}) async {
    try {
      final Response response =
          await _dio.get(endPoint, queryParameters: queryParams);
      debugPrint("\n\nget request success : ${response.data}");
      return response;
    } on DioException catch (e) {
      debugPrint("\n\nget request failed : ${e.response?.statusCode} - ${e.message}");
      return Future.error("Error: ${e.response?.statusCode}");
    }
  }

  /// post request
static  Future<Response> postAPICall(String endPoint, Map<String, dynamic> body) async {
    try{
      final Response response = await _dio.post(endPoint, data: body);
      debugPrint("\n\n post request success : ${response.data}");
      return response;
    } on DioException catch (e){
      debugPrint("\n\nget request failed : ${e.response?.statusCode} - ${e.message}");
      return Future.error("Error: ${e.response?.statusCode}");
    }
  }
}
