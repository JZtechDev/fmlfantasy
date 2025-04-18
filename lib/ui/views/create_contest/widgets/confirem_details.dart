import 'package:fmlfantasy/app/app_images/app_images.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/ui/views/create_contest/controller/create_contests_controller.dart';
import 'package:flutter_svg/svg.dart';

class ConfirmDetails extends GetView<CreateContestsController> {
  final VoidCallback onComplete;
  const ConfirmDetails({super.key, required this.onComplete});

  @override
  Widget build(BuildContext context) {
    Get.put(CreateContestsController());
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(bottom: 5.w),
          padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
          width: Get.width,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(5.r),
          ),
          child: Text(controller.contestNameController.text,
              style: globalTextStyle(fontSize: 12.sp)),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.only(
                  left: 10.w, top: 10.h, bottom: 5.h, right: 60.w),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.r),
                  color: AppColors.white),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    controller.getIconPath(controller.sportCode),
                    height: 13.h,
                    width: 13.w,
                  ),
                  verticalSpace(5.h),
                  SizedBox(
                    width: Get.width * 0.42,
                    child: Text(
                      controller.getTextPath(controller.sportCode),
                      style: globalTextStyle(
                          fontSize: 12.sp, fontWeight: FontWeight.w600),
                    ),
                  ),
                  verticalSpace(5.h),
                ],
              ),
            ),
            horizontalSpace(5.w),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(
                    left: 10.w, right: 10.w, top: 10.h, bottom: 10.h),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.r),
                    color: AppColors.white),
                child: Text(
                  controller.entryFeeController.text == '0'
                      ? "Free"
                      : "\$${controller.entryFeeController.text}",
                  style: globalTextStyle2(
                      fontSize: 26.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.dark),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
        verticalSpace(5.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(
                    left: 5.w, right: 5.w, top: 5.h, bottom: 5.h),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(5.r),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(4.r),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2.5.r),
                          color: AppColors.grey),
                      child: SvgPicture.asset(
                        AppImages.clockIcon,
                        height: 16.h,
                        width: 16.w,
                      ),
                    ),
                    horizontalSpace(5.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            controller.matchStarttartdate == ''
                                ? 'Start Date'
                                : controller
                                    .formatDateTime(
                                        controller.matchStarttartdate)
                                    .split(' - ')
                                    .join('\n'),
                            style: globalTextStyle2(
                                fontSize: 10.sp, fontWeight: FontWeight.w500)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            horizontalSpace(5.w),
            // Expanded(
            //   child: Container(
            //     padding: EdgeInsets.only(
            //         left: 5.w, right: 5.w, top: 5.h, bottom: 5.h),
            //     decoration: BoxDecoration(
            //       color: AppColors.white,
            //       borderRadius: BorderRadius.circular(5.r),
            //     ),
            //     child: Row(
            //       children: [
            //         Container(
            //           padding: EdgeInsets.all(5.r),
            //           decoration: BoxDecoration(
            //               borderRadius: BorderRadius.circular(2.5.r),
            //               color: AppColors.grey),
            //           child: SvgPicture.asset(
            //             AppImages.clockIcon,
            //             height: 16.h,
            //             width: 16.w,
            //           ),
            //         ),
            //         horizontalSpace(5.w),
            //         Column(
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: [
            //             Text(
            //                 controller.matchEndDate == ''
            //                     ? 'End Date'
            //                     : controller
            //                         .formatDateTime(controller.matchEndDate)
            //                         .split(' - ')
            //                         .join('\n'),
            //                 style: globalTextStyle2(
            //                     fontSize: 10.sp, fontWeight: FontWeight.w500)),
            //           ],
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
          ],
        ),
        verticalSpace(5.h),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(5.r),
            border: Border.all(color: AppColors.borderColor),
          ),
          child: Row(
            children: [
              Expanded(
                  child: Text(
                textAlign: TextAlign.center,
                'Added Contacts',
                style: globalTextStyle(fontSize: 12.sp),
              )),
              Visibility(
                visible: controller.selectedGroups.isNotEmpty,
                child: Expanded(
                    child: Text(
                  textAlign: TextAlign.center,
                  'Added Groups',
                  style: globalTextStyle(fontSize: 12.sp),
                )),
              )
            ],
          ),
        ),
        verticalSpace(5.h),
        GetBuilder<CreateContestsController>(
          builder: (controller) => Container(
            height: Get.height * 0.2,
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(5.r),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ...controller.selectedMembers.map((e) => Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.w, vertical: 5.h),
                            margin: EdgeInsets.only(bottom: 5.h),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.r),
                              color: AppColors.white,
                              border: Border.all(color: AppColors.borderColor),
                            ),
                            child: Text(
                              e.fullName!,
                            ),
                          ))
                    ],
                  ),
                ),
                Visibility(
                  visible: controller.selectedGroups.isNotEmpty,
                  child: const VerticalDivider(
                    color: AppColors.borderColor2,
                    thickness: 1,
                  ),
                ),
                Visibility(
                  visible: controller.selectedGroups.isNotEmpty,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ...controller.selectedGroups.map((e) => Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10.w, vertical: 5.h),
                              margin: EdgeInsets.only(bottom: 5.h),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.r),
                                color: AppColors.white,
                                border:
                                    Border.all(color: AppColors.borderColor),
                              ),
                              child: Text(
                                e.userGroupName!,
                              ),
                            ))
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
