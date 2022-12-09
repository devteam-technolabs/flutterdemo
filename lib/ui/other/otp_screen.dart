import 'package:demo/constants/routes_constants.dart';
import 'package:demo/controller/otp_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import '../../constants/color_constants.dart';
import '../../constants/string_constant.dart';

class OtpScreen extends StatelessWidget {
  OtpScreen({super.key});

  var controller = Get.put(OtpController());

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
            GetBuilder<OtpController>(
              init: OtpController(),
              // intialize with the Controller
              builder: (value) => Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 0.04.sw),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 0.2.sh,
                        ),
                        Center(
                          child: Text(
                            StringConstants.enterOTP,
                            style: TextStyle(
                                fontSize: 24.sp,
                                color: Colors.black,
                                fontFamily: StringConstants.poppins,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        SizedBox(
                          height: 0.01.sh,
                        ),
                        Container(
                          child: Text(
                            textAlign: TextAlign.center,
                            StringConstants.enterOTPDes,
                            style: TextStyle(
                                fontSize: 13.sp,
                                color: ColorConstants.c748383,
                                fontFamily: StringConstants.poppins),
                          ),
                        ),
                        SizedBox(
                          height: 0.04.sh,
                        ),
                        OTPTextField(
                          length: 4,
                          width: MediaQuery.of(context).size.width,
                          fieldWidth: 50,
                          style: TextStyle(
                              fontSize: 17.sp, color: ColorConstants.c009696),
                          textFieldAlignment: MainAxisAlignment.spaceAround,
                          fieldStyle: FieldStyle.box,
                          outlineBorderRadius: 10,
                          onCompleted: (pin) {
                            controller.otpPin.value = pin;
                          },
                          onChanged: (pin) {
                            controller.otpPin.value = pin;
                          },
                        ),
                        SizedBox(
                          height: 0.02.sh,
                        ),
                        Container(
                          width: 1.sw,
                          margin: EdgeInsets.symmetric(vertical: 0.02.sh),
                          child: ElevatedButton(
                            onPressed: () {
                              Get.offAllNamed(RoutesConstants.loginScreen);
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
                        SizedBox(
                          height: 0.02.sh,
                        ),
                        Center(
                          child: CountdownTimer(
                            controller: controller.countdownTimerController,
                            onEnd: controller.onEnd,
                            widgetBuilder: (context, time) {
                              if (time == null) {
                                return Align(
                                  alignment: Alignment.topCenter,
                                  child: InkWell(
                                    onTap: () {
                                      controller.resendOtp();
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(StringConstants.didGetOTP,
                                              style: TextStyle(
                                                  fontFamily:
                                                      StringConstants.poppins,
                                                  fontSize: 16.sp,
                                                  color: Colors.black)),
                                          Text(
                                            StringConstants.resend,
                                            style: TextStyle(
                                                fontFamily:
                                                    StringConstants.poppins,
                                                fontSize: 16.sp,
                                                color: ColorConstants.c009696),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }
                              return Center(
                                child: Text(
                                  time.sec! >= 10
                                      ? 'Resend OTP in : ${time.sec} '
                                          "seconds"
                                      : 'Resend OTP in : 0${time.sec} seconds',
                                  style: TextStyle(
                                      fontFamily: StringConstants.poppins,
                                      fontSize: 14.sp,
                                      color: ColorConstants.c009696,
                                      fontWeight: FontWeight.w700),
                                ),
                              );
                            },
                            endTime: controller.endTime,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
