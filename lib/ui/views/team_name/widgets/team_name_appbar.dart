import 'package:fmlfantasy/app/app_colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class TeamNameAppBar extends StatelessWidget {
  const TeamNameAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 50.h,
          left: 7.w,
          child: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Container(
              padding: EdgeInsets.only(
                  left: 11.w, right: 11.w, top: 8.h, bottom: 8.h),
              decoration: BoxDecoration(
                color: AppColors.grey,
                border: Border.all(color: AppColors.borderColor, width: 1),
                borderRadius: BorderRadius.circular(5),
              ),
              child: SvgPicture.asset(
                'assets/icons/back.svg',
              ),
            ),
          ),
        ),
        Positioned(
          top: 42.h,
          left: 30.w,
          right: 30.w,
          child: SvgPicture.asset(
            'assets/logo/logo.svg',
            height: 45.h,
            width: 135.w,
          ),
        ),
        Positioned(
          top: 45.h,
          //left: 30.w,
          right: 12.w,
          child: SvgPicture.asset(
            'assets/images/user.svg',
            height: 28.h,
            width: 28.w,
          ),
        ),
      ],
    );
  }
}
