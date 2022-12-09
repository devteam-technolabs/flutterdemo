import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../constants/routes_constants.dart';
import '../constants/string_constant.dart';
import '../models/request_model/user_request_model.dart';
import '../models/response_model/user_data_response_model.dart';
import '../network/http_service.dart';
import '../utils/common_method.dart';
import '../utils/get_x_storage.dart';
import '../utils/get_x_storage_key.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;
  var isPasswordShow = true.obs;
  var response = UserDataResponseModel();
  late TextEditingController emailEditingController;
  late TextEditingController passwordEditingController;

  final List<FocusNode> focusNodes = [
    FocusNode(),
    FocusNode(),
  ];

  void toggleObscured() {
    isPasswordShow.value = !isPasswordShow.value;
    if (focusNodes[1].hasPrimaryFocus) {
      update();
      return;
    } // If focus is on text field, don't unfocus
    focusNodes[1].canRequestFocus = false; // Prevents focus if tap on eye
    update();
  }

  @override
  void onInit() {
    emailEditingController = TextEditingController();
    passwordEditingController = TextEditingController();
    for (var node in focusNodes) {
      node.addListener(() {
        update();
      });
    }
    super.onInit();
  }

  void validateFields(BuildContext context) {
    FocusScope.of(context).unfocus();
    if (emailEditingController.text.trim().isEmpty) {
      CommonMethod().showErrorSnack(StringConstants.pleaseEnterEmailId);
    } else if (!GetUtils.isEmail(emailEditingController.text.trim())) {
      CommonMethod().showErrorSnack(StringConstants.pleaseEnterValidEmailId);
    } else if (passwordEditingController.text.trim().isEmpty) {
      CommonMethod().showErrorSnack(StringConstants.pleaseEnterPassword);
    } else {
      checkLogin().whenComplete(() {
        if (response.statusCode == 200) {
          GetXStorage().setData(GetXStorageKey.userData, response.data);
          Get.offAllNamed(RoutesConstants.dashBoardScreen);
        }
      });
    }
  }

  Future<UserDataResponseModel> checkLogin() async {
    var loginModel = UserRequestModel(
        email: emailEditingController.text.trim(),
        password: passwordEditingController.text.trim(),
        deviceType: CommonMethod().getDeviceType());

    isLoading(true);
    var responseData =
        await HttpService().checkLogin(jsonEncode(loginModel.toJson()));
    isLoading(false);
    return response = responseData;
  }
}
