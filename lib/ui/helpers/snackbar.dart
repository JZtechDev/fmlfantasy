import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/imports/imports.dart';

abstract final class Snackbars {
  static void success(String message) {
    Get.snackbar(
      'Success',
      message,
      backgroundColor: Colors.green,
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  static void error(String message) {
    Get.snackbar(
      'Error',
      message,
      backgroundColor: AppColors.errorRed,
      colorText: Colors.white,
      snackPosition: SnackPosition.TOP,
    );
  }

  static void somethingWentWrong() {
    error('Something went wrong');
  }

  static void expiredSession() {
    error('Your session has expired, please login again');
  }

  static void warning(String message) {
    Get.snackbar(
      '',
      '',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: AppColors.primary,
      colorText: Colors.white,
      titleText: const SizedBox.shrink(),
      messageText: Text(
        message,
        style: globalTextStyle(color: Colors.white, fontSize: 14.sp),
      ),
    );
  }

  static void warningWithTitle(String title, String message) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: AppColors.primary,
      colorText: Colors.white,
    );
  }
}
