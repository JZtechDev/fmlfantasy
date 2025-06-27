import 'package:fmlfantasy/ui/helpers/commons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TopPlayersToggle extends StatelessWidget {
  final String iconPathN;
  final String iconPathP;
  final VoidCallback onPrevious;
  final VoidCallback onNext;

  const TopPlayersToggle({
    super.key,
    required this.iconPathN,
    required this.iconPathP,
    required this.onPrevious,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
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
