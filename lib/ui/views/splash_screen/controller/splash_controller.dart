import 'dart:async';
import 'dart:developer';
import 'dart:ui';
import 'package:fmlfantasy/app/app%20routes/app_routes.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:video_player/video_player.dart';

class SplashController extends GetxController {
  late Timer timer;
  late String token;
  String? local;
  String? lang;
  late VideoPlayerController videoPlayerController;
  final RxBool isVideoInitialized = false.obs; // Reactive flag

  @override
  void onInit() async {
    super.onInit();
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

    videoPlayerController =
        VideoPlayerController.asset('assets/new_images/Fml-SPLASH-4sec.mp4')
          ..initialize().then((_) {
            videoPlayerController.setLooping(true);
            videoPlayerController.setVolume(0);
            videoPlayerController.play();
            isVideoInitialized.value = true; // Set flag when initialized
          }).catchError((error) {
            log('VideoPlayer initialization failed: $error');
            isVideoInitialized.value = false; // Handle error case
          });
  }

  void startTimer() async {
    timer = Timer(const Duration(seconds: 4), () async {
      if (token == '' || token.isEmpty) {
        Get.offAllNamed(AppRoutes.registerUser);
      } else {
        Get.offAllNamed(AppRoutes.dashboardView);
      }
    });
  }

  @override
  void onClose() {
    videoPlayerController.dispose();
    timer.cancel();
    super.onClose();
  }
}
