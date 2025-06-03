import 'package:fmlfantasy/app/app_colors/app_colors.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/ui/components/inner_appbar.dart';
import 'package:fmlfantasy/ui/helpers/commons.dart';
import 'package:fmlfantasy/ui/views/account_details/controller/account_details_controller.dart';
import 'package:fmlfantasy/ui/views/account_details/widget/edit_image_profile.dart';
import 'package:fmlfantasy/ui/widgets/app_textfield.dart';
import 'package:fmlfantasy/ui/widgets/primary_button.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class EditAccountDetails extends GetView<AccountDetailsController> {
  const EditAccountDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AccountDetailsController());
    return Scaffold(
      appBar: const AppBarInner(title: 'Edit Account Details'),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(() {
              final data = controller.accountDetailsList[0];

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.only(top: 10.h, left: 15.w, right: 15.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.w, vertical: 5.h),
                            decoration: BoxDecoration(
                              color: AppColors.secondary,
                              borderRadius: BorderRadius.circular(5.r),
                            ),
                            child: Text('Go Back',
                                style: globalTextStyle2(
                                    fontSize: 12.sp,
                                    color: AppColors.backgroud,
                                    fontWeight: FontWeight.w700)),
                          ),
                        ),
                        Text('Edit DETAILS'.tr,
                            style: globalTextStyle(
                                fontSize: 20.sp, fontWeight: FontWeight.w700)),
                      ],
                    ),
                  ),
                  verticalSpace(10.h),
                  const Divider(
                    color: AppColors.secondary,
                    thickness: 1.0,
                  ),
                  verticalSpace(10.h),
                  Padding(
                    padding: EdgeInsets.only(left: 30.w, right: 15.w),
                    child: Row(
                      children: [
                        Obx(
                          () => CircleAvatar(
                              radius: 40.r,
                              backgroundColor: AppColors.grey,
                              backgroundImage:
                                  NetworkImage(data.imageUrl!.value)),
                        ),
                        horizontalSpace(30.w),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${data.userName}',
                                style: globalTextStyle(
                                    fontSize: 16.sp,
                                    color: AppColors.secondary,
                                    fontWeight: FontWeight.w700),
                              ),
                              Text(
                                '\$199',
                                style: globalTextStyle(
                                    fontSize: 20.sp,
                                    color: AppColors.white,
                                    fontWeight: FontWeight.w700),
                              ),
                              verticalSpace(5.h),
                              GestureDetector(
                                  onTap: () {
                                    showEditImageModal(
                                        context: context,
                                        onPickImageFromGallery: () {
                                          controller.pickImageFromGallery();
                                        },
                                        onTakePhoto: () {
                                          controller.takePhoto();
                                        });
                                  },
                                  child: Container(
                                      padding: EdgeInsets.all(6.r),
                                      decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: AppColors.secondary),
                                      child: Icon(Icons.camera_alt_outlined,
                                          color: AppColors.primary,
                                          size: 20.sp)))
                            ]),
                      ],
                    ),
                  ),
                  verticalSpace(10.h),
                  const Divider(
                    color: AppColors.secondary,
                    thickness: 1.0,
                  ),
                  verticalSpace(10.h),
                  Padding(
                    padding: EdgeInsets.only(left: 15.w, right: 15.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'First Name'.tr,
                          style: globalTextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.secondary),
                        ),
                        verticalSpace(5.h),
                        Container(
                          padding: EdgeInsets.only(
                              left: 15.w, right: 15.w, top: 10.h, bottom: 10.h),
                          width: Get.width,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: AppColors.secondary, width: 1),
                            borderRadius: BorderRadius.circular(5.r),
                            color: AppColors.primary,
                          ),
                          child: Text(
                            controller.firstNameController.text,
                            style: globalTextStyle(
                                fontSize: 14.sp,
                                color: AppColors.white,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        verticalSpace(10.h),
                        Text(
                          'Surname'.tr,
                          style: globalTextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.secondary),
                        ),
                        verticalSpace(5.h),
                        Container(
                          padding: EdgeInsets.only(
                              left: 15.w, right: 15.w, top: 10.h, bottom: 10.h),
                          width: Get.width,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: AppColors.secondary, width: 1),
                            borderRadius: BorderRadius.circular(5.r),
                            color: AppColors.primary,
                          ),
                          child: Text(
                            controller.lastNameController.text,
                            style: globalTextStyle(
                                fontSize: 14.sp,
                                color: AppColors.white,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        verticalSpace(10.h),
                        Text(
                          'Email'.tr,
                          style: globalTextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.secondary),
                        ),
                        verticalSpace(5.h),
                        Container(
                          padding: EdgeInsets.only(
                              left: 15.w, right: 15.w, top: 10.h, bottom: 10.h),
                          width: Get.width,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: AppColors.secondary, width: 1),
                            borderRadius: BorderRadius.circular(5.r),
                            color: AppColors.primary,
                          ),
                          child: Text(
                            controller.emailController.text,
                            style: globalTextStyle(
                                fontSize: 14.sp,
                                color: AppColors.white,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        verticalSpace(10.h),
                        Text(
                          'Mobile'.tr,
                          style: globalTextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.secondary),
                        ),
                        verticalSpace(5.h),
                        Container(
                          padding: EdgeInsets.only(
                              left: 15.w, right: 15.w, top: 10.h, bottom: 10.h),
                          width: Get.width,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: AppColors.secondary, width: 1),
                            borderRadius: BorderRadius.circular(5.r),
                            color: AppColors.primary,
                          ),
                          child: Text(
                            controller.mobileController.text,
                            style: globalTextStyle(
                                fontSize: 14.sp,
                                color: AppColors.white,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        verticalSpace(10.h),
                        Text(
                          'Country'.tr,
                          style: globalTextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.secondary),
                        ),
                        verticalSpace(5.h),
                        GestureDetector(
                          onTap: () {
                            showCountryPicker(
                              context: context,
                              showPhoneCode: true, // optional
                              onSelect: (Country country) {
                                controller.selectedCountry.value = country;
                              },
                            );
                          },
                          child: Container(
                            width: Get.width,
                            padding: EdgeInsets.all(10.r),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: AppColors.secondary, width: 1),
                              borderRadius: BorderRadius.circular(5.r),
                              color: AppColors.primary,
                            ),
                            child: Obx(() {
                              return Text(
                                controller.selectedCountry.value.name.isNotEmpty
                                    ? '${controller.selectedCountry.value.flagEmoji} ${controller.selectedCountry.value.name}'
                                    : 'Select Country'.tr,
                                style: globalTextStyle(
                                    fontSize: 14.sp,
                                    color: AppColors.white,
                                    fontWeight: FontWeight.w600),
                              );
                            }),
                          ),
                        ),
                        verticalSpace(10.h),
                        Text(
                          'City'.tr,
                          style: globalTextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.secondary),
                        ),
                        verticalSpace(5.h),
                        AppTextField(
                          textColor: AppColors.white,
                          fillColor: AppColors.primary,
                          labelText: 'City'.tr,
                          controller: controller.cityController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'City is required';
                            }
                            return null;
                          },
                        ),
                        verticalSpace(10.h),
                        Text(
                          'Date of Birth'.tr,
                          style: globalTextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.secondary),
                        ),
                        verticalSpace(5.h),
                        GestureDetector(
                          onTap: () {
                            controller.selectDateOfBirth(context);
                          },
                          child: Obx(
                            () => Container(
                              width: Get.width,
                              padding: EdgeInsets.only(
                                  top: 12.h,
                                  bottom: 12.h,
                                  left: 15.w,
                                  right: 15.w),
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: AppColors.secondary, width: 1),
                                borderRadius: BorderRadius.circular(5.r),
                                color: AppColors.primary,
                              ),
                              child: Text(
                                controller.showDob.value.toString(),
                                style: globalTextStyle(
                                    fontSize: 14.sp,
                                    color: AppColors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ),
                        verticalSpace(15.h),
                        Text(
                          'Postal / Zip Code'.tr,
                          style: globalTextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.secondary),
                        ),
                        verticalSpace(5.h),
                        AppTextField(
                          textColor: AppColors.white,
                          fillColor: AppColors.primary,
                          labelText: 'Postal / Zip Code'.tr,
                          controller: controller.postalCodeController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Postal / Zip Code is required';
                            }
                            return null;
                          },
                        ),
                        verticalSpace(10.h),
                        Text(
                          'Address'.tr,
                          style: globalTextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.secondary),
                        ),
                        verticalSpace(5.h),
                        AppTextField(
                          textColor: AppColors.white,
                          fillColor: AppColors.primary,
                          labelText: 'Address'.tr,
                          controller: controller.addressController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Address is required';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  )
                ],
              );
            }),
            verticalSpace(20.h),
            PrimaryButton(
              buttonText: 'Update Account Details',
              onPressed: () {
                controller.updateProfile();
              },
              isEnabled: true,
              padding: 0,
            ),
            verticalSpace(20.h)
          ],
        ),
      ),
    );
  }
}
