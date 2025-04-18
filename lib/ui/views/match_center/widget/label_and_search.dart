import 'package:fmlfantasy/app/app_colors/app_colors.dart';
import 'package:fmlfantasy/app/app_images/app_images.dart';
import 'package:fmlfantasy/app/app_sizings.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/ui/views/match_center/controller/match_center_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class LabelAndSearch extends GetView<MatchCenterController> {
  const LabelAndSearch({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MatchCenterController());
    return Padding(
      padding: EdgeInsets.only(left: 10.w, right: 10.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Match Center'.tr,
                style: globalTextStyle(
                    fontSize: AppSizing.isMobile(context) ? 24.sp : 16.sp,
                    fontWeight: FontWeight.w600),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              //verticalSpace(10.h),
            ],
          ),
          GestureDetector(
              onTap: () {
                controller.isSearch.value = !controller.isSearch.value;
              },
              child: Obx(
                () => AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  padding: const EdgeInsets.all(10),
                  alignment: Alignment.center,
                  height: AppSizing.isMobile(context) ? 36.h : 20.sp,
                  width: 36.w,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: controller.isSearch.value
                          ? AppColors.dark
                          : AppColors.white),
                  child: SvgPicture.asset(AppImages.search,
                      height: 25.h,
                      width: 25.w,
                      // ignore: deprecated_member_use
                      color: controller.isSearch.value
                          ? AppColors.white
                          : AppColors.dark),
                ),
              )),
        ],
      ),
    );
  }
}
