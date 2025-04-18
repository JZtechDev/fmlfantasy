import 'package:fmlfantasy/app/app_colors/app_colors.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/ui/helpers/commons.dart';
import 'package:fmlfantasy/ui/helpers/get_initials.dart';
import 'package:fmlfantasy/ui/views/select_players/controller/select_player_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class Positions extends GetView<SelectPlayerController> {
  const Positions({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: EdgeInsets.only(left: 10.w, right: 10.w),
        child: Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: controller.postionsList.map((item) {
              return Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 7.h, bottom: 7.h),
                    decoration: BoxDecoration(
                      color: AppColors.grey,
                      border: Border.all(color: AppColors.grey),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 10.w, right: 10.w),
                      child: Column(
                        children: [
                          Text(
                            item.positionName!,
                            style: globalTextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 3.h),
                          SvgPicture.asset(
                            item.positionImage!,
                            height: 30.h,
                            //width: 18.4.w,
                          ),
                          SizedBox(height: 3.h),
                          Text(
                            controller.selectedPlayers
                                .where((e) =>
                                    getInitials(e.position!) ==
                                    item.positionName)
                                .length
                                .toString(),
                            style: globalTextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  horizontalSpace(5),
                ],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
