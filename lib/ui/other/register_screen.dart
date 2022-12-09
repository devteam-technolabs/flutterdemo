import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../constants/color_constants.dart';
import 'package:flutter_svg/svg.dart';
import '../../constants/image_constants.dart';
import '../../constants/string_constant.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

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
                          height: 0.1.sh,
                        ),
                        Text(
                          StringConstants.register,
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontFamily: StringConstants.poppins,
                              fontSize: 34.sp,
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
                            labelText: StringConstants.name,
                            fillColor: Colors.white,
                            filled: true,
                          ),
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
                          height: 0.05.sh,
                        ),
                        TextField(
                          style: TextStyle(
                              fontSize: 16.sp,
                              color: ColorConstants.c173636,
                              fontFamily: StringConstants.poppins),
                          keyboardType: TextInputType.visiblePassword,
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
                            suffixIcon: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 15, 4, 15),
                              child: GestureDetector(
                                child:
                                    SvgPicture.asset(ImageConstants.icEyeClose),
                              ),
                            ),
                            floatingLabelStyle: TextStyle(
                                color: ColorConstants.c748383,
                                fontSize: 16.sp,
                                fontFamily: StringConstants.poppins),
                            labelText: StringConstants.password,
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
                              StringConstants.register,
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
              )
            ],
          )),
    );
  }
}
