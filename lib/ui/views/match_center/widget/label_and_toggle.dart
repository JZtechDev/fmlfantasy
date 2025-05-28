import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/ui/views/match_center/controller/match_center_inner_controller.dart';
import 'package:fmlfantasy/ui/views/match_center/widget/top_players_toggle.dart';

class LabelAndToggle extends GetView<MatchCenterInner> {
  const LabelAndToggle({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MatchCenterInner());
    return LayoutBuilder(builder: (context, constraints) {
      return Padding(
        padding: EdgeInsets.only(left: 20.w, right: 10.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() {
              return TopPlayersToggle(
                iconPathN: 'assets/icons/arrowright.svg',
                iconPathP: 'assets/icons/arrowright.svg',
                onPrevious: () {
                  controller.onPreviousPlayerCard();
                },
                onNext: () {
                  // ignore: unrelated_type_equality_checks
                  controller.topPlayerCrouselIndex == 3
                      ? null
                      : controller.onNextPlayerCard();
                },
              );
            }),
          ],
        ),
      );
    });
  }
}
