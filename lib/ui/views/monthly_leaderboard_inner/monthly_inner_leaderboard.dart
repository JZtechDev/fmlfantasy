import 'package:fmlfantasy/app/app_colors/app_colors.dart';
import 'package:fmlfantasy/model/monthly_leader_model.dart';
import 'package:fmlfantasy/ui/components/home_appbar.dart';
import 'package:fmlfantasy/ui/helpers/commons.dart';
import 'package:fmlfantasy/ui/views/monthly_leaderboard_inner/controller/monthly_inner_leaderboard_controller.dart';
import 'package:fmlfantasy/ui/views/monthly_leaderboard_inner/widget/leaderboard_table.dart';
import 'package:fmlfantasy/ui/views/monthly_leaderboard_inner/widget/top_home_away_team.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fmlfantasy/ui/widgets/navigation_buttons.dart';
import 'package:get/get.dart';
import 'widget/carousel_slider_top_player.dart';

class MonthlyInnerLeaderboard
    extends GetView<MonthlyInnerLeaderboardController> {
  const MonthlyInnerLeaderboard({
    super.key,
    required this.data,
    required this.sports,
  });
  final MonthlyLeaderBoardModel data;
  final String sports;

  @override
  Widget build(BuildContext context) {
    Get.put(MonthlyInnerLeaderboardController());
    return Scaffold(
      backgroundColor: AppColors.backgroud,
      appBar: const HomeAppBar(
        title: 'Monthly Inner Leaderboard',
      ),
      body: CustomScrollView(
        slivers: [
          const NavigationButtons(),
          SliverToBoxAdapter(
            child: Column(
              children: [
                verticalSpace(20.h),
                TopHomeAwayTeam(
                    data.homeImageUrl!,
                    data.home!,
                    data.awayImageUrl!,
                    data.away!,
                    data.homeScore!,
                    data.awayScore!,
                    sports),
                CarouselSliderTopPlayerToggle(data.topPlayers!),
                LeaderBoardTable(data.rankings!, data.homeImageUrl!, data.home!,
                    data.awayImageUrl!, data.away!, sports),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
