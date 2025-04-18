import 'dart:developer';

import 'package:fmlfantasy/app/app_sizings.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/model/signup_model.dart';
import 'package:fmlfantasy/services/authentication_services.dart';
import 'package:fmlfantasy/ui/views/kyc/views/kyc_view.dart';
import 'package:fmlfantasy/ui/views/two_factor_auth/controllers/two_factor_auth_controller.dart';
import 'package:country_picker/country_picker.dart';

class RegisterNewController extends GetxController {
  AuthenticationServices authenticationServices = AuthenticationServices();
  TwoFactorAuthController twoFactorAuthController =
      Get.put(TwoFactorAuthController());
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  GlobalKey<FormState> basicInfoFormKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  String _selectedcountryName = '';
  String get selectedcountryName => _selectedcountryName;
  var countryCode =
      CountryParser.parseCountryCode('PK').obs; // Observable Country

  set setSelectedcountryName(String value) {
    _selectedcountryName = value;
    update();
  }

  bool _isCountryValidation = false;

  bool get isCountryValidation => _isCountryValidation;

  set isCountryValidation(bool value) {
    _isCountryValidation = value;
    update();
  }

  bool _isObscure = true;

  bool get isObscure => _isObscure;

  set isObscure(bool value) {
    _isObscure = value;
    update();
  }

  void toggleVisibility() {
    isObscure = !isObscure;
  }

  bool _hasUppercase = false;

  bool get hasUppercase => _hasUppercase;

  set hasUppercase(bool value) {
    _hasUppercase = value;
    update();
  }

  bool _hasLowercase = false;

  bool get hasLowercase => _hasLowercase;

  set hasLowercase(bool value) {
    _hasLowercase = value;
    update();
  }

  bool _hasSpecialChar = false;

  bool get hasSpecialChar => _hasSpecialChar;

  set hasSpecialChar(bool value) {
    _hasSpecialChar = value;
    update();
  }

  bool _hasNumber = false;

  bool get hasNumber => _hasNumber;

  set hasNumber(bool value) {
    _hasNumber = value;
    update();
  }

  bool _hasMinLength = false;

  bool get hasMinLength => _hasMinLength;

  set hasMinLength(bool value) {
    _hasMinLength = value;
    update();
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    update();
  }

  void checkPassword(String value) {
    hasUppercase = RegExp(r'[A-Z]').hasMatch(value);
    hasLowercase = RegExp(r'[a-z]').hasMatch(value);
    hasSpecialChar = RegExp(r'[!@#\$&*~]').hasMatch(value);
    hasNumber = RegExp(r'[0-9]').hasMatch(value);
    hasMinLength = value.length >= 8;
    update();
  }

  Future<void> postData() async {
    isLoading = true;
    bool success = await submitDetails();
    if (success) {
      log(success.toString());
      Get.offAll(() => const KYCView());
      isLoading = false;
    } else {
      isLoading = false;
    }
  }

  Future<bool> submitDetails() async {
    log(twoFactorAuthController.phoneNumber.toString());
    Map<String, dynamic> detailPost() {
      SignUpLiveDTO saveDetails = SignUpLiveDTO(
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        mobile: twoFactorAuthController.phoneNumber.toString(),
        country: countryCode.value.countryCode.toString(),
        email: emailController.text,
        password: passwordController.text,
        confirmPassword: passwordController.text,
        twSid: '',
        codes: ['', otpController.text],
        pid: '',
      );
      return saveDetails.toJson();
    }

    return authenticationServices.signUp(detailPost());
  }

  Future<bool> sendOTP() async {
    if (formKey.currentState!.validate()) {
      isLoading = true;
      // ignore: unrelated_type_equality_checks
      bool sendOTPSuccess =
          await authenticationServices.sendEmailOTP(emailController.text);
      if (sendOTPSuccess) {
        isLoading = false;
        Get.offNamed(AppRoutes.otp, arguments: {
          'email': emailController.text,
        });
        return true;
      } else {
        isLoading = false;
        // Get.snackbar('Error', 'Invalid email');
        return false;
      }
    } else {
      isLoading = false;
      return false;
    }
  }

  Future<void> selectCountry(BuildContext context) async {
    showCountryPicker(
        context: context,
        countryListTheme: CountryListThemeData(
          flagSize: 25,
          backgroundColor: AppColors.white,
          textStyle: globalTextStyle(
              fontSize: AppSizing.isMobile(context) ? 12.sp : 8.sp,
              color: AppColors.textGray),
          bottomSheetHeight: 500, // Optional. Country list modal height
          //Optional. Sets the border radius for the bottomsheet.
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
          //Optional. Styles the search field.
          inputDecoration: InputDecoration(
            labelText: 'Search Country',
            labelStyle:
                globalTextStyle(fontSize: 12.sp, color: AppColors.textGray),
            fillColor: AppColors.grey,
            filled: true,
            hintText: 'Search Country',
            hintStyle:
                globalTextStyle(fontSize: 12.sp, color: AppColors.textGray),
            prefixIcon: const Icon(
              Icons.search,
              color: AppColors.textGray,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0.r),
              borderSide:
                  const BorderSide(color: AppColors.borderColor, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0.r),
              borderSide:
                  const BorderSide(color: AppColors.borderColor, width: 1),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0.r),
              borderSide:
                  const BorderSide(color: AppColors.borderColor, width: 1),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0.r),
              borderSide: const BorderSide(
                color: AppColors.errorRed,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0.r),
              borderSide: const BorderSide(
                color: AppColors.errorRed,
              ),
            ),
            contentPadding: EdgeInsets.only(
              left: 15.w,
              right: 15.w,
              top: 13.h,
              bottom: 13.h,
            ),
          ),
        ),
        onSelect: (Country country) {
          setSelectedcountryName = country.name;
          countryCode.value = country;
        });
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
