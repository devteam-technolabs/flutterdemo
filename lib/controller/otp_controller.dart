import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
import 'package:get/get.dart';

class OtpController extends GetxController {

  var otpPin = "".obs;
  late CountdownTimerController countdownTimerController;
  int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 30;

  @override
  void onInit() {
    countdownTimerController = CountdownTimerController(
        endTime: DateTime.now().millisecondsSinceEpoch + 1000 * 30,
        onEnd: onEnd);
    super.onInit();
  }

  void onEnd() {}

  void resendOtp() {
    int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 30;
    countdownTimerController =
        CountdownTimerController(endTime: endTime, onEnd: onEnd);
    countdownTimerController.start();
    update();
  }
}
