import 'package:demo/constants/color_constants.dart';
import 'package:demo/constants/image_constants.dart';
import 'package:demo/utils/get_x_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../constants/routes_constants.dart';
import '../../constants/string_constant.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          bottomNavigationBar: GestureDetector(
            onTap: () {
              GetXStorage().clearData();
              Get.offAllNamed(RoutesConstants.splash);
            },
            child: IntrinsicHeight(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 0.02.sh),
                child: Center(
                  child: Text(
                    StringConstants.logout,
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontFamily: StringConstants.poppins,
                        fontSize: 20.sp,
                        color: ColorConstants.c009696),
                  ),
                ),
              ),
            ),
          ),
          body: Container(
            margin: EdgeInsets.symmetric(horizontal: 0.04.sw),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 0.1.sh,
                ),
                Image.asset(ImageConstants.icLogo),
                SizedBox(
                  height: 0.05.sh,
                ),
                Text(
                  StringConstants.welcomeToItechnoLabs,
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontFamily: StringConstants.poppins,
                      fontSize: 34.sp,
                      color: ColorConstants.c009696),
                ),
                SizedBox(
                  height: 0.01.sh,
                ),
              ],
            ),
          )),
    );
  }
}
