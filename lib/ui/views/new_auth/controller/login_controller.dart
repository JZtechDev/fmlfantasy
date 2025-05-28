import 'dart:developer';

import 'package:fmlfantasy/app/app_sizings.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/services/authentication_services.dart';
import 'package:fmlfantasy/ui/widgets/primary_button.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:local_auth/local_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AuthenticationServices authenticationServices = AuthenticationServices();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController savedEmailController = TextEditingController();
  TextEditingController savedPasswordController = TextEditingController();
  bool _isLoading = false;

  RxString showDob = ''.obs;

  bool _isAgreed = false;

  bool get isAgreed => _isAgreed;

  set isAgreed(bool value) {
    _isAgreed = value;
    update();
  }

  bool _isBiometricEnabled = false;

  bool get isBiometricEnabled => _isBiometricEnabled;

  set isBiometricEnabled(bool value) {
    _isBiometricEnabled = value;
    update();
  }

  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    update();
  }

  Future<void> doLogin() async {
    if (formKey.currentState!.validate()) {
      SharedPreferences pref = await SharedPreferences.getInstance();

      isLoading = true;
      bool loginSuccess = await authenticationServices.signIn(
          emailController.text, passwordController.text);
      if (loginSuccess == true) {
        if (isBiometricEnabled) {
          //authenticateUser();
          navigateToHome();
        } else {
          Get.dialog(Dialog(
              backgroundColor: AppColors.white,
              surfaceTintColor: AppColors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(mainAxisSize: MainAxisSize.min, children: [
                    Text(
                      'Do you want to enable biometric authentication?',
                      style: globalTextStyle(
                          fontSize:
                              AppSizing.isMobile(Get.context!) ? 18.sp : 12.sp),
                    ),
                    verticalSpace(10.h),
                    Row(
                      children: [
                        Expanded(
                          child: PrimaryButton(
                            buttonText: 'Yes',
                            onPressed: () async {
                              pref.setBool('isBiometricEnabled', true);
                              pref.setString(
                                  'rememberMeEmail', emailController.text);
                              pref.setString('rememberMePassword',
                                  passwordController.text);
                              isLoading = false;
                              navigateToHome();
                            },
                            isEnabled: true,
                          ),
                        ),
                        Expanded(
                          child: PrimaryButton(
                            buttonText: 'No',
                            onPressed: () async {
                              pref.setBool('isBiometricEnabled', false);
                              pref.setString('rememberMeEmail', '');
                              pref.setString('rememberMePassword', '');
                              navigateToHome();
                              isLoading = false;
                            },
                            isEnabled: true,
                            backgroundColor: AppColors.errorRed,
                          ),
                        ),
                      ],
                    )
                  ]))));
        }
        isLoading = false;
        //navigateToHome();
      } else {
        isLoading = false;
      }
    }
  }

  @override
  void onInit() async {
    super.onInit();
    SharedPreferences pref = await SharedPreferences.getInstance();
    savedEmailController.text = pref.getString('rememberMeEmail') ?? "";
    savedPasswordController.text = pref.getString('rememberMePassword') ?? "";
    isBiometricEnabled = pref.getBool('isBiometricEnabled') ?? false;
    log(isBiometricEnabled.toString());
    log(savedEmailController.text);
    log(savedPasswordController.text);

    final DateTime now = DateTime.now();
    final DateTime initialDate = DateTime(now.year - 18, now.month, now.day);

    showDob.value = DateFormat('dd MMM yyyy').format(initialDate);
  }

  void navigateToHome() {
    Get.offAllNamed(AppRoutes.dashboardView);
  }

  final _localAuthentication = LocalAuthentication();
  bool _isUserAuthorized = false;

  bool get isUserAuthorized => _isUserAuthorized;

  set isUserAuthorized(bool value) {
    _isUserAuthorized = value;
    update();
  }

  final LocalAuthentication localAuthentication = LocalAuthentication();

  Future<void> authenticateUser() async {
    bool isAuthorized = false;
    try {
      // Check if the device has biometric authentication enabled
      bool canCheckBiometrics = await _localAuthentication.canCheckBiometrics;
      if (canCheckBiometrics) {
        log('Biometrics are available');
      } else {
        log('Biometrics are not available on this device');
        return;
      }

      // Authenticate using biometrics (fingerprint, face ID, etc.)
      isAuthorized = await _localAuthentication.authenticate(
        localizedReason: 'Please authenticate to access your account',
        options: const AuthenticationOptions(
          biometricOnly: true,
          stickyAuth: true,
        ),
      );

      if (isAuthorized) {
        bool loginSuccess = await authenticationServices.signIn(
            savedEmailController.text, savedPasswordController.text);
        if (loginSuccess == true) {
          isLoading = false;
          navigateToHome();
        } else {
          isLoading = false;
        }
      } else {
        log('User authentication failed');
      }
    } on PlatformException catch (e) {
      log('Error during biometric authentication: $e');
      if (e.code == 'notAvailable' || e.code == 'passcodeNotSet') {
        log('Biometric authentication is not available or passcode not set');
      }
    } catch (e) {
      log('Error: $e');
    }
  }

  Future<void> pickDateOfBirth(BuildContext context) async {
    final DateTime now = DateTime.now();
    final DateTime initialDate = DateTime(now.year - 18, now.month, now.day);
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now().add(const Duration(days: 365 * 100)),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Color.fromRGBO(44, 86, 80, 1),
              onPrimary: Colors.white,
              surface: Color.fromRGBO(55, 132, 121, 1),
            ),
            textTheme: const TextTheme(
              headlineMedium: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: AppColors.white,
              ),
              bodyMedium: TextStyle(
                fontSize: 16.0,
                color: AppColors.white,
              ),
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: Colors.white, // Button text color
                textStyle: const TextStyle(
                    fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    if (pickedDate != null) {
      showDob.value = DateFormat('yyyy-MM-dd').format(pickedDate);
    }
  }
}
