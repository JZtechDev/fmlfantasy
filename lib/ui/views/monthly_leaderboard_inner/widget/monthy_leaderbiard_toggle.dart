import 'package:fmlfantasy/ui/helpers/commons.dart';
import 'package:fmlfantasy/ui/views/monthly_leaderboard/controller/monthly_leaderboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class MonthlyLeaderboardToggle extends GetView<MonthlyLeaderboardController> {
  final String iconPathN;
  final String iconPathP;
  final VoidCallback onPrevious;
  final VoidCallback onNext;
  final Color previousButtonColor;
  final Color previousIconColor;
  final Color nextButtonColor;
  final Color nextIconColor;

  const MonthlyLeaderboardToggle({
    super.key,
    required this.iconPathN,
    required this.iconPathP,
    required this.onPrevious,
    required this.onNext,
    required this.previousButtonColor,
    required this.nextButtonColor,
    required this.previousIconColor,
    required this.nextIconColor,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(MonthlyLeaderboardController());
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: onPrevious,
                child: Container(
                  height: 30.h,
                  width: 30.w,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: previousButtonColor),
                  child: SvgPicture.asset('assets/icons/arrowleft.svg',
                      // ignore: deprecated_member_use
                      color: previousIconColor),
                ),
              ),
              horizontalSpace(10.w),
              GestureDetector(
                onTap: onNext,
                child: Container(
                  height: 30.h,
                  width: 30.w,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: nextButtonColor),
                  child: SvgPicture.asset('assets/icons/arrowright.svg',
                      // ignore: deprecated_member_use
                      color: nextIconColor),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

 // previous button color
 // previous Icon color
 // next button color
 //  next Icon color
