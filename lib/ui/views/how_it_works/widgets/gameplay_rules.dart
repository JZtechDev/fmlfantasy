import 'package:fmlfantasy/app/app_colors/app_colors.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/ui/views/how_it_works/controller/how_it_works_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fmlfantasy/ui/views/how_it_works/widgets/points_grid.dart';
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
        child: Column(
          children: [
            Obx(
              () => Padding(
                padding: const EdgeInsets.only(
                    left: 10, right: 10, top: 10, bottom: 10),
                child: Container(
                  width: Get.width,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(101, 184, 172, 1),
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: controller.allTitles.map((title) {
                        final isSelected =
                            controller.selectedTitle.value == title;
                        return GestureDetector(
                          onTap: () {
                            controller.selectedTitle.value = title;
                            controller.updateInnerTitlesList();
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 7.w, vertical: 8.h),
                            padding: EdgeInsets.symmetric(
                                horizontal: 16.w, vertical: 10.h),
                            decoration: BoxDecoration(
                              color: isSelected ? AppColors.primary : null,
                              borderRadius: BorderRadius.circular(5.r),
                              border: Border.all(
                                  color: isSelected
                                      ? AppColors.primary
                                      : AppColors.primary),
                            ),
                            child: Text(
                              title.toUpperCase(),
                              style: globalTextStyle(
                                color: isSelected
                                    ? AppColors.white
                                    : AppColors.primary,
                                fontSize: maxWidth > 600 ? 10.sp : 12.sp,
                                fontWeight: isSelected
                                    ? FontWeight.w700
                                    : FontWeight.w600,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
            ),
            const GameplayPointsGrid()
          ],
        ),
      );
    });
  }
}
