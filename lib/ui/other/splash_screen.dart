import 'dart:async';
import 'package:demo/constants/image_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/routes_constants.dart';
import '../../utils/get_x_storage.dart';
import '../../utils/get_x_storage_key.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    checkData();
    return Scaffold(
        body: Center(
      child: Image.asset(ImageConstants.icLogo),
    ));
  }

  checkData() async {
    await Future.delayed(const Duration(seconds: 3), () {
      if (GetXStorage().getData(GetXStorageKey.userData) == null) {
        Get.offAllNamed(RoutesConstants.loginScreen);
      } else {
        Get.offAllNamed(RoutesConstants.dashBoardScreen);
      }
    });
  }
}
