import 'package:fmlfantasy/app/app_images/app_images.dart';
import 'package:fmlfantasy/app/app_sizings.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/ui/views/new_auth/controller/register_controller.dart';
import 'package:fmlfantasy/ui/views/two_factor_auth/otp_view.dart';
import 'package:fmlfantasy/ui/widgets/primary_button.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import '../../../core/imports/imports.dart';
import 'controllers/two_factor_auth_controller.dart';

class TwoFactorAuth extends StatelessWidget {
  const TwoFactorAuth({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TwoFactorAuthController());
    return Scaffold(
      backgroundColor: Color.fromRGBO(44, 86, 80, 1),
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding:
            const EdgeInsets.only(top: 100, left: 20, right: 20, bottom: 50),
        child: GetBuilder<TwoFactorAuthController>(builder: (controller) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 70),
                child: Image.asset(
                  AppImages.logo,
                  height: AppSizing.isMobile(context) ? 50.h : 40.h,
                ),
              ),
              Text(
                'Welcome to FMLFantasy'.tr,
                style: globalTextStyle(
                    fontSize: AppSizing.isMobile(context) ? 16.sp : 18.sp,
                    fontWeight: FontWeight.w800,
                    color: AppColors.secondary),
              ),
              Text(
                'Your mobile phone number'.tr,
                style: globalTextStyle(
                    fontSize: AppSizing.isMobile(context) ? 22.sp : 18.sp,
                    fontWeight: FontWeight.w800),
              ),
              verticalSpace(20.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  textAlign: TextAlign.center,
                  'To make your account fully secure, please let us know to what phone number we can send a security code.'
                      .tr,
                  style: globalTextStyle2(
                      fontSize: AppSizing.isMobile(context) ? 14.sp : 8.sp,
                      color: AppColors.white,
                      fontWeight: FontWeight.w600),
                ),
              ),
              verticalSpace(40.h),
              GetBuilder<RegisterNewController>(builder: (regController) {
                return IntlPhoneField(
                  showCountryFlag: false,
                  cursorColor: AppColors.dark,
                  style: globalTextStyle2(
                    fontSize: AppSizing.isMobile(context) ? 12.sp : 8.sp,
                    color: AppColors.dark,
                    fontWeight: FontWeight.w600,
                  ),
                  pickerDialogStyle: PickerDialogStyle(
                    backgroundColor: AppColors.white,
                    countryNameStyle: globalTextStyle2(
                      fontSize: AppSizing.isMobile(context) ? 12.sp : 8.sp,
                      color: AppColors.dark,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColors.white,
                    labelStyle: globalTextStyle2(
                      fontSize: AppSizing.isMobile(context) ? 12.sp : 8.sp,
                      color: AppColors.dark,
                      fontWeight: FontWeight.w600,
                    ),
                    labelText: 'Phone Number'.tr,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0.r),
                      borderSide: const BorderSide(
                          color: AppColors.borderColor, width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0.r),
                      borderSide: const BorderSide(
                          color: AppColors.borderColor, width: 1),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0.r),
                      borderSide: const BorderSide(
                          color: AppColors.borderColor, width: 1),
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
                  initialCountryCode:
                      regController.countryCode.value.countryCode.toString(),
                  onChanged: (phone) {
                    controller.phoneNumber = phone.completeNumber;
                  },
                );
              }),
              verticalSpace(20),
              GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: AppColors.white,
                        context: Get.context!,
                        builder: (BuildContext context) {
                          return Container(
                            padding: const EdgeInsets.all(20),
                            height: Get.height * 0.7,
                            width: Get.width,
                            child: Column(
                              spacing: 10,
                              children: [
                                Image.asset(
                                  AppImages.introModalImage,
                                  height: 100,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Text(
                                    'Why we ask for phone number verification'
                                        .tr,
                                    style: globalTextStyle2(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                verticalSpace(20),
                                Text(
                                  'To keep your account safe and protect your funds from malicious actors, we will send you a short security code to confirm it’s really you using your account.'
                                      .tr,
                                  style: globalTextStyle(
                                      letterSpacing: 5,
                                      fontSize: 12.sp,
                                      color: AppColors.textGray,
                                      fontWeight: FontWeight.w400),
                                ),
                                verticalSpace(10),
                                Text(
                                  'This adds an extra layer of security to your account in case your password is stolen.'
                                      .tr,
                                  style: globalTextStyle(
                                      letterSpacing: 5,
                                      fontSize: 12.sp,
                                      color: AppColors.textGray,
                                      fontWeight: FontWeight.w400),
                                ),
                                const Spacer(),
                                PrimaryButton(
                                    buttonText: 'Okay'.tr,
                                    onPressed: () {
                                      Get.back();
                                    },
                                    isEnabled: true),
                              ],
                            ),
                          );
                        });
                  },
                  child: Text(
                    'Why Did We Ask For This?'.tr,
                    style: globalTextStyle2(
                        fontSize: 14.sp, fontWeight: FontWeight.w600),
                  )),
              verticalSpace(20),
              PrimaryButton(
                  buttonText: 'Continue'.tr,
                  onPressed: () {
                    controller.handleResend();
                    Get.to(() => const TwoFactorOtpView());
                  },
                  isEnabled: true),
              verticalSpace(20),
            ],
          );
        }),
      ),
    );
  }
}
