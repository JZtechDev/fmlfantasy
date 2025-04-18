import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/ui/views/authentication/controller/forget_password_controller.dart';
import 'package:fmlfantasy/ui/widgets/app_textfield.dart';
import 'package:fmlfantasy/ui/widgets/primary_button.dart';

class ForgetPasswordDialogue extends GetView<ForgetPasswordController> {
  const ForgetPasswordDialogue({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ForgetPasswordController());
    return Dialog(
      insetAnimationCurve: Curves.easeInOutCubicEmphasized,
      insetAnimationDuration: const Duration(seconds: 3),
      backgroundColor: AppColors.white,
      surfaceTintColor: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0.r),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          left: 10.w,
          right: 10.w,
          bottom: 15.h,
          top: 15.h,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.r),
                color: AppColors.grey,
                border: Border.all(color: AppColors.borderColor, width: 1),
              ),
              padding: EdgeInsets.only(
                  left: 10.w, right: 10.w, top: 5.h, bottom: 5.h),
              child: Text(
                "Forget Password".tr,
                style: globalTextStyle(
                    fontSize: 16.sp, fontWeight: FontWeight.w600),
              ),
            ),
            verticalSpace(10.h),
            Form(
              key: controller.formKey,
              child: AppTextField(
                controller: controller.emailController,
                labelText: 'Email',
                validator: (value) {
                  if (!GetUtils.isEmail(value!)) {
                    return "Email is not valid";
                  } else {
                    return null;
                  }
                },
              ),
            ),
            verticalSpace(10.h),
            PrimaryButton(
                buttonText: 'Reset Password'.tr,
                onPressed: () {
                  controller.forgetPasswordWithEmail();
                },
                isEnabled: true)
          ],
        ),
      ),
    );
  }
}
