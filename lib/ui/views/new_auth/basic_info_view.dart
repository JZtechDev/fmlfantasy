import 'package:fmlfantasy/app/app_images/app_images.dart';
import 'package:fmlfantasy/app/app_sizings.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/ui/views/new_auth/controller/register_controller.dart';
import 'package:fmlfantasy/ui/widgets/app_textfield.dart';
import 'package:fmlfantasy/ui/widgets/primary_button.dart';
import 'package:flutter/cupertino.dart';

import '../../../core/imports/imports.dart';

class BasicInfoView extends StatelessWidget {
  const BasicInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(RegisterNewController());
    return Scaffold(
      backgroundColor: Color.fromRGBO(44, 86, 80, 1),
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding:
            const EdgeInsets.only(left: 20, right: 20, bottom: 30, top: 100),
        child: GetBuilder<RegisterNewController>(builder: (controller) {
          return Form(
            key: controller.basicInfoFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Image.asset(
                    AppImages.logo,
                    height: AppSizing.isMobile(context) ? 50.h : 40.h,
                  ),
                ),
                verticalSpace(10),
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Image.asset(
                    'assets/logo/back.png',
                    height: AppSizing.isMobile(context) ? 22.h : 20.h,
                  ),
                ),
                verticalSpace(10.h),
                Text(
                  'Hi! Great To Have You',
                  style: globalTextStyle(
                      fontSize: AppSizing.isMobile(context) ? 22.sp : 18.sp,
                      fontWeight: FontWeight.w800,
                      color: AppColors.white),
                ),
                verticalSpace(5.h),
                Text(
                  'What is your full name name?',
                  style: globalTextStyle(
                      fontSize: AppSizing.isMobile(context) ? 12.sp : 10.sp,
                      color: AppColors.white,
                      fontWeight: FontWeight.w600),
                ),
                verticalSpace(40.h),
                AppTextField(
                  labelText: 'First Name'.tr,
                  fillColor: AppColors.white,
                  controller: controller.firstNameController,
                  validator: (p0) {
                    if (p0 == null || p0.isEmpty) {
                      return "First name is required";
                    }
                    return null;
                  },
                ),
                verticalSpace(20.h),
                AppTextField(
                  labelText: 'Last Name'.tr,
                  fillColor: AppColors.white,
                  controller: controller.lastNameController,
                  validator: (p0) {
                    if (p0 == null || p0.isEmpty) {
                      return "Last name is required";
                    }
                    return null;
                  },
                ),
                verticalSpace(20.h),
                PrimaryButton(
                    buttonText: 'Continue'.tr,
                    onPressed: () {
                      if (controller.basicInfoFormKey.currentState!
                          .validate()) {
                        Get.toNamed(AppRoutes.registerUser);
                      }
                    },
                    isEnabled: true)
              ],
            ),
          );
        }),
      ),
    );
  }
}
