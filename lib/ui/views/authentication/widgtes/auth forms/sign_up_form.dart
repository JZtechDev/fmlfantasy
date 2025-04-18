import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/ui/views/authentication/controller/authentication_controller.dart';
import 'package:fmlfantasy/ui/widgets/app_textfield.dart';
import 'package:fmlfantasy/ui/widgets/primary_button.dart';

class SignUpForm extends GetView<AuthenticationController> {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AuthenticationController());
    return LayoutBuilder(
      builder: (context, constraints) {
        double maxWidth = constraints.maxWidth;
        //final maxWidth = constraints.maxWidth;
        // SizeBox maxHeight > 600 ? Get.height * 0.45 : Get.height * 0.5,
        return SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Form(
            key: controller.signupkey,
            child: Column(
              children: [
                Column(
                  children: [
                    verticalSpace(10.h),
                    Padding(
                      padding: EdgeInsets.only(left: 17.w, right: 17.w),
                      child: AppTextField(
                        labelText: 'Email'.tr,
                        controller: controller.signUpEmailController,
                        validator: (value) {
                          if (!GetUtils.isEmail(value!)) {
                            return "Email is not valid";
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                    verticalSpace(20.h),
                    Padding(
                      padding: EdgeInsets.only(left: 17.w, right: 17.w),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Obx(
                                  () => GestureDetector(
                                    onTap: () {
                                      controller.signAgree.value =
                                          !controller.signAgree.value;
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      //height: 16.h,
                                      //width: 16.w,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(5.r),
                                        border: Border.all(
                                          color: AppColors.borderColor,
                                          width: 1,
                                        ),
                                        color: controller.signAgree.value
                                            ? AppColors.primary
                                            : AppColors.white,
                                      ),
                                      child: Icon(
                                        Icons.check,
                                        color: AppColors.white,
                                        size: 15.w,
                                      ),
                                    ),
                                  ),
                                ),
                                horizontalSpace(10.w),
                                Text(
                                  'iagree'.tr,
                                  style: globalTextStyle(
                                      fontSize: maxWidth > 600 ? 10.sp : 12.sp,
                                      color: AppColors.textGray,
                                      fontWeight: FontWeight.w500),
                                ),
                                horizontalSpace(2.w),
                                Text(
                                  'terms'.tr,
                                  style: globalTextStyle(
                                      fontSize: maxWidth > 600 ? 10.sp : 12.sp,
                                      color: AppColors.primary,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ]),
                    ),
                  ],
                ),
                verticalSpace(62.h),
                Obx(
                  () => PrimaryButton(
                    buttonText: 'Register'.tr,
                    isLoading: controller.isLoading.value,
                    onPressed: () {
                      controller.sendOTP();
                    },
                    isEnabled: true,
                  ),
                ),
                verticalSpace(10.h),
              ],
            ),
          ),
        );
      },
    );
  }
}
