import 'package:fmlfantasy/app/app_colors/app_colors.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/ui/views/select_players/controller/select_player_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class FilterContainer extends GetView<SelectPlayerController> {
  final String? homeTeamName;
  final String? awayTeamName;
  const FilterContainer(
      {super.key, required this.homeTeamName, required this.awayTeamName});

  @override
  Widget build(BuildContext context) {
    Get.put(SelectPlayerController());
    return Obx(() {
      return AnimatedContainer(
        margin: EdgeInsets.only(left: 10.w, right: 10.w),
        padding: const EdgeInsets.all(1),
        duration: const Duration(milliseconds: 300),
        clipBehavior: Clip.hardEdge,
        width: Get.width * 0.45,
        decoration: BoxDecoration(
            color: AppColors.secondary, borderRadius: BorderRadius.circular(5)),
        child: Column(
          children: [
            SizedBox(
              width: Get.width * 0.45,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Obx(
                      () => GestureDetector(
                        onTap: () {
                          controller.isSelectedTeamFliter.value = 'home';
                        },
                        child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: controller.isSelectedTeamFliter.value ==
                                      'home'
                                  ? AppColors.secondary
                                  : AppColors.backgroud,
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(5),
                                bottomLeft: Radius.circular(5),
                              ),
                            ),
                            child: Text(
                              homeTeamName!.split(' ').first, // Take first word
                              style: globalTextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w800,
                                  color:
                                      controller.isSelectedTeamFliter.value ==
                                              'home'
                                          ? AppColors.darkGreen
                                          : AppColors.secondary),
                            )),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        controller.isSelectedTeamFliter.value = 'away';
                      },
                      child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color:
                                controller.isSelectedTeamFliter.value == 'away'
                                    ? AppColors.secondary
                                    : AppColors.backgroud,
                            borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(5),
                                bottomRight: Radius.circular(5)),
                          ),
                          child: Center(
                            child: Text(
                              awayTeamName!.split(' ').first,
                              style: globalTextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w800,
                                  color:
                                      controller.isSelectedTeamFliter.value ==
                                              'away'
                                          ? AppColors.darkGreen
                                          : AppColors.secondary),
                            ),
                          )),
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
