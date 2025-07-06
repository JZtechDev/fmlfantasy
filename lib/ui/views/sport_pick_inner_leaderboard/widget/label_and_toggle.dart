import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/ui/views/match_center/widget/top_players_toggle.dart';
import 'package:fmlfantasy/ui/views/sport_pick_inner_leaderboard/controller/sport_pick_inner_leaderboard_controller.dart';

class SportPickInnerLabelAndToggle
    extends GetView<SportPickInnerLeaderboardController> {
  const SportPickInnerLabelAndToggle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Top Players',
          style: globalTextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700),
        ),
        Center(
          child: TopPlayersToggle(
            iconPathN: 'assets/icons/arrowright.svg',
            iconPathP: 'assets/icons/arrowright.svg',
            onPrevious: () {
              controller.onPreviousPublicCard();
            },
            onNext: () {
              controller.onNextPublicCard();
            },
          ),
        ),
      ],
    );
  }
}
