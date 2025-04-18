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
    return Padding(
      padding: EdgeInsets.only(left: 10.w, right: 10.w),
      child: Builder(
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
                controller.getPlayerName(
                    data.highlights.data.teamA.tab1.tabData, 0),
                controller.getPlayerName(
                    data.highlights.data.teamA.tab1.tabData, 1),
                controller.getPlayerName(
                    data.highlights.data.teamA.tab2.tabData, 0),
                controller.getPlayerName(
                    data.highlights.data.teamA.tab2.tabData, 1),
                controller.getPlayerName(
                    data.highlights.data.teamB.tab1.tabData, 0),
                controller.getPlayerName(
                    data.highlights.data.teamB.tab1.tabData, 1),
                controller.getPlayerName(
                    data.highlights.data.teamB.tab2.tabData, 0),
                controller.getPlayerName(
                    data.highlights.data.teamB.tab2.tabData, 1),
                data.competitionName,
                data.expStartDate,
                data.teamAOvers.toString(),
                data.teamBOvers.toString(),
                "${data.teamBTop1BatsmanRuns?.toStringAsFixed(0).padLeft(2, '0') ?? ''} (${controller.getBallsFaced(data.highlights.data.teamB.tab1.tabData, 0)})",
                "${data.teamBTop2BatsmanRuns?.toStringAsFixed(0).padLeft(2, '0') ?? ''} (${controller.getBallsFaced(data.highlights.data.teamB.tab1.tabData, 1)})",
                "${data.teamBTop1BowlerWickets?.toStringAsFixed(0).padLeft(2, '0')}/${controller.getRunsConceded(data.highlights.data.teamB.tab2.tabData, 0)} (${controller.getOvers(data.highlights.data.teamB.tab2.tabData, 0)})",
                "${data.teamBTop2BowlerWickets?.toStringAsFixed(0).padLeft(2, '0')}/${controller.getRunsConceded(data.highlights.data.teamB.tab2.tabData, 1)} (${controller.getOvers(data.highlights.data.teamB.tab2.tabData, 1)})",
                "${data.teamATop1BatsmanRuns?.toStringAsFixed(0).padLeft(2, '0')} (${controller.getBallsFaced(data.highlights.data.teamA.tab1.tabData, 0)})",
                "${data.teamATop2BatsmanRuns?.toStringAsFixed(0).padLeft(2, '0')} (${controller.getBallsFaced(data.highlights.data.teamA.tab1.tabData, 1)})",
                "${data.teamATop1BowlerWickets?.toStringAsFixed(0).padLeft(2, '0')}/${controller.getRunsConceded(data.highlights.data.teamA.tab2.tabData, 0)} (${controller.getOvers(data.highlights.data.teamA.tab2.tabData, 0)})",
                "${data.teamATop2BowlerWickets?.toStringAsFixed(0).padLeft(2, '0')}/${controller.getRunsConceded(data.highlights.data.teamA.tab2.tabData, 1)} (${controller.getOvers(data.highlights.data.teamA.tab2.tabData, 1)})",
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
              return GeneralTopContainer(
                data.teamAName,
                data.teamBName,
                data.teamAImageUrl,
                data.teamBImageUrl,
                controller.selectedSports == 'CR'
                    ? '${data.teamAScore.toString()}/${data.teamAWickets.toString()}'
                    : "${data.teamAScore}",
                controller.selectedSports == 'CR'
                    ? '${data.teamBScore.toString()}/${data.teamBWickets.toString()}'
                    : "${data.teamBScore}",
                data.playerOfTheMatchName,
                data.periodScore,
                data.competitionName,
                data.expStartDate,
              );
          }
        },
      ),
    );
  }
}
