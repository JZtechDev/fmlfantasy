import 'package:fmlfantasy/app/app_sizings.dart';
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
      backgroundColor: AppColors.grey,
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding:
            const EdgeInsets.only(left: 20, right: 10, bottom: 30, top: 100),
        child: GetBuilder<RegisterNewController>(builder: (controller) {
          return Form(
            key: controller.basicInfoFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: const Icon(CupertinoIcons.arrow_left)),
                verticalSpace(20.h),
                Text(
                  'Hi!\nGreat To Have You',
                  style: TextStyle(
                      fontSize: AppSizing.isMobile(context) ? 30.sp : 24.sp),
                ),
                verticalSpace(10.h),
                Text(
                  'What is your full name name?',
                  style: TextStyle(
                      fontSize: AppSizing.isMobile(context) ? 12.sp : 10.sp,
                      color: AppColors.textGray),
                ),
                verticalSpace(70.h),
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
                    buttonText: 'Next'.tr,
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
