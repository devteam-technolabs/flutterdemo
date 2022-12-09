import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../constants/color_constants.dart';
import '../../constants/routes_constants.dart';
import '../../constants/string_constant.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(0.04.sw),
                child: InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: const Icon(Icons.arrow_back_ios_new)),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 0.04.sw),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 0.2.sh,
                        ),
                        Text(
                          StringConstants.forgotPasswordText,
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontFamily: StringConstants.poppins,
                              fontSize: 30.sp,
                              color: Colors.black),
                        ),
                        SizedBox(
                          height: 0.05.sh,
                        ),
                        TextField(
                          style: TextStyle(
                              fontSize: 16.sp,
                              color: ColorConstants.c173636,
                              fontFamily: StringConstants.poppins),
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color:
                                      ColorConstants.c173636.withOpacity(0.40)),
                            ),
                            focusedBorder: const UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: ColorConstants.c009696),
                            ),
                            labelStyle: TextStyle(
                                color: ColorConstants.c173636.withOpacity(0.60),
                                fontFamily: StringConstants.poppins),
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 0),
                            floatingLabelStyle: TextStyle(
                                color: ColorConstants.c748383,
                                fontSize: 16.sp,
                                fontFamily: StringConstants.poppins),
                            labelText: StringConstants.email,
                            fillColor: Colors.white,
                            filled: true,
                          ),
                        ),
                        SizedBox(
                          height: 0.02.sh,
                        ),
                        Container(
                          width: 1.sw,
                          margin: EdgeInsets.symmetric(vertical: 0.02.sh),
                          child: ElevatedButton(
                            onPressed: () {
                              Get.toNamed(RoutesConstants.otpScreen);
                            },
                            // style: ButtonStyle(elevation: MaterialStateProperty(12.0 )),
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(12), // <-- Radius
                              ),
                              elevation: 2,
                              backgroundColor: ColorConstants.c009696,
                              padding: const EdgeInsets.symmetric(vertical: 18),
                            ),
                            child: Text(
                              StringConstants.submit,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: StringConstants.poppins,
                                  fontSize: 16.sp),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
