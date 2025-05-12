import 'package:fmlfantasy/app/app_images/app_images.dart';
import 'package:fmlfantasy/app/app_sizings.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/ui/views/new_auth/basic_info_view.dart';
import 'package:fmlfantasy/ui/views/new_auth/controller/login_controller.dart';
import 'package:fmlfantasy/ui/widgets/app_textfield.dart';
import 'package:fmlfantasy/ui/widgets/primary_button.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
    return Scaffold(
      backgroundColor: AppColors.backgroud,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned.fill(
              child: Opacity(
                  opacity: 0.5,
                  child: Image.asset('assets/new_images/login-bg.png',
                      fit: BoxFit.cover))),
          Positioned(
            top: 150,
            child: AnimatedContainer(
              duration: const Duration(seconds: 5),
              child: Hero(
                tag: 'logo',
                transitionOnUserGestures: true,
                child: Image.asset(AppImages.logo, width: 150.w),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, bottom: 20),
              child: GetBuilder<LoginController>(builder: (controller) {
                return SizedBox(
                  height: Get.height * 0.6,
                  child: Form(
                    key: controller.formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Enter your Credentials'.tr,
                          style: globalTextStyle2(
                              fontSize:
                                  AppSizing.isMobile(context) ? 18.sp : 12.sp),
                        ),
                        verticalSpace(10.h),
                        AppTextField(
                          fillColor: AppColors.white,
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
                        AppTextField(
                          fillColor: AppColors.white,
                          labelText: 'Password'.tr,
                          controller: controller.passwordController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Password is required";
                            }
                            return null;
                          },
                        ),
                        verticalSpace(5.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () {
                                // showDialog(
                                //     context: context,
                                //     builder: (BuildContext context) {
                                //       return const ForgetPasswordDialogue();
                                //     });
                              },
                              child: Text(
                                'forgetPassword'.tr,
                                style: globalTextStyle2(
                                    decoration: TextDecoration.underline,
                                    fontSize: AppSizing.isMobile(context)
                                        ? 12.sp
                                        : 8.sp,
                                    color: AppColors.white,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: Container(),
                        ),
                        verticalSpace(10.h),
                        PrimaryButton(
                            isLoading: controller.isLoading,
                            buttonText: 'Login'.tr,
                            onPressed: () {
                              controller.doLogin();
                            },
                            isEnabled: true),
                        verticalSpace(10),
                        PrimaryButton(
                            textColor: AppColors.white,
                            backgroundColor: Colors.transparent,
                            buttonText: 'Open Account'.tr,
                            onPressed: () {
                              Get.to(() => const BasicInfoView());
                            },
                            isEnabled: true),
                      ],
                    ),
                  ),
                );
              }),
            ),
          )
        ],
      ),
    );
  }
}
