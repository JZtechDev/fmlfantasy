import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthSuccessController extends GetxController {
  late String token;

  @override
  void onInit() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token') ?? '';
    super.onInit();
  }

  void redirectToHome() {
    if (token != '') {
      Get.offAllNamed(AppRoutes.home);
    } else {
      Get.snackbar('error', 'Not Registered yet');
    }
  }
}
