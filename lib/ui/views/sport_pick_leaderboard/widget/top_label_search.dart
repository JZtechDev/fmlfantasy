import 'package:fmlfantasy/app/app_images/app_images.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/ui/views/sport_pick_leaderboard/controller/sport_pick_leaderboard_controller.dart';
import 'package:flutter_svg/svg.dart';

class TopLabelAndSearch extends GetView<SportPickLeaderboardController> {
  const TopLabelAndSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Leaderboard',
          style: globalTextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700),
        ),
        Expanded(child: Container()),
        GestureDetector(
            onTap: () {
              controller.isSearch.value = !controller.isSearch.value;
            },
            child: Obx(
              () => AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                padding: const EdgeInsets.all(10),
                alignment: Alignment.center,
                height: 36.h,
                width: 36.w,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: controller.isSearch.value
                        ? AppColors.secondary
                        : AppColors.primaryVeryDark),
                child: SvgPicture.asset(
                  AppImages.search,
                  height: 25.h,
                  width: 25.w,
                  // ignore: deprecated_member_use
                  color: controller.isSearch.value
                      ? AppColors.white
                      : AppColors.white,
                ),
              ),
            )),
      ],
    );
  }
}
