import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/ui/views/friends/controller/friends_controller.dart';
import 'package:fmlfantasy/ui/widgets/app_textfield.dart';
import 'package:fmlfantasy/ui/widgets/primary_button.dart';

class AddContactModal extends GetView<FriendsController> {
  const AddContactModal({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(FriendsController());
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
        child: Stack(
          children: [
            Positioned(
              right: 0,
              child: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    padding: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.r),
                      border: Border.all(
                        color: AppColors.borderColor,
                      ),
                      color: AppColors.grey,
                    ),
                    child: const Icon(FlutterRemix.close_line)),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Add Contact".tr,
                  style: globalTextStyle2(
                      fontSize: 16.sp, fontWeight: FontWeight.w600),
                ),
                verticalSpace(20.h),
                Form(
                  key: controller.formKey,
                  child: Column(
                    children: [
                      AppTextField(
                        controller: controller.nameController,
                        labelText: 'Full Name'.tr,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter name'.tr;
                          }
                          return null;
                        },
                      ),
                      verticalSpace(10.h),
                      AppTextField(
                        controller: controller.emailController,
                        labelText: 'Email'.tr,
                        validator: (value) {
                          if (!GetUtils.isEmail(value!)) {
                            return "Email is not valid".tr;
                          } else {
                            return null;
                          }
                        },
                      ),
                      verticalSpace(10.h),
                      AppTextField(
                        controller: controller.additionalEmailController,
                        labelText: 'Additional Email'.tr,
                      ),
                      verticalSpace(10.h),
                      Obx(
                        () => AppTextField(
                          labelText: 'Phone Number'.tr,
                          controller: controller.phoneController,
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Phone number is required";
                            } else {
                              return null;
                            }
                          },
                          prefixIcon: GestureDetector(
                            onTap: () {
                              controller.selectCountry(context);
                            },
                            child: Container(
                                width: 75.w,
                                alignment: Alignment.center,
                                child: Text(
                                  '${controller.countryP.value.flagEmoji} + ${controller.countryP.value.phoneCode}',
                                  style: globalTextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.textGray),
                                )),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                verticalSpace(20.h),
                GetBuilder<FriendsController>(
                  builder: (_) => PrimaryButton(
                      isLoading: controller.isLoading,
                      buttonText: 'Add'.tr,
                      onPressed: () {
                        controller.addContact();
                      },
                      isEnabled: true),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
