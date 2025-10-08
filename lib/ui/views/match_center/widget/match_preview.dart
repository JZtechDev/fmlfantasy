import 'package:fmlfantasy/model/match_center_inner.dart';
import 'package:fmlfantasy/ui/views/match_center/controller/match_center_inner_controller.dart';
import 'package:fmlfantasy/ui/views/match_center/widget/cricket_top_container.dart';
import 'package:fmlfantasy/ui/views/match_center/widget/football_preview_container.dart';
import 'package:fmlfantasy/ui/views/match_center/widget/top_container.dart';

import '../../../../core/imports/imports.dart';

class MatchPreview extends GetView<MatchCenterInner> {
  final InnerMatchCenterModel data;
  const MatchPreview({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    Get.put(MatchCenterInner());
    return Builder(
      builder: (context) {
        switch (controller.selectedSports) {
          case 'CR':
            return CricketTopContainer(
              data.highlights.data.teamA.teamName,
              data.highlights.data.teamB.teamName,
              data.teamAImageUrl,
              data.teamBImageUrl,
              '${data.teamAScore.toString()}/${data.teamAWickets.toString()}',
              '${data.teamBScore.toString()}/${data.teamBWickets.toString()}',
              data.playerOfTheMatchName,
              data.competitionName,
              data.expStartDate,
              data.teamAOvers.toString(),
              data.teamBOvers.toString(),
            );

          case 'FB':
            return FootballTopContainer(
              data.teamAName,
              data.teamBName,
              data.teamAImageUrl,
              data.teamBImageUrl,
              "${data.teamAScore}",
              "${data.teamBScore}",
              data.playerOfTheMatchName,
              data.expStartDate,
              data.competitionName,
              data.matchVenue,
            );
          default:
            return TopContainerGeneral(
              data.highlights.data.teamA.teamName,
              data.highlights.data.teamB.teamName,
              data.teamAImageUrl,
              data.teamBImageUrl,
              data.teamAScore.toString(),
              data.teamBScore.toString(),
              data.playerOfTheMatchName,
              data.competitionName,
              data.expStartDate,
              data.teamAOvers.toString(),
              data.teamBOvers.toString(),
            );
        }
      },
    );
  }
}
