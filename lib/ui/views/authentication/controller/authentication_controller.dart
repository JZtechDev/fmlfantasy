import 'dart:io' show Platform;
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/services/authentication_services.dart';
import 'package:fmlfantasy/ui/widgets/primary_button.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationController extends GetxController
    with GetTickerProviderStateMixin {
  final signupkey = GlobalKey<FormState>();
  final formKey = GlobalKey<FormState>();
  final otpkey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxBool remmberMe = false.obs;
  RxBool signAgree = false.obs;
  RxBool confirmAge = false.obs;
  RxBool loginForm = true.obs;
  RxBool isFormSelected = true.obs;
  late AnimationController animationController;
  late AnimationController logoAnimationController;
  late Animation<double> loginanimation;
  late Animation<double> signUPanimation;
  late Animation<double> player;
  late Animation<double> fadeAnimation;
  late Animation<Offset> slideAnimation;
  late Animation<Offset> slideAnimationlogo;
  late Animation<double> scaleAnimation;
  late Animation<Offset> positionAnimation;
  AuthenticationServices authenticationServices = AuthenticationServices();
  RxBool isLoading = false.obs;
  final RxBool isSigningUpLoading = false.obs;
  final signUpEmailController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  final postcodeController = TextEditingController();
  final cityController = TextEditingController();
  final dateController = TextEditingController();
  final monthController = TextEditingController();
  final yearController = TextEditingController();
  final otpController = TextEditingController();
  late double screenWidth;

  final detailSubmitKey = GlobalKey<FormState>();
  var countryValue = "".obs;

  TextEditingController forgetemailController = TextEditingController();

  @override
  void onInit() async {
    animations();
    SharedPreferences pref = await SharedPreferences.getInstance();
    emailController.text = pref.getString('rememberMeEmail') ?? "";
    passwordController.text = pref.getString('rememberMePassword') ?? "";
    var email = emailController.text;
    var password = passwordController.text;
    if (email.isNotEmpty && password.isNotEmpty) {
      remmberMe.value = true;
    }
    super.onInit();
  }

  void animations() {
    screenWidth = Get.width;
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    loginanimation = Tween<double>(
            begin: Get.height,
            end: screenWidth > 600 ? Get.height * 0.2 : Get.height * 0.25)
        .animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeInOut,
      ),
    );
    player = Tween<double>(begin: Get.height, end: Get.height * 0.2).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeInOut,
      ),
    );
    fadeAnimation = CurvedAnimation(
      parent: animationController,
      curve: Curves.easeIn,
    );
    slideAnimation = Tween<Offset>(
      begin: const Offset(1.0, 0.0),
      end: const Offset(0, 0.0),
    ).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.easeInOut,
    ));

    scaleAnimation = Tween<double>(
      begin: 1.5,
      end: 0.5,
    ).animate(CurvedAnimation(
        parent: animationController, curve: Curves.easeInOutCubicEmphasized));
    positionAnimation = Tween<Offset>(
      begin: const Offset(0.0, 0.0),
      end: Offset(0.0, -120.h),
    ).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.easeInOut,
    ));
    animationController.forward();
  }

  Future<void> doLogin() async {
    if (formKey.currentState!.validate()) {
      SharedPreferences pref = await SharedPreferences.getInstance();

      isLoading.value = true;
      bool loginSuccess = await authenticationServices.signIn(
          emailController.text, passwordController.text);
      if (loginSuccess == true) {
        if (remmberMe.value == true) {
          pref.setString('rememberMeEmail', emailController.text);
          pref.setString('rememberMePassword', passwordController.text);
        } else if (remmberMe.value == false) {
          pref.remove('rememberMeEmail');
          pref.remove('rememberMePassword');
        }
        isLoading.value = false;
        navigateToHome();
      } else {
        isLoading.value = false;
        // Get.snackbar('Error', 'Invalid email or password');
      }
    }
  }

  Future<bool> sendOTP() async {
    if (signupkey.currentState!.validate()) {
      isLoading.value = true;
      // ignore: unrelated_type_equality_checks
      if (signAgree == true) {
        bool sendOTPSuccess = await authenticationServices
            .sendEmailOTP(signUpEmailController.text);
        if (sendOTPSuccess) {
          isLoading.value = false;
          Get.offAllNamed(AppRoutes.otp, arguments: {
            'email': signUpEmailController.text,
          });
          return true;
        } else {
          isLoading.value = false;
          // Get.snackbar('Error', 'Invalid email');
          return false;
        }
      } else {
        isLoading.value = false;
        Get.snackbar('Error', 'Agree Terms And Condtions');
        return true;
      }
    } else {
      isLoading.value = false;
      return false;
    }
  }

  RxBool isObscure = true.obs;

  void toggleVisibility() {
    isObscure.value = !isObscure.value;
  }

  void navigateToHome() {
    Get.offAllNamed(AppRoutes.home);
  }

  @override
  void onClose() {
    //emailController.dispose();
    //passwordController.dispose();
    super.onClose();
  }

  void getWidgetBasedOnPlatform() {
    if (Platform.isIOS) {
    } else if (Platform.isAndroid) {}
  }

  RxBool ageConfirm = false.obs;
  var googleDetailList = Rx<GoogleSignInAccount?>(null);
  // ignore: prefer_typing_uninitialized_variables
  var googleToken;
  // ignore: prefer_typing_uninitialized_variables
  var googleId;
// ios
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    clientId:
        '239035793866-h00ch1m1om62fh0mikieajf73a37q9ic.apps.googleusercontent.com',
  );

  //android
  final GoogleSignIn _googleSignInAnd = GoogleSignIn();
  Future<void> googleLogin() async {
    try {
      if (ageConfirm.value == true) {
        if (Platform.isIOS) {
          var result = await _googleSignIn.signIn();
          if (result != null) {
            googleDetailList.value = result;
            googleId = result.id;
            final value = await googleDetailList.value?.authentication;
            googleToken = value?.accessToken;
            signInWithGoogleStoreData(googleToken, googleId);
          }
        } else if (Platform.isAndroid) {
          var result = await _googleSignInAnd.signIn();
          if (result != null) {
            googleDetailList.value = result;
            googleId = result.id;
            final value = await googleDetailList.value?.authentication;
            googleToken = value?.accessToken;
            signInWithGoogleStoreData(googleToken, googleId);
          }
        }
      } else {
        Get.snackbar('Error', 'Age should be 18+');
      }
    } catch (e) {
      throw 'ErrorGoog $e';
    }
  }

  Future<void> logout() async {
    await _googleSignIn.signOut();
  }

  Future<void> signInWithGoogleStoreData(var token, var id) async {
    bool success = await authenticationServices.signInWithGooglePostData(
        token, 'google', id);
    if (success) {
      navigateToHome();
    }
  }

  void showDialog(BuildContext context) {
    Get.defaultDialog(
      backgroundColor: AppColors.grey,
      contentPadding: EdgeInsets.only(top: 10.h),
      title: 'Warning',
      titlePadding: EdgeInsets.only(top: 10.h),
      titleStyle: globalTextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
      content: Padding(
        padding: EdgeInsets.only(left: 10.w, right: 10.w),
        child: SizedBox(
          height: Get.height * 0.11,
          width: Get.width,
          child: Column(
            children: [
              Row(
                children: [
                  Obx(
                    () => GestureDetector(
                      onTap: () {
                        ageConfirm.value = !ageConfirm.value;
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.r),
                          border: Border.all(
                            color: AppColors.borderColor,
                            width: 1,
                          ),
                          color: ageConfirm.value
                              ? AppColors.primary
                              : AppColors.white,
                        ),
                        child: Center(
                            child: Icon(
                          Icons.check,
                          color: AppColors.white,
                          size: 15.w,
                        )),
                      ),
                    ),
                  ),
                  horizontalSpace(10.w),
                  Center(
                    child: Text(
                      'I Confirm I’m Above the age of 18',
                      style: globalTextStyle(
                          fontSize: 12.sp,
                          color: AppColors.textGray,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
              verticalSpace(15.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: PrimaryButton(
                      buttonText: 'Back',
                      onPressed: () {
                        logout();
                      },
                      isEnabled: true,
                      padding: 0,
                    ),
                  ),
                  horizontalSpace(5.w),
                  Expanded(
                    child: PrimaryButton(
                      buttonText: 'Confirm',
                      onPressed: () {
                        googleLogin();
                      },
                      isEnabled: true,
                      padding: 0,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
