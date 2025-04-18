import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/services/authentication_services.dart';

class ForgetPasswordController extends GetxController
    with GetSingleTickerProviderStateMixin {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  GlobalKey<FormState> confrimFormKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  AuthenticationServices authenticationServices =
      Get.put(AuthenticationServices());
  RxBool passwordObscure = true.obs;
  RxBool confrimPasswordObscure = true.obs;

  // late AnimationController animationController;
  // late Animation<double> scaleAnimation;

  // @override
  // void onInit() {
  //   animationController = AnimationController(
  //       vsync: this, duration: const Duration(milliseconds: 700));
  //   scaleAnimation =
  //       Tween<double>(begin: 0.0, end: 1.0).animate(animationController);
  //   animationController.forward();
  //   super.onInit();
  // }

  Future<void> forgetPasswordWithEmail() async {
    if (formKey.currentState!.validate()) {
      bool success = await authenticationServices
          .forgetPasswordSendEmail(emailController.text);
      if (success) {
        Get.offAllNamed(AppRoutes.confirmPasswordView);
        Get.snackbar('Success', 'Email sent successfully');
      } else {
        Get.snackbar('Error', 'Failed to send email');
      }
    }
  }

  Future<void> newPassword() async {
    if (confrimFormKey.currentState!.validate()) {
      bool success = await authenticationServices.confirmPasswod(
        otpController.text,
        passwordController.text,
        confirmPasswordController.text,
        emailController.text,
      );
      if (success) {
        Get.snackbar('Success', 'Password changed successfully');
        Get.offAllNamed(AppRoutes.authentication);
        emailController.clear();
        otpController.clear();
        passwordController.clear();
        confirmPasswordController.clear();
      } else {
        Get.snackbar('Error', 'Failed to change password');
      }
    }
  }

  void toggleVisibilityPassword() {
    passwordObscure.value = !passwordObscure.value;
  }

  void toggleVisibilityConfirmPassword() {
    confrimPasswordObscure.value = !confrimPasswordObscure.value;
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    otpController.dispose();
    super.onClose();
  }
}
