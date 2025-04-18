import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/ui/views/sport_pick_inner_leaderboard/controller/sport_pick_inner_leaderboard_controller.dart';
import 'package:fmlfantasy/ui/views/sport_pick_inner_leaderboard/widget/sport_pick_toggle.dart';

class SportPickInnerLabelAndToggle
    extends GetView<SportPickInnerLeaderboardController> {
  const SportPickInnerLabelAndToggle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Top Players',
          style: globalTextStyle(fontSize: 28.sp, fontWeight: FontWeight.w600),
        ),
        SportPickToggle(
          iconPathN: 'assets/icons/arrowright.svg',
          iconPathP: 'assets/icons/arrowright.svg',
          onPrevious: () {
            controller.onPreviousPublicCard();
          },
          onNext: () {
            controller.onNextPublicCard();
          },
          previousButtonColor: controller.sportPickCrouselIndex.value + 1 ==
                  controller.sportPickerInnerSliderList.length - 1
              ? AppColors.dark
              : AppColors.white,
          nextButtonColor: controller.sportPickCrouselIndex.value + 1 ==
                  controller.sportPickerInnerSliderList.length - 1
              ? AppColors.white
              : AppColors.dark,
          previousIconColor: controller.sportPickCrouselIndex.value + 1 ==
                  controller.sportPickerInnerSliderList.length - 1
              ? AppColors.white
              : AppColors.dark,
          nextIconColor: controller.sportPickCrouselIndex.value + 1 ==
                  controller.sportPickerInnerSliderList.length - 1
              ? AppColors.dark
              : AppColors.white,
        )
      ],
    );
  }
}
