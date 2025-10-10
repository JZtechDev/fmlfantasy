import 'package:fmlfantasy/model/match_center_inner.dart';
import 'package:fmlfantasy/new_model/match_center_inner_new.dart';
import 'package:fmlfantasy/ui/views/match_center/controller/match_center_inner_controller.dart';
import 'package:fmlfantasy/ui/views/match_center/widget/american_football_preview.dart';
import 'package:fmlfantasy/ui/views/match_center/widget/cricket_top_container.dart';
import 'package:fmlfantasy/ui/views/match_center/widget/football_preview_container.dart';
import 'package:fmlfantasy/ui/views/match_center/widget/top_container.dart';

import '../../../../core/imports/imports.dart';

class MatchPreview extends GetView<MatchCenterInner> {
  final MatchCenterInnerNew data;
  const MatchPreview({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    Get.put(MatchCenterInner());
    return Builder(
      builder: (context) {
        switch (controller.selectedSports) {
          case 'CR':
            return CricketTopContainer(
              data.homeTeamName,
              data.awayTeamName,
              data.homeTeamImageUrl,
              data.awayTeamImageUrl,
              data.homeTeamScores.first.toString(),
              data.homeTeamScores[1].toString(),
              data.poM1,
              data.tournamentName,
              '09/02/2023',
              data.homeTeamScores.toString(),
              data.awayTeamScores.toString(),
            );
          case 'AF':
            return AmericanFootballPreview(data: data);
          default:
            return CricketTopContainer(
              data.awayTeamName,
              data.awayTeamName,
              data.homeTeamImageUrl,
              data.awayTeamImageUrl,
              '${data.homeTeamScores.toString()}/${data.homeTeamScores.toString()}',
              '${data.homeTeamScores.toString()}/${data.homeTeamScores.toString()}',
              data.poM1,
              data.result,
              data.resultMsg,
              data.homeTeamScores.toString(),
              data.homeTeamScores.toString(),
            );
        }
      },
    );
  }
}
