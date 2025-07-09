import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/ui/views/friends/controller/friends_controller.dart';
import 'package:fmlfantasy/ui/widgets/app_textfield.dart';
import 'package:fmlfantasy/ui/widgets/primary_button.dart';

class EditContactModal extends GetView<FriendsController> {
  final String contactId;
  const EditContactModal({super.key, required this.contactId});

  @override
  Widget build(BuildContext context) {
    Get.put(FriendsController());
    return Dialog(
      insetAnimationCurve: Curves.easeInOutCubicEmphasized,
      insetAnimationDuration: const Duration(seconds: 3),
      backgroundColor: AppColors.primary,
      surfaceTintColor: AppColors.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0.r),
      ),
      child: Padding(
        padding: EdgeInsets.only(),
        child: Stack(
          children: [
            Positioned(
              right: 0,
              child: GestureDetector(
                onTap: () {
                  controller.nameController.clear();
                  controller.emailController.clear();
                  controller.phoneController.clear();
                  Get.back();
                },
                child: Container(
                    padding: const EdgeInsets.all(7.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.r),
                      color: AppColors.secondary,
                    ),
                    child: const Icon(FlutterRemix.close_line)),
              ),
            ),
            Positioned(
              left: 0,
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: AppColors.backgroud,
                    borderRadius: BorderRadius.circular(5)),
                child: Text(
                  "Edit Contact".tr,
                  style: globalTextStyle2(
                      fontSize: 12.sp, fontWeight: FontWeight.w600),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  verticalSpace(40.h),
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
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.dark),
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
                        buttonText: 'Edit'.tr,
                        onPressed: () {
                          controller.editContact(contactId);
                        },
                        isEnabled: true),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
