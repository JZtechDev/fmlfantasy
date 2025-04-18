import 'dart:async';

import 'package:fmlfantasy/app/app_sizings.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/services/authentication_services.dart';
import 'package:fmlfantasy/ui/views/new_auth/controller/register_controller.dart';
import 'package:fmlfantasy/ui/views/two_factor_auth/widgets/two_factor_intro.dart';
import 'package:pinput/pinput.dart';

class OtpController extends GetxController {
  final RegisterNewController controller = Get.find();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController otpController = TextEditingController();
  AuthenticationServices authenticationServices = AuthenticationServices();
  String email = Get.arguments['email'];
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

  Future<bool> signUp() async {
    try {
      // Attempt to verify the OTP
      bool otpVerified =
          await authenticationServices.emailCheck(email, otpController.text);

      if (otpVerified) {
        Get.snackbar('Success', 'OTP verified successfully');
        controller.otpController.text = otpController.text;
        Get.off(() => const TwoFactorIntro());
        return true;
      } else {
        // If the OTP verification fails, show an error message
        errorMessage.value = 'Invalid Verification Code';
        return false;
      }
    } catch (e) {
      errorMessage.value = 'An error occurred $e';
      return false;
    }
  }

  void setErrorMessage(String message) {
    errorMessage.value = message;

    // Clear the error message after 3 seconds
    if (message.isNotEmpty) {
      Timer(const Duration(seconds: 3), () {
        errorMessage.value = '';
      });
    }
  }

  Future<void> resendOTP() async {
    bool sendOTPSuccess = await authenticationServices.sendEmailOTP(email);
    if (sendOTPSuccess == true) {
      Get.snackbar('Success', 'OTP sent successfully');
      handleResend();
    } else {
      Get.snackbar('Error', 'Failed to send OTP');
    }
  }

  final defaultPinTheme = PinTheme(
    width: 80,
    height: 65,
    textStyle: globalTextStyle(
      fontSize: AppSizing.isMobile(Get.context!) ? 18.sp : 14.sp,
      color: AppColors.dark,
    ),
    decoration: BoxDecoration(
      color: AppColors.grey,
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: borderColor),
    ),
  );
  @override
  void onInit() {
    handleResend();
    super.onInit();
  }
}
