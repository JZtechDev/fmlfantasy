import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/ui/views/authentication/controller/authentication_controller.dart';
import 'package:fmlfantasy/ui/views/authentication/widgtes/auth%20forms/forget_password_dialogue.dart';
import 'package:fmlfantasy/ui/widgets/app_textfield.dart';
import 'package:fmlfantasy/ui/widgets/primary_button.dart';

class LoginForm extends GetView<AuthenticationController> {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AuthenticationController());
    return Form(
        key: controller.formKey,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 17.w, right: 17.w, top: 10.h),
              child: Column(
                children: [
                  AppTextField(
                    labelText: 'Email'.tr,
                    controller: controller.emailController,
                    validator: (value) {
                      if (!GetUtils.isEmail(value!)) {
                        return "Email is not valid";
                      } else {
                        return null;
                      }
                    },
                  ),
                  verticalSpace(10.h),
                  Obx(
                    () => AppTextField(
                      onVisibilityToggle: controller.toggleVisibility,
                      suffixIcon: true,
                      obscureText: controller.isObscure.value,
                      labelText: 'Password'.tr,
                      controller: controller.passwordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter password';
                        }
                        return null;
                      },
                    ),
                  ),
                  verticalSpace(5.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Obx(
                        () => GestureDetector(
                          onTap: () {
                            controller.remmberMe.value =
                                !controller.remmberMe.value;
                          },
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.r),
                              border: Border.all(
                                color: AppColors.borderColor,
                                width: 1,
                              ),
                              color: controller.remmberMe.value
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
                      Text(
                        'rememberMe'.tr,
                        style: globalTextStyle2(
                            fontSize: 12.sp,
                            color: AppColors.textGray,
                            fontWeight: FontWeight.w500),
                      ),
                      horizontalSpace(10.w),
                      GestureDetector(
                        onTap: () {
                          controller.showDialog(context);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                                onPressed: () {
                                  controller.showDialog(Get.context!);
                                },
                                icon: Image.asset(
                                  'assets/icons/google.png',
                                  height: 12,
                                  width: 12,
                                  color: AppColors.dark,
                                )),
                            Text(
                              'googleAuthentication'.tr,
                              style: globalTextStyle2(
                                color: AppColors.dark,
                                fontSize: 12.sp,
                              ),
                              textAlign: TextAlign.start,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  verticalSpace(5.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return const ForgetPasswordDialogue();
                              });
                        },
                        child: Text(
                          'forgetPassword'.tr,
                          style: globalTextStyle2(
                              decoration: TextDecoration.underline,
                              fontSize: 12.sp,
                              color: AppColors.dark,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            verticalSpace(10.h),
            Obx(
              () => PrimaryButton(
                buttonText: 'Login'.tr,
                padding: 30,
                isLoading: controller.isLoading.value,
                isEnabled: true,
                backgroundColor: AppColors.primary,
                onPressed: () {
                  controller.doLogin();
                },
              ),
            ),
          ],
        ));
  }
}
