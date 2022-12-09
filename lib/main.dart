import 'dart:async';

import 'package:demo/constants/routes_constants.dart';
import 'package:demo/ui/other/dash_board_screen.dart';
import 'package:demo/ui/other/forgot_password_screen.dart';
import 'package:demo/ui/other/login_screen.dart';
import 'package:demo/ui/other/otp_screen.dart';
import 'package:demo/ui/other/register_screen.dart';
import 'package:demo/ui/other/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) async {
    await GetStorage.init();
    runZonedGuarded(() {
      runApp(const MyApp());
    }, (error, stackTrace) {});
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: RoutesConstants.splash,
          getPages: [
            GetPage(
                name: RoutesConstants.splash, page: () => const SplashScreen()),
            GetPage(
                name: RoutesConstants.loginScreen, page: () => LoginScreen()),
            GetPage(
                name: RoutesConstants.registerScreen,
                page: () => const RegisterScreen()),
            GetPage(
                name: RoutesConstants.forgotPasswordScreen,
                page: () => const ForgotPasswordScreen()),
            GetPage(name: RoutesConstants.otpScreen, page: () => OtpScreen()),
            GetPage(
                name: RoutesConstants.dashBoardScreen,
                page: () => DashBoardScreen()),
          ],
        );
      },
    );
  }
}
