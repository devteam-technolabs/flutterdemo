import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../constants/color_constants.dart';
import 'package:flutter_svg/svg.dart';
import '../../constants/image_constants.dart';
import '../../constants/routes_constants.dart';
import '../../constants/string_constant.dart';
import '../../controller/login_controller.dart';

class LoginScreen extends StatelessWidget {
  final controller = Get.put(LoginController());

  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          bottomNavigationBar: GestureDetector(
            onTap: () {
              Get.toNamed(RoutesConstants.registerScreen);
            },
            child: IntrinsicHeight(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 0.02.sh),
                child: Center(
                  child: RichText(
                      text: TextSpan(
                    text: StringConstants.donTHaveAnAccount,
                    style: TextStyle(
                        fontSize: 13.sp,
                        fontFamily: StringConstants.poppins,
                        color: ColorConstants.c748383),
                    children: <TextSpan>[
                      const TextSpan(text: " "),
                      TextSpan(
                          text: StringConstants.register,
                          style: TextStyle(
                              fontFamily: StringConstants.poppins,
                              fontSize: 13.sp,
                              color: ColorConstants.c009696)),
                    ],
                  )),
                ),
              ),
            ),
          ),
          body: Stack(
            children: [
              GetBuilder<LoginController>(
                  init: LoginController(),
                  builder: (value) => SingleChildScrollView(
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 0.04.sw),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 0.2.sh,
                              ),
                              Text(
                                StringConstants.login,
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
                                controller: controller.emailEditingController,
                                decoration: InputDecoration(
                                  hintText: StringConstants.demoLoginEmailId,
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: ColorConstants.c173636
                                            .withOpacity(0.40)),
                                  ),
                                  focusedBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: ColorConstants.c009696),
                                  ),
                                  labelStyle: TextStyle(
                                      color: ColorConstants.c173636
                                          .withOpacity(0.60),
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
                                controller:
                                    controller.passwordEditingController,
                                focusNode: controller.focusNodes[1],
                                obscureText: controller.isPasswordShow.value,
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    color: ColorConstants.c173636,
                                    fontFamily: StringConstants.poppins),
                                keyboardType: TextInputType.visiblePassword,
                                decoration: InputDecoration(
                                  hintText: StringConstants.demoPassword,
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: ColorConstants.c173636
                                            .withOpacity(0.40)),
                                  ),
                                  focusedBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: ColorConstants.c009696),
                                  ),
                                  labelStyle: TextStyle(
                                      color: ColorConstants.c173636
                                          .withOpacity(0.60),
                                      fontFamily: StringConstants.poppins),
                                  contentPadding:
                                      const EdgeInsets.symmetric(horizontal: 0),
                                  suffixIcon: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 15, 4, 15),
                                    child: GestureDetector(
                                      onTap: controller.toggleObscured,
                                      child: controller.isPasswordShow.value
                                          ? SvgPicture.asset(
                                              ImageConstants.icEyeOpen,
                                            )
                                          : SvgPicture.asset(
                                              ImageConstants.icEyeClose),
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
                              Align(
                                alignment: Alignment.topRight,
                                child: InkWell(
                                  onTap: () {
                                    Get.toNamed(
                                        RoutesConstants.forgotPasswordScreen);
                                  },
                                  child: Text(
                                    StringConstants.forgotPassword,
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        color: ColorConstants.c009696),
                                  ),
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
                                    controller.validateFields(context);
                                  },
                                  // style: ButtonStyle(elevation: MaterialStateProperty(12.0 )),
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          12), // <-- Radius
                                    ),
                                    elevation: 2,
                                    backgroundColor: ColorConstants.c009696,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 18),
                                  ),
                                  child: Text(
                                    StringConstants.login,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: StringConstants.poppins,
                                        fontSize: 16.sp),
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  const Expanded(
                                      child: Divider(
                                          color: ColorConstants.c748383)),
                                  Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 0.02.sw),
                                    child: Text(
                                      StringConstants.or,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontFamily: StringConstants.poppins,
                                          fontSize: 12.sp,
                                          color: ColorConstants.c748383),
                                    ),
                                  ),
                                  const Expanded(
                                      child: Divider(
                                          color: ColorConstants.c748383)),
                                ],
                              ),
                              SizedBox(
                                height: 0.02.sh,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 0.015.sh,
                                          horizontal: 0.08.sw),
                                      decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(10.0)),
                                          border: Border.all(
                                            color: ColorConstants.c009696
                                                .withOpacity(0.33),
                                            width: 1,
                                          )),
                                      child: Center(
                                        child: Image.asset(
                                          ImageConstants.icGoogle,
                                          height: 25,
                                          width: 25,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 0.05.sw,
                                  ),
                                  Expanded(
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 0.015.sh,
                                          horizontal: 0.08.sw),
                                      decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(10.0)),
                                          border: Border.all(
                                            color: ColorConstants.c009696
                                                .withOpacity(0.33),
                                            width: 1,
                                          )),
                                      child: Center(
                                        child: Image.asset(
                                          ImageConstants.icFb,
                                          height: 25,
                                          width: 25,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 0.05.sw,
                                  ),
                                  Expanded(
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 0.015.sh,
                                          horizontal: 0.08.sw),
                                      decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(10.0)),
                                          border: Border.all(
                                            color: ColorConstants.c009696
                                                .withOpacity(0.33),
                                            width: 1,
                                          )),
                                      child: Center(
                                        child: Image.asset(
                                          ImageConstants.icApple,
                                          height: 25,
                                          width: 25,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      )),
              Obx(() => controller.isLoading.value
                  ? const AbsorbPointer(
                      child: Center(
                        child: CircularProgressIndicator(
                          color: ColorConstants.c009696,
                        ),
                      ),
                    )
                  : Container()),
            ],
          )),
    );
  }
}
