import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart' as g;
import '../constants/string_constant.dart';
import '../models/response_model/error_response_model.dart';
import '../ui/dialog/un_authorized_dialog.dart';
import '../utils/common_method.dart';

class Logging extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (kDebugMode) {
      print('REQUEST[${options.method}] => PATH: ${options.path}');
      print('REQUEST[${options.method}] => Options: ${options.data}');
      print(
          'REQUEST[${options.method}] => authToken: ${CommonMethod().getUserData()?.authToken}');
    }
    options.headers["Accept"] = "application/json";
    if (CommonMethod().getUserData() != null) {
      options.headers['Authorization'] =
          "Bearer ${CommonMethod().getUserData()?.authToken ?? StringConstants.emptyString}";
      return handler.next(options);
    }
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (kDebugMode) {
      print(
        'RESPONSE[${response.statusCode}] => data: $response',
      );
    }
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 401) {
      g.Get.dialog(const UnAuthorizedDialog(), barrierDismissible: false);
    } else {
      if (err.response != null) {
        if (err.response!.data is String) {
          if (err.response?.data.toString().contains("<!doctype html>") ==
              true) {
            CommonMethod().showServerMessageSnack(null, null);
          } else {
            var response =
                ErrorResponseModel.fromJson(json.decode(err.response!.data));
            CommonMethod().showServerMessageSnack(
                response.message, err.response?.statusCode);
          }
        } else {
          var response = ErrorResponseModel.fromJson(err.response?.data);
          CommonMethod().showServerMessageSnack(
              response.message, err.response?.statusCode);
        }
      }
    }
    if (kDebugMode) {
      print(
        'ERROR[${err.response?.statusCode}] => error: $err',
      );
    }
    return super.onError(err, handler);
  }
}
