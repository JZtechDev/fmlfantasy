import 'package:fmlfantasy/app/app_colors/app_colors.dart';
import 'package:fmlfantasy/app/app_sizings.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/ui/helpers/commons.dart';
import 'package:fmlfantasy/ui/views/select_players/controller/select_player_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SelectedPlayer extends GetView<SelectPlayerController> {
  const SelectedPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SelectPlayerController());
    return LayoutBuilder(builder: (context, constraints) {
      double textSize = AppSizing.isMobile(context) ? 12.sp : 8.sp;
      return Padding(
        padding: EdgeInsets.only(left: 10.w, right: 10.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Stack(
                children: [
                  Container(
                    height: 30.h,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: AppColors.grey,
                      border: Border.all(color: AppColors.grey),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  Obx(() {
                    return Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        height: 30.h,
                        padding: const EdgeInsets.all(20),
                        clipBehavior: Clip.hardEdge,
                        width:
                            controller.width * controller.getSalaryPercentage(),
                        decoration: BoxDecoration(
                          color: AppColors.primary.withOpacity(0.5),
                          border: Border.all(color: AppColors.grey),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    );
                  }),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 10.w,
                      right: 10.w,
                      top: 10.h,
                      bottom: 10.h,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Obx(
                          () => Text(
                              textAlign: TextAlign.center,
                              '${controller.totalPoints.value.toStringAsFixed(0)},000/100,000',
                              style: globalTextStyle(
                                  fontSize: textSize,
                                  color: AppColors.navyBlue,
                                  fontWeight: FontWeight.w600)),
                        ),
                        Text("salary".tr,
                            style: globalTextStyle(
                                fontSize: textSize,
                                color: AppColors.navyBlue,
                                fontWeight: FontWeight.w600))
                      ],
                    ),
                  ),
                ],
              ),
            ),
            horizontalSpace(10.w),
            Expanded(
              child: Stack(
                children: [
                  Container(
                    height: 30.h,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: AppColors.grey,
                      border: Border.all(color: AppColors.grey),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  Obx(() {
                    return Align(
                      alignment: Alignment.centerLeft,
                      child: AnimatedContainer(
                        height: 30.h,
                        duration: const Duration(microseconds: 1000),
                        padding: const EdgeInsets.all(20),
                        clipBehavior: Clip.hardEdge,
                        width: controller.width *
                            controller.getPlayersPercentage(),
                        decoration: BoxDecoration(
                          color: AppColors.primary.withOpacity(0.5),
                          border: Border.all(color: AppColors.grey),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    );
                  }),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 10.w,
                      right: 10.w,
                      top: 10.h,
                      bottom: 10.h,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 100.w,
                          child: Text(
                            'PlayerSelected'.tr,
                            style: globalTextStyle(
                                fontSize: textSize,
                                color: AppColors.navyBlue,
                                fontWeight: FontWeight.w600),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                        Obx(() => Text(
                            "${controller.selectedPlayers.length.toString()}/11",
                            style: globalTextStyle(
                                fontSize: textSize,
                                color: AppColors.navyBlue,
                                fontWeight: FontWeight.w600))),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
