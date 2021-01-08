import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:sample/core/config/environment_helper.dart';
import 'package:sample/core/device/device_helper.dart';

import 'api_error.dart';

class ApiClient {
  Dio _dio;
  EnvironmentHelper _environmentHelper;

  ApiClient(
      Dio dio, DeviceHelper deviceHelper, EnvironmentHelper environmentHelper) {
    _environmentHelper = environmentHelper;
    dio.interceptors.add(InterceptorsWrapper(
        onRequest: (RequestOptions options) async {
          options.headers['Authorization'] = 'Bearer ${await 'access token'}';
          options.headers['DeviceId'] =
              await deviceHelper.getDeviceIdentifier();
          return options;
        },
        onError: (DioError error) => error));
    _dio = dio;
  }

  Future<T> httpGet<T>(String serviceName) async {
    Response response;
    try {
      response =
          await _dio.get(_environmentHelper.getValue(EnvironmentKey.BaseUrl));
      _checkResponseIsOk(response);
      print(response.data);
    } catch (e) {
      _handleRequestError(e);
    }
    return response.data as T;
  }

  Future<T> httpPost<T>(String serviceName, dynamic data) async {
    Response response;
    try {
      response = await _dio.post(
          _environmentHelper.getValue(EnvironmentKey.BaseUrl),
          data: json.encode(data),
          options: Options(
              headers: {'Content-Type': 'application/json; charset=utf-8'}));
      _checkResponseIsOk(response);
    } catch (e) {
      _handleRequestError(e);
    }
    return response.data as T;
  }

  Future<T> httpPut<T>(String serviceName, dynamic data) async {
    Response response;
    try {
      response = await _dio.put(
          _environmentHelper.getValue(EnvironmentKey.BaseUrl),
          data: json.encode(data),
          options: Options(
              headers: {'Content-Type': 'application/json; charset=utf-8'}));
      _checkResponseIsOk(response);
    } catch (e) {
      _handleRequestError(e);
    }
    return response.data as T;
  }

  Future<T> httpDelete<T>(String serviceName) async {
    Response response;
    try {
      final response = await _dio.delete(
          _environmentHelper.getValue(EnvironmentKey.BaseUrl),
          options: Options(
              headers: {'Content-Type': 'application/json; charset=utf-8'}));
      _checkResponseIsOk(response);
    } catch (e) {
      _handleRequestError(e);
    }
    return response.data as T;
  }

  void _checkResponseIsOk(Response response) {
    if (response.statusCode >= 200 && response.statusCode < 300) return;
    throw ApiError(response);
  }

  void _handleRequestError(error) {
    if (error is SocketException) {
      var errorCode = error.osError.errorCode;
      if (errorCode == 61 ||
          errorCode == 60 ||
          errorCode == 111 ||
          // Network is unreachable
          errorCode == 101 ||
          errorCode == 104 ||
          errorCode == 51 ||
          errorCode == 8 ||
          errorCode == 113 ||
          errorCode == 7 ||
          errorCode == 64) {
        throw ApiConnectionRefusedError(error);
      }
    }

    throw error;
  }
}
