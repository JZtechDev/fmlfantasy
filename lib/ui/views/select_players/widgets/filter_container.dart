import 'package:fmlfantasy/app/app_colors/app_colors.dart';
import 'package:fmlfantasy/app/app_sizings.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/ui/helpers/commons.dart';
import 'package:fmlfantasy/ui/helpers/replace_svg_with_png.dart';
import 'package:fmlfantasy/ui/views/select_players/controller/select_player_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class FilterContainer extends GetView<SelectPlayerController> {
  final String? homeTeamImage;
  final String? awayTeamImage;
  const FilterContainer(
      {super.key, required this.homeTeamImage, required this.awayTeamImage});

  @override
  Widget build(BuildContext context) {
    Get.put(SelectPlayerController());
    return Obx(() {
      return AnimatedContainer(
        margin: EdgeInsets.only(left: 10.w, right: 10.w),
        duration: const Duration(milliseconds: 300),
        clipBehavior: Clip.hardEdge,
        height: controller.isVisible.value ? Get.height * 0.3 : 0,
        width: Get.width,
        decoration: BoxDecoration(
            color: AppColors.white, borderRadius: BorderRadius.circular(5)),
        child: Padding(
          padding:
              EdgeInsets.only(left: 10.w, right: 10.w, top: 5.h, bottom: 5.h),
          child: OverflowBox(
            fit: OverflowBoxFit.deferToChild,
            minHeight: 0,
            maxHeight: Get.height * 0.28,
            child: Column(
              children: [
                verticalSpace(10),
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/bullsket_icons/menu.svg',
                      // ignore: deprecated_member_use
                      color: Colors.black,
                      height: AppSizing.isMobile(context) ? 25.h : 20.h,
                    ),
                    horizontalSpace(3.w),
                    Text(
                      'filter'.tr,
                      style: globalTextStyle(
                          fontSize:
                              AppSizing.isMobile(context) ? 16.sp : 12.sp),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        controller.isSelectedTeamFliter.value = 'none';
                        controller.isPostion.value = '';
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 39.h,
                        width: 110.w,
                        decoration: BoxDecoration(
                          color: AppColors.grey,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          'clearAll'.tr,
                          style: globalTextStyle(
                              fontSize:
                                  AppSizing.isMobile(context) ? 10.sp : 8.sp,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ],
                ),
                verticalSpace(10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Obx(
                        () => GestureDetector(
                          onTap: () {
                            controller.isSelectedTeamFliter.value = 'home';
                          },
                          child: Container(
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: controller.isSelectedTeamFliter.value ==
                                      'home'
                                  ? AppColors.primary
                                  : AppColors.grey,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Center(
                              child: Container(
                                height: 75.h,
                                width: 75.w,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white),
                                child: Center(
                                  child: homeTeamImage == null
                                      ? Container()
                                      : homeTeamImage!.endsWith('.png')
                                          ? Image.network(
                                              homeTeamImage!,
                                              height: 54.3.h,
                                              width: 52.3.w,
                                            )
                                          : controller.sportName == 'CR'
                                              ? Image.network(
                                                  replaceSvgWithPng(
                                                      homeTeamImage!),
                                                  height: 54.3.h,
                                                  width: 52.3.w,
                                                )
                                              : SvgPicture.network(
                                                  homeTeamImage!,
                                                  height: 54.3.h,
                                                  width: 52.3.w,
                                                ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    horizontalSpace(5.w),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          controller.isSelectedTeamFliter.value = 'away';
                        },
                        child: Container(
                          height: 100.h,
                          width: 164.w,
                          decoration: BoxDecoration(
                            color:
                                controller.isSelectedTeamFliter.value == 'away'
                                    ? AppColors.primary
                                    : AppColors.grey,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Center(
                            child: Container(
                              height: 75.h,
                              width: 75.w,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.white),
                              child: Center(
                                child: awayTeamImage == null
                                    ? Container()
                                    : awayTeamImage!.endsWith('.png')
                                        ? Image.network(
                                            awayTeamImage!,
                                            height: 39.h,
                                            width: 52.w,
                                          )
                                        : controller.sportName == 'CR'
                                            ? Image.network(
                                                replaceSvgWithPng(
                                                    awayTeamImage!),
                                                height: 39.h,
                                                width: 52.w,
                                              )
                                            : SvgPicture.network(
                                                awayTeamImage!,
                                                height: 39.h,
                                                width: 52.w,
                                              ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5.h,
                ),
                Obx(
                  () => SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: controller.postionsList.map((item) {
                        return Obx(
                          () => GestureDetector(
                            onTap: () {
                              controller.isPostion.value = item.positionName!;
                              controller.filterPlayersByPosition();
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 5.w),
                              alignment: Alignment.center,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 50),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: controller.isPostion.value ==
                                        item.positionName!
                                    ? AppColors.primary
                                    : AppColors.grey,
                              ),
                              child: Text(
                                item.positionName!,
                                style: globalTextStyle(
                                  fontSize: AppSizing.isMobile(context)
                                      ? 10.sp
                                      : 8.sp,
                                  fontWeight: FontWeight.w600,
                                  color: controller.isPostion.value ==
                                          item.positionName!
                                      ? AppColors.white
                                      : AppColors.dark,
                                ),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
