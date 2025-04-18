import 'package:fmlfantasy/app/app_images/app_images.dart';
import 'package:fmlfantasy/app/app_sizings.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/ui/views/monthly_leaderboard/controller/monthly_leaderboard_controller.dart';
import 'package:flutter_svg/svg.dart';

class LabelText extends GetView<MonthlyLeaderboardController> {
  const LabelText({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MonthlyLeaderboardController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Match'.tr,
              style: globalTextStyle(
                  fontSize: AppSizing.isMobile(context) ? 24.sp : 16.sp,
                  fontWeight: FontWeight.w600),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              'LeaderBoard'.tr,
              style: globalTextStyle(
                  fontSize: AppSizing.isMobile(context) ? 24.sp : 16.sp,
                  fontWeight: FontWeight.w600),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
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
    );
  }
}
