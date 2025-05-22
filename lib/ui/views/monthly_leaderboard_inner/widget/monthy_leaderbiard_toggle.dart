import 'package:fmlfantasy/ui/views/monthly_leaderboard/controller/monthly_leaderboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MonthlyLeaderboardToggle extends GetView<MonthlyLeaderboardController> {
  final String iconPathN;
  final String iconPathP;
  final VoidCallback onPrevious;
  final VoidCallback onNext;

  const MonthlyLeaderboardToggle({
    super.key,
    required this.iconPathN,
    required this.iconPathP,
    required this.onPrevious,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(MonthlyLeaderboardController());
    return Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Row(
          children: [
            GestureDetector(
              onTap: onPrevious,
              child: Container(
                height: 40.h,
                width: 40.w,
                alignment: Alignment.center,
                //padding: const EdgeInsets.all(5),
                child: Image.asset(
                  'assets/new_images/arrow left.png',
                  height: 25.h,
                  width: 25.w,
                ),
              ),
            ),
            Expanded(
              child: Container(),
            ),
            GestureDetector(
              onTap: onNext,
              child: Container(
                height: 40.h,
                width: 40.w,
                alignment: Alignment.center,
                //padding: const EdgeInsets.all(5),
                child: Image.asset(
                  'assets/new_images/arrow right.png',
                  height: 25.h,
                  width: 25.w,
                ),
              ),
            ),
          ],
        ));
  }
}
