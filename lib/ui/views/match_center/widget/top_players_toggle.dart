import 'package:fmlfantasy/ui/helpers/commons.dart';
import 'package:fmlfantasy/ui/views/match_center/controller/match_center_inner_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TopPlayersToggle extends GetView<MatchCenterInner> {
  final String iconPathN;
  final String iconPathP;
  final VoidCallback onPrevious;
  final VoidCallback onNext;
  final Color previousButtonColor;
  final Color previousIconColor;
  final Color nextButtonColor;
  final Color nextIconColor;

  const TopPlayersToggle({
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
    Get.put(MatchCenterInner());
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          children: [
            GestureDetector(
              onTap: onPrevious,
              child: Container(
                height: 40.h,
                width: 40.w,
                alignment: Alignment.center,
                padding: const EdgeInsets.all(5),
                child: Image.asset(
                  'assets/new_images/arrow left.png',
                  height: 25.h,
                  width: 25.w,
                ),
              ),
            ),
            horizontalSpace(Get.width * 0.45),
            GestureDetector(
              onTap: onNext,
              child: Container(
                height: 40.h,
                width: 40.w,
                alignment: Alignment.center,
                padding: const EdgeInsets.all(5),
                child: Image.asset(
                  'assets/new_images/arrow right.png',
                  height: 25.h,
                  width: 25.w,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
