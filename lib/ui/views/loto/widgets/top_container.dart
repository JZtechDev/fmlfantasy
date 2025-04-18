import 'package:fmlfantasy/app/app_sizings.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/model/select_player_model.dart';
import 'package:fmlfantasy/ui/helpers/replace_svg_with_png.dart';
import 'package:fmlfantasy/ui/views/loto/loto_controller/loto_controller.dart';
import 'package:flutter_svg/svg.dart';

class LotoTopContainer extends GetView<LotoController> {
  final SelectTeam selectTeam;
  const LotoTopContainer({super.key, required this.selectTeam});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10.w, top: 10.h, bottom: 5.h, right: 10.w),
      decoration: const BoxDecoration(
        color: AppColors.white,
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10.w, right: 10.w, bottom: 10.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      SizedBox(
                        width: Get.width * 0.25,
                        child: Text(
                          selectTeam.homeTeam!.name!,
                          style: globalTextStyle(
                              fontSize:
                                  AppSizing.isMobile(context) ? 14.sp : 12.sp),
                        ),
                      ),
                      horizontalSpace(10.w),
                      selectTeam.homeTeam!.imageUrl == null
                          ? Container()
                          : SizedBox(
                              width: 45.w,
                              child: selectTeam.homeTeam!.imageUrl!
                                      .endsWith('.svg')
                                  ? controller.sportName == 'CR'
                                      ? Image.network(
                                          replaceSvgWithPng(
                                              selectTeam.homeTeam!.imageUrl!),
                                          fit: BoxFit.fill,
                                          height: 30.h,
                                          width: 40.w,
                                        )
                                      : SvgPicture.network(
                                          selectTeam.homeTeam!.imageUrl!,
                                          height: 30.h,
                                          width: 40.w,
                                        )
                                  : Image.network(
                                      selectTeam.homeTeam!.imageUrl!,
                                      height: 30.h,
                                      width: 40.w,
                                    ),
                            ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      selectTeam.awayTeam!.imageUrl == null
                          ? Container()
                          : SizedBox(
                              width: 45.w,
                              child: selectTeam.awayTeam!.imageUrl!
                                      .endsWith('svg')
                                  ? controller.sportName == 'CR'
                                      ? Image.network(
                                          replaceSvgWithPng(
                                              selectTeam.awayTeam!.imageUrl!),
                                          fit: BoxFit.fill,
                                          height: 30.h,
                                          width: 40.w,
                                        )
                                      : SvgPicture.network(
                                          selectTeam.awayTeam!.imageUrl!,
                                          height: 30.h,
                                          width: 40.w,
                                        )
                                  : Image.network(
                                      selectTeam.awayTeam!.imageUrl!,
                                      height: 30.h,
                                      width: 40.w,
                                    ),
                            ),
                      horizontalSpace(10.w),
                      SizedBox(
                        width: Get.width * 0.25,
                        child: Text(
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          selectTeam.awayTeam!.name!,
                          style: globalTextStyle(
                              fontSize:
                                  AppSizing.isMobile(context) ? 14.sp : 12.sp),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(right: 5.w),
                  padding: const EdgeInsets.all(2.5),
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColors.borderColor),
                      borderRadius: BorderRadius.circular(5.r),
                      color: AppColors.grey),
                  child: Container(
                    padding: EdgeInsets.only(
                        top: 8.h, bottom: 8.h, left: 10.w, right: 10.w),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.borderColor),
                      borderRadius: BorderRadius.circular(2.5.r),
                      color: AppColors.white,
                    ),
                    child: Column(children: [
                      Text(
                        'noofDraw'.tr,
                        style: globalTextStyle2(
                            fontSize:
                                AppSizing.isMobile(context) ? 12.sp : 10.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.textGray),
                      ),
                      verticalSpace(5.h),
                      Obx(
                        () => Text(
                          controller.drawsList.length
                              .toString()
                              .padLeft(2, '0'),
                          style: globalTextStyle(
                              fontSize:
                                  AppSizing.isMobile(context) ? 22.sp : 18.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.dark),
                        ),
                      ),
                    ]),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(right: 5.w),
                  padding: const EdgeInsets.all(2.5),
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColors.borderColor),
                      borderRadius: BorderRadius.circular(5.r),
                      color: AppColors.grey),
                  child: Container(
                    padding: EdgeInsets.only(
                        top: 8.h, bottom: 8.h, left: 10.w, right: 10.w),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.borderColor),
                      borderRadius: BorderRadius.circular(2.5.r),
                      color: AppColors.white,
                    ),
                    child: Column(children: [
                      Text(
                        'pricePool'.tr,
                        style: globalTextStyle2(
                            fontSize:
                                AppSizing.isMobile(context) ? 12.sp : 10.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.textGray),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      verticalSpace(5.h),
                      Obx(
                        () => Text(
                          "\$${controller.prizePool.value.toStringAsFixed(0)}",
                          style: globalTextStyle(
                              fontSize:
                                  AppSizing.isMobile(context) ? 22.sp : 18.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.dark),
                        ),
                      ),
                    ]),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(2.5),
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColors.borderColor),
                      borderRadius: BorderRadius.circular(5.r),
                      color: AppColors.grey),
                  child: Container(
                    padding: EdgeInsets.only(
                        top: 8.h, bottom: 8.h, left: 10.w, right: 10.w),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.borderColor),
                      borderRadius: BorderRadius.circular(2.5.r),
                      color: AppColors.white,
                    ),
                    child: Column(children: [
                      Text(
                        'fees'.tr,
                        style: globalTextStyle2(
                            fontSize:
                                AppSizing.isMobile(context) ? 12.sp : 10.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.textGray),
                      ),
                      verticalSpace(5.h),
                      Obx(
                        () => Text(
                          "\$${controller.entryFee.value.toStringAsFixed(0)}",
                          style: globalTextStyle(
                              fontSize:
                                  AppSizing.isMobile(context) ? 22.sp : 18.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.dark),
                        ),
                      ),
                    ]),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
