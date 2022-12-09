import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/string_constant.dart';
import '../models/response_model/user_data_response_model.dart';
import 'get_x_storage.dart';
import 'get_x_storage_key.dart';

class CommonMethod {
  int getDeviceType() {
    return Platform.isAndroid
        ? StringConstants.platFormAndroid
        : StringConstants.platFormIos;
  }

  String firebaseToken() {
    return "123";
  }

  Data? getUserData() {
    Data userData;
    if (GetXStorage().getData(GetXStorageKey.userData) == null) {
      return null;
    }
    if (GetXStorage().getData(GetXStorageKey.userData)
        is Map<String, dynamic>) {
      userData = Data.fromJson(GetXStorage().getData(GetXStorageKey.userData));
    } else {
      userData = GetXStorage().getData(GetXStorageKey.userData) as Data;
    }
    return userData;
  }

  showErrorSnack(String error) {
    Get.snackbar(StringConstants.error, error,
        backgroundColor: Colors.red, colorText: Colors.white);
  }

  showServerMessageSnack(String? error, int? statusCode) {
    Get.snackbar(
        colorText: Colors.white,
        statusCode == 200 ? StringConstants.success : StringConstants.error,
        error ?? StringConstants.someThingWentWrong,
        backgroundColor: statusCode == 200 ? Colors.green : Colors.red);
  }

  bool checkPasswordRegex(String password) {
    RegExp regex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    if (!regex.hasMatch(password)) {
      return false;
    } else {
      return true;
    }
  }
}
