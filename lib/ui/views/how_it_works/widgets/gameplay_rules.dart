import 'package:fmlfantasy/app/app_colors/app_colors.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/ui/helpers/commons.dart';
import 'package:fmlfantasy/ui/views/how_it_works/controller/how_it_works_controller.dart';
import 'package:fmlfantasy/ui/views/how_it_works/widgets/points_grid.dart';
import 'package:fmlfantasy/ui/widgets/dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class GamePlayRulesContainer extends GetView<HowItWorksController> {
  const GamePlayRulesContainer({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HowItWorksController());
    return LayoutBuilder(builder: (context, constraints) {
      double maxWidth = constraints.maxWidth;
      return Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(5.r),
          ),
          child: Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.r),
              color: AppColors.grey,
            ),
            child: Column(
              children: [
                verticalSpace(10),
                Padding(
                  padding: EdgeInsets.only(
                    left: 10.w,
                    right: 10.w,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.r),
                      color: AppColors.white,
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            left: 10.w,
                            right: 10.w,
                            top: 10.h,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Obx(
                                () => Image.asset(
                                  controller.getIconPath(
                                      controller.selectedSport.value),
                                  height: 20.h,
                                  width: 20.w,
                                ),
                              ),
                              horizontalSpace(10.w),
                              Text(
                                'gamePlayRules'.tr,
                                style: globalTextStyle(fontSize: 16.sp),
                              ),
                            ],
                          ),
                        ),
                        Obx(
                          () => Padding(
                            padding: const EdgeInsets.only(
                                left: 10, right: 10, top: 10, bottom: 10),
                            child: AppDropdown(
                              items: controller.allTitles,
                              hint: controller.isDropDownOpened.value
                                  ? 'Selected '
                                  : 'selectyoursport'.tr,
                              dropdownColor: AppColors.primary,
                              titleColor: AppColors.dark,
                              hintTextColor: AppColors.white,
                              selectedTextColor: AppColors.white,
                              trailingColor: AppColors.white,
                              fontSize: maxWidth > 600 ? 10.sp : 12.sp,
                              value: controller.selectedTitle.value,
                              onChanged: (value) {
                                controller.selectedTitle.value = value!;
                                controller.updateInnerTitlesList();
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                verticalSpace(10),
                const GameplayPointsGrid()
              ],
            ),
          ),
        ),
      );
    });
  }
}
