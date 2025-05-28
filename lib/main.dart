import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fmlfantasy/app/app%20pages/app_pages.dart';
import 'package:fmlfantasy/app/app%20routes/app_routes.dart';
import 'package:fmlfantasy/app/app_colors/app_colors.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/config/global_instances.dart';
import 'package:fmlfantasy/core/languages.dart';
import 'package:fmlfantasy/error_widget.dart';
import 'package:fmlfantasy/ui/views/splash_screen/controller/splash_controller.dart';
import 'package:get/get.dart';
import 'package:local_session_timeout/local_session_timeout.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(SplashController());

  ErrorWidget.builder = (FlutterErrorDetails details) {
    return ErrorWidgetPage(details);
  };

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  ResponsiveSizingConfig.instance.setCustomBreakpoints(
    const ScreenBreakpoints(desktop: 900, tablet: 550, watch: 200),
  );
  dio.interceptors.add(PrettyDioLogger());
  dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: false,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: 90));

  EasyLoading.instance
    ..textStyle = globalTextStyle(fontSize: 12, color: Colors.white)
    ..loadingStyle = EasyLoadingStyle.custom
    ..backgroundColor = AppColors.primary
    ..radius = 12
    ..indicatorSize = 30
    ..textColor = Colors.white
    ..indicatorColor = Colors.white
    ..userInteractions = false
    ..displayDuration = const Duration(seconds: 1)
    ..dismissOnTap = false;

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final sessionConfig = SessionConfig(
        invalidateSessionForAppLostFocus: const Duration(minutes: 15),
        invalidateSessionForUserInactivity: const Duration(minutes: 15));

    sessionConfig.stream.listen((SessionTimeoutState timeoutEvent) async {
      if (timeoutEvent == SessionTimeoutState.userInactivityTimeout) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.remove('token');
        Get.offAllNamed(AppRoutes.loginView);
      } else if (timeoutEvent == SessionTimeoutState.appFocusTimeout) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.remove('token');
        Get.offAllNamed(AppRoutes.loginView);
      }
    });

    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      useInheritedMediaQuery: false,
      builder: (context, child) => GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () => FocusScope.of(context).unfocus(),
        child: SessionTimeoutManager(
          sessionConfig: sessionConfig,
          child: GetMaterialApp(
            translations: CustomTranslations(),
            defaultTransition: Transition.fadeIn,
            locale: Get.deviceLocale,
            supportedLocales: const [
              Locale('en', ''),
              Locale('es', ''),
            ],
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            initialRoute: AppPages.initial,
            getPages: AppPages.routes,
            builder: EasyLoading.init(),
            title: 'FML Fantasy',
            debugShowCheckedModeBanner: false,
            themeMode: ThemeMode.light,
            theme: ThemeData(
              primaryColor: AppColors.primary,
              primarySwatch: AppColors.primarySwatch,
              appBarTheme: AppBarTheme(
                surfaceTintColor: AppColors.primary,
                backgroundColor: AppColors.primary,
                elevation: 0,
                centerTitle: true,
                titleTextStyle: globalTextStyle(
                  fontSize: 14.sp,
                ),
              ),
              scaffoldBackgroundColor: AppColors.backgroud,
            ),
          ),
        ),
      ),
    );
  }
}
