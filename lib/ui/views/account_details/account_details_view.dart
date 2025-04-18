import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/model/account_details_model.dart';
import 'package:fmlfantasy/ui/components/inner_appbar.dart';
import 'package:fmlfantasy/ui/views/account_details/controller/account_details_controller.dart';
import 'package:fmlfantasy/ui/views/account_details/edit_account_details_view.dart';

class AccountDetailsView extends GetView<AccountDetailsController> {
  const AccountDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AccountDetailsController());
    return Scaffold(
      appBar: const AppBarInner(title: 'Edit Account Details'),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 15.w, right: 15.w),
          child: Column(
            children: [
              Obx(() {
                AccountDetailsModel data = controller.accountDetailsList[0];
                controller.initData(data);
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('acountDetails'.tr,
                        style: globalTextStyle(fontSize: 24.sp)),
                    verticalSpace(15.h),
                    Row(
                      children: [
                        Obx(
                          () => CircleAvatar(
                              radius: 30.r,
                              backgroundColor: AppColors.grey,
                              backgroundImage:
                                  NetworkImage(data.imageUrl!.value)),
                        ),
                        horizontalSpace(10.w),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${data.userName}',
                                style: globalTextStyle(fontSize: 16.sp),
                              ),
                              Text(
                                '232',
                                style: globalTextStyle(
                                    fontSize: 12.sp, color: AppColors.textGray),
                              ),
                            ]),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            Get.to(() => const EditAccountDetails());
                          },
                          child: Container(
                              padding: EdgeInsets.all(10.r),
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.grey),
                              child: Icon(Icons.edit,
                                  color: AppColors.primary, size: 20.sp)),
                        )
                      ],
                    ),
                    verticalSpace(15.h),
                    Text(
                      'First Name'.tr,
                      style: globalTextStyle(fontSize: 12.sp),
                    ),
                    verticalSpace(5.h),
                    Container(
                      padding: EdgeInsets.only(
                          left: 15.w, right: 15.w, top: 10.h, bottom: 10.h),
                      width: Get.width,
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: AppColors.borderColor, width: 1),
                        borderRadius: BorderRadius.circular(5.r),
                        color: AppColors.grey,
                      ),
                      child: Text(
                        controller.firstNameController.text,
                        style: globalTextStyle2(
                            fontSize: 12.sp, color: AppColors.textGray),
                      ),
                    ),
                    verticalSpace(10.h),
                    Text(
                      'Surname'.tr,
                      style: globalTextStyle(fontSize: 12.sp),
                    ),
                    verticalSpace(5.h),
                    Container(
                      padding: EdgeInsets.only(
                          left: 15.w, right: 15.w, top: 10.h, bottom: 10.h),
                      width: Get.width,
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: AppColors.borderColor, width: 1),
                        borderRadius: BorderRadius.circular(5.r),
                        color: AppColors.grey,
                      ),
                      child: Text(
                        controller.lastNameController.text,
                        style: globalTextStyle2(
                            fontSize: 12.sp, color: AppColors.textGray),
                      ),
                    ),
                    verticalSpace(10.h),
                    Text(
                      'Email'.tr,
                      style: globalTextStyle(fontSize: 12.sp),
                    ),
                    verticalSpace(5.h),
                    Container(
                      padding: EdgeInsets.only(
                          left: 15.w, right: 15.w, top: 10.h, bottom: 10.h),
                      width: Get.width,
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: AppColors.borderColor, width: 1),
                        borderRadius: BorderRadius.circular(5.r),
                        color: AppColors.grey,
                      ),
                      child: Text(
                        controller.emailController.text,
                        style: globalTextStyle2(
                            fontSize: 12.sp, color: AppColors.textGray),
                      ),
                    ),
                    verticalSpace(10.h),
                    Text(
                      'Mobile'.tr,
                      style: globalTextStyle(fontSize: 12.sp),
                    ),
                    verticalSpace(5.h),
                    Container(
                      padding: EdgeInsets.only(
                          left: 15.w, right: 15.w, top: 10.h, bottom: 10.h),
                      width: Get.width,
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: AppColors.borderColor, width: 1),
                        borderRadius: BorderRadius.circular(5.r),
                        color: AppColors.grey,
                      ),
                      child: Text(
                        controller.mobileController.text,
                        style: globalTextStyle2(
                            fontSize: 12.sp, color: AppColors.textGray),
                      ),
                    ),
                    verticalSpace(10.h),
                    Text(
                      'Country'.tr,
                      style: globalTextStyle(fontSize: 12.sp),
                    ),
                    verticalSpace(5.h),
                    Container(
                      width: Get.width,
                      padding: EdgeInsets.all(10.r),
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: AppColors.borderColor, width: 1),
                        borderRadius: BorderRadius.circular(5.r),
                        color: AppColors.grey,
                      ),
                      child: Obx(() {
                        return Text(
                          controller.selectedCountry.value.name.isNotEmpty
                              ? '${controller.selectedCountry.value.flagEmoji} ${controller.selectedCountry.value.name}'
                              : 'Select Country'.tr,
                          style: globalTextStyle2(
                              fontSize: 12.sp, color: AppColors.textGray),
                        );
                      }),
                    ),
                    verticalSpace(10.h),
                    Text(
                      'City'.tr,
                      style: globalTextStyle(fontSize: 12.sp),
                    ),
                    verticalSpace(5.h),
                    Container(
                      padding: EdgeInsets.only(
                          left: 15.w, right: 15.w, top: 10.h, bottom: 10.h),
                      width: Get.width,
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: AppColors.borderColor, width: 1),
                        borderRadius: BorderRadius.circular(5.r),
                        color: AppColors.grey,
                      ),
                      child: Text(
                        controller.cityController.text,
                        style: globalTextStyle2(
                            fontSize: 12.sp, color: AppColors.textGray),
                      ),
                    ),
                    verticalSpace(10.h),
                    Text(
                      'Date of Birth'.tr,
                      style: globalTextStyle(fontSize: 12.sp),
                    ),
                    verticalSpace(5.h),
                    Container(
                      padding: EdgeInsets.only(
                          left: 15.w, right: 15.w, top: 10.h, bottom: 10.h),
                      width: Get.width,
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: AppColors.borderColor, width: 1),
                        borderRadius: BorderRadius.circular(5.r),
                        color: AppColors.grey,
                      ),
                      child: Text(
                        controller.showDob.value,
                        style: globalTextStyle2(
                            fontSize: 12.sp, color: AppColors.textGray),
                      ),
                    ),
                    verticalSpace(10.h),
                    Text(
                      'Postal / Zip Code'.tr,
                      style: globalTextStyle(fontSize: 12.sp),
                    ),
                    verticalSpace(5.h),
                    Container(
                      padding: EdgeInsets.only(
                          left: 15.w, right: 15.w, top: 10.h, bottom: 10.h),
                      width: Get.width,
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: AppColors.borderColor, width: 1),
                        borderRadius: BorderRadius.circular(5.r),
                        color: AppColors.grey,
                      ),
                      child: Text(
                        controller.postalCodeController.text,
                        style: globalTextStyle2(
                            fontSize: 12.sp, color: AppColors.textGray),
                      ),
                    ),
                    verticalSpace(10.h),
                    Text(
                      'Address'.tr,
                      style: globalTextStyle(fontSize: 12.sp),
                    ),
                    verticalSpace(5.h),
                    Container(
                      padding: EdgeInsets.only(
                          left: 15.w, right: 15.w, top: 10.h, bottom: 10.h),
                      width: Get.width,
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: AppColors.borderColor, width: 1),
                        borderRadius: BorderRadius.circular(5.r),
                        color: AppColors.grey,
                      ),
                      child: Text(
                        controller.addressController.text,
                        style: globalTextStyle2(
                            fontSize: 12.sp, color: AppColors.textGray),
                      ),
                    ),
                  ],
                );
              }),
              verticalSpace(20.h),
            ],
          ),
        ),
      ),
    );
  }
}
