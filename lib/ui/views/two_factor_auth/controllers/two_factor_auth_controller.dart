import 'dart:async';

import 'package:fmlfantasy/app/app_sizings.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:pinput/pinput.dart';

class TwoFactorAuthController extends GetxController {
  TextEditingController otpController = TextEditingController();
  //RegisterNewController registerNewController = RegisterNewController();
  bool _terms = false;

  String staticOtp = '000000';

  bool get terms => _terms;

  set terms(bool value) {
    _terms = value;
    update();
  }

  void toggleTerms() {
    terms = !terms;
    update();
  }

  String _phoneNumber = '';

  String get phoneNumber => _phoneNumber;

  set phoneNumber(String value) {
    _phoneNumber = value;
    update();
  }

  static const borderColor = AppColors.white;
  Color focusedBorderColor = AppColors.borderColor;
  final focusNode = FocusNode();
  RxBool resenOtp = false.obs;
  RxInt countdown = 25.obs;
  Timer? _timer;
  RxString errorMessage = ''.obs;

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (countdown > 0) {
        countdown.value--;
      } else {
        _timer!.cancel();
        resenOtp.value = false;
      }
    });
  }

  void handleResend() {
    resenOtp.value = true;
    countdown.value = 30;
    startTimer();
    // Simulate sending the opt-in text here
    // You can replace this with your actual logic
  }

  Future<void> resendOTP() async {}
  final defaultPinTheme = PinTheme(
    width: 80,
    height: 65,
    textStyle: globalTextStyle(
      fontSize: AppSizing.isMobile(Get.context!) ? 18.sp : 12.sp,
      color: AppColors.dark,
    ),
    decoration: BoxDecoration(
      color: AppColors.grey,
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: borderColor),
    ),
  );
}
