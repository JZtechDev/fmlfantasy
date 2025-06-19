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
      clipBehavior: Clip.hardEdge,
      //padding: EdgeInsets.only(left: 10.w, top: 10.h, bottom: 5.h, right: 10.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  height: Get.height * 0.09,
                  padding: const EdgeInsets.only(
                      top: 20, left: 10, bottom: 20, right: 10),
                  decoration:
                      const BoxDecoration(color: AppColors.primaryLight),
                  child: Row(
                    children: [
                      selectTeam.homeTeam!.imageUrl == null
                          ? Container()
                          : SizedBox(
                              width: 35.w,
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
                      horizontalSpace(10.w),
                      SizedBox(
                        width: Get.width * 0.2,
                        child: Text(
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          selectTeam.homeTeam!.name!,
                          style: globalTextStyle(
                              color: AppColors.secondary,
                              fontWeight: FontWeight.w700,
                              fontSize:
                                  AppSizing.isMobile(context) ? 14.sp : 12.sp),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              horizontalSpace(1),
              Expanded(
                child: Container(
                  height: Get.height * 0.09,
                  padding: const EdgeInsets.only(
                      top: 20, left: 10, bottom: 20, right: 10),
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(18, 96, 85, 1),
                  ),
                  child: Row(
                    children: [
                      selectTeam.awayTeam!.imageUrl == null
                          ? Container()
                          : SizedBox(
                              width: 35.w,
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
                              color: AppColors.secondary,
                              fontWeight: FontWeight.w700,
                              fontSize:
                                  AppSizing.isMobile(context) ? 14.sp : 12.sp),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          verticalSpace(1),
          Container(
            padding:
                const EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 10),
            decoration: const BoxDecoration(color: AppColors.primary),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(
                        top: 8.h, bottom: 8.h, left: 10.w, right: 10.w),
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.only(bottomLeft: Radius.circular(10.r)),
                      color: AppColors.secondary,
                    ),
                    child: Column(children: [
                      Text(
                        'noofDraw'.tr,
                        style: globalTextStyle2(
                            fontSize:
                                AppSizing.isMobile(context) ? 12.sp : 10.sp,
                            fontWeight: FontWeight.w700,
                            color: AppColors.backgroud),
                      ),
                      verticalSpace(2.h),
                      Obx(
                        () => Text(
                          controller.drawsList.length
                              .toString()
                              .padLeft(2, '0'),
                          style: globalTextStyle(
                              fontSize:
                                  AppSizing.isMobile(context) ? 18.sp : 18.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.backgroud),
                        ),
                      ),
                    ]),
                  ),
                ),
                horizontalSpace(2),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(
                        top: 8.h, bottom: 8.h, left: 10.w, right: 10.w),
                    decoration: const BoxDecoration(
                      color: AppColors.secondary,
                    ),
                    child: Column(children: [
                      Text(
                        'pricePool'.tr,
                        style: globalTextStyle2(
                            fontSize:
                                AppSizing.isMobile(context) ? 12.sp : 10.sp,
                            fontWeight: FontWeight.w700,
                            color: AppColors.backgroud),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      verticalSpace(2.h),
                      Obx(
                        () => Text(
                          "\$${controller.prizePool.value.toStringAsFixed(0)}",
                          style: globalTextStyle(
                              fontSize:
                                  AppSizing.isMobile(context) ? 18.sp : 18.sp,
                              fontWeight: FontWeight.w700,
                              color: AppColors.backgroud),
                        ),
                      ),
                    ]),
                  ),
                ),
                horizontalSpace(2),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(
                        top: 8.h, bottom: 8.h, left: 10.w, right: 10.w),
                    decoration: BoxDecoration(
                      color: AppColors.secondary,
                      borderRadius:
                          BorderRadius.only(bottomRight: Radius.circular(10.r)),
                    ),
                    child: Column(children: [
                      Text(
                        'fees'.tr,
                        style: globalTextStyle2(
                            fontSize:
                                AppSizing.isMobile(context) ? 12.sp : 10.sp,
                            fontWeight: FontWeight.w700,
                            color: AppColors.backgroud),
                      ),
                      verticalSpace(2.h),
                      Obx(
                        () => Text(
                          "\$${controller.entryFee.value.toStringAsFixed(0)}",
                          style: globalTextStyle(
                              fontSize:
                                  AppSizing.isMobile(context) ? 18.sp : 18.sp,
                              fontWeight: FontWeight.w700,
                              color: AppColors.backgroud),
                        ),
                      ),
                    ]),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
