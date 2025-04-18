import 'dart:async';
import 'dart:developer';
import 'dart:ui';
import 'package:fmlfantasy/app/app%20routes/app_routes.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends GetxController {
  late Timer timer;
  late String token;
  String? local;
  String? lang;

  @override
  void onInit() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token') ?? '';
    local = prefs.getString('local') ?? '';
    lang = Get.deviceLocale?.languageCode;
    log(lang.toString());
    if (local == '') {
      log('local is empty');
      if (lang != 'en' && lang != 'es') {
        Get.updateLocale(const Locale('en', ''));
      }
    } else {
      if (local == 'es') {
        Get.updateLocale(const Locale('es', ''));
      } else {
        Get.updateLocale(const Locale('en', ''));
      }
    }
    startTimer();

    super.onInit();
  }

  void startTimer() async {
    timer = Timer(const Duration(seconds: 3), () async {
      if (token == '' || token.isEmpty) {
        Get.offAllNamed(AppRoutes.registerUser);
      } else {
        Get.offAllNamed(AppRoutes.dashboardView);
      }
    });
  }

  @override
  void onClose() {
    timer.cancel();
    super.onClose();
  }
}
