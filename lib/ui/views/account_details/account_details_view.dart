import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/model/account_details_model.dart';
import 'package:fmlfantasy/ui/components/home_appbar.dart';
import 'package:fmlfantasy/ui/views/account_details/controller/account_details_controller.dart';
import 'package:fmlfantasy/ui/views/account_details/edit_account_details_view.dart';

class AccountDetailsView extends GetView<AccountDetailsController> {
  const AccountDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AccountDetailsController());
    return Scaffold(
      appBar: HomeAppBar(title: 'accountDetails'.tr),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Obx(() {
              AccountDetailsModel data = controller.accountDetailsList[0];
              controller.initData(data);
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
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
                        Text('ACCOUNT DETAILS'.tr,
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
                                  Get.to(() => const EditAccountDetails());
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 15.w, vertical: 5.h),
                                  decoration: BoxDecoration(
                                    color: AppColors.secondary,
                                    borderRadius: BorderRadius.circular(5.r),
                                  ),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        'assets/new_images/Editing.png',
                                        height: 18,
                                        width: 18,
                                      ),
                                      horizontalSpace(5.w),
                                      Text('Edit',
                                          style: globalTextStyle2(
                                              fontSize: 12.sp,
                                              color: AppColors.backgroud,
                                              fontWeight: FontWeight.w700)),
                                    ],
                                  ),
                                ),
                              ),
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
                            style: globalTextStyle2(
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
                            style: globalTextStyle2(
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
                            style: globalTextStyle2(
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
                        Container(
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
                              style: globalTextStyle2(
                                  fontSize: 14.sp,
                                  color: AppColors.white,
                                  fontWeight: FontWeight.w600),
                            );
                          }),
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
                            controller.cityController.text,
                            style: globalTextStyle2(
                                fontSize: 14.sp,
                                color: AppColors.white,
                                fontWeight: FontWeight.w600),
                          ),
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
                            controller.showDob.value,
                            style: globalTextStyle2(
                                fontSize: 14.sp,
                                color: AppColors.white,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        verticalSpace(10.h),
                        Text(
                          'Postal / Zip Code'.tr,
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
                            controller.postalCodeController.text,
                            style: globalTextStyle2(
                                fontSize: 14.sp,
                                color: AppColors.white,
                                fontWeight: FontWeight.w600),
                          ),
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
                            controller.addressController.text,
                            style: globalTextStyle2(
                                fontSize: 14.sp,
                                color: AppColors.white,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              );
            }),
            verticalSpace(20.h),
          ],
        ),
      ),
    );
  }
}
