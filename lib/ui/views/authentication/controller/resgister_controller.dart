import 'dart:async';
import 'dart:developer';

import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/model/signup_model.dart';
import 'package:fmlfantasy/services/authentication_services.dart';
import 'package:fmlfantasy/ui/views/authentication/widgtes/verify_number_otp.dart';
import 'package:country_picker/country_picker.dart';
import 'package:pinput/pinput.dart';

class ResgisterController extends GetxController {
  AuthenticationServices authenticationServices = AuthenticationServices();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  RxBool isPhoneValidated = false.obs;
  bool _isNumberVarified = false;
  static const borderColor = AppColors.white;
  Color focusedBorderColor = AppColors.borderColor;
  final focusNode = FocusNode();
  String staticOtp = '000000';
  RxBool resenOtp = false.obs;
  RxInt countdown = 25.obs;
  Timer? _timer;

  bool get isNumberVarified => _isNumberVarified;

  set isNumberVarified(bool value) {
    _isNumberVarified = value;
    update();
  }

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
  }

  void verifyNumber() {
    log('Tapped');
    if (staticOtp == otpController.text) {
      log('Verified');
      update();
      isNumberVarified = true;
      Get.back();
    } else {
      log('Not Verified');
      isNumberVarified = false;
      update();
      Get.back();
    }
  }

  Future<void> resendOTP() async {}

  var fullPhoneNumber = ''.obs;
  var countryP = CountryParser.parseCountryCode('PK').obs; // Observable Country

  void getFullPhoneNumber() {
    fullPhoneNumber.value =
        '${countryP.value.countryCode}${phoneController.text}';
  }

  @override
  void onClose() {
    phoneController.removeListener(getFullPhoneNumber);
    phoneController.dispose();
    super.onClose();
  }

  @override
  void onInit() {
    super.onInit();
    phoneController.addListener(getFullPhoneNumber);
    log(email!);
  }

  RxString selectedcountryName = ''.obs;
  //RxString selectedcountryCode = ''.obs;

  RxBool confirmAge = false.obs;
  RxBool isloading = false.obs;
  RxBool isCountryValidation = false.obs;

  String? email = Get.arguments['email'] ?? '';
  String otp = Get.arguments['otp'];
  RxBool isObscure = true.obs;

  void toggleVisibility() {
    isObscure.value = !isObscure.value;
  }

  Future<void> postData() async {
    if (formKey.currentState!.validate()) {
      isloading.value = true;
      if (confirmAge.value) {
        bool success = await submitDetails();
        if (success) {
          Get.offAllNamed(AppRoutes.succesView);
        } else {
          isloading.value = false;
        }
      } else {
        isloading.value = false;
        Get.snackbar('Error', 'Age should be 18+');
      }
    } else {
      isloading.value = false;
    }
  }

  Future<bool> submitDetails() async {
    Map<String, dynamic> detailPost() {
      SignUpLiveDTO saveDetails = SignUpLiveDTO(
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        mobile: fullPhoneNumber.toString(),
        country: countryP.value.countryCode.toString(),
        email: email!,
        password: passwordController.text,
        confirmPassword: passwordController.text,
        twSid: '',
        codes: ['', otp.toString()],
        pid: '',
      );
      return saveDetails.toJson();
    }

    return authenticationServices.signUp(detailPost());
  }

  final defaultPinTheme = PinTheme(
    width: 80,
    height: 65,
    textStyle: globalTextStyle(
      fontSize: 18.sp,
      color: AppColors.dark,
    ),
    decoration: BoxDecoration(
      color: AppColors.grey,
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: AppColors.borderColor, width: 1),
    ),
  );

  void showVerifyOtp() {
    Get.dialog(const VerifyNumberOtp());
  }

  Future<void> selectCountry(BuildContext context) async {
    showCountryPicker(
        context: context,
        countryListTheme: CountryListThemeData(
          flagSize: 25,
          backgroundColor: Colors.white,
          textStyle:
              globalTextStyle(fontSize: 12.sp, color: AppColors.textGray),
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
          selectedcountryName.value = country.name;
          //selectedCountryFlag.value = country.flagEmoji;
          countryP.value = country;
          getFullPhoneNumber();
        });
  }
}
