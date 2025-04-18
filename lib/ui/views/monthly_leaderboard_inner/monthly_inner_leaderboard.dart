import 'package:fmlfantasy/app/app_colors/app_colors.dart';
import 'package:fmlfantasy/model/monthly_leader_model.dart';
import 'package:fmlfantasy/ui/components/inner_appbar.dart';
import 'package:fmlfantasy/ui/helpers/commons.dart';
import 'package:fmlfantasy/ui/views/monthly_leaderboard_inner/controller/monthly_inner_leaderboard_controller.dart';
import 'package:fmlfantasy/ui/views/monthly_leaderboard_inner/widget/leaderboard_table.dart';
import 'package:fmlfantasy/ui/views/monthly_leaderboard_inner/widget/top_home_away_team.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'widget/carousel_slider_top_player.dart';

class MonthlyInnerLeaderboard
    extends GetView<MonthlyInnerLeaderboardController> {
  const MonthlyInnerLeaderboard({
    super.key,
    required this.data,
    // required this.homeScore,
    // required this.awayScore,
    // required this.rankings,
    // required this.topPlayers,
    // required this.homeImageUrl,
    // required this.home,
    // required this.awayImageUrl,
    required this.sports,
    // required this.away
  });
  final MonthlyLeaderBoardModel data;
  // final List<Rankings> rankings;
  // final List<TopPlayers> topPlayers;
  // final String homeImageUrl;
  // final String home;
  // final String awayImageUrl;
  // final String away;
  final String sports;
  // final String homeScore;
  // final String awayScore;

  @override
  Widget build(BuildContext context) {
    Get.put(MonthlyInnerLeaderboardController());
    return Scaffold(
      backgroundColor: AppColors.grey,
      appBar: const AppBarInner(
        title: 'Monthly Inner Leaderboard',
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: true,
            pinned: true,
            collapsedHeight: 130.h,
            backgroundColor: Colors.transparent,
            elevation: 0,
            flexibleSpace: TopHomeAwayTeam(
                data.homeImageUrl!,
                data.home!,
                data.awayImageUrl!,
                data.away!,
                data.homeScore!,
                data.awayScore!,
                sports),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                verticalSpace(20.h),
                CarouselSliderTopPlayerToggle(data.topPlayers!),
                verticalSpace(10.h),
                LeaderBoardTable(data.rankings!, data.homeImageUrl!, data.home!,
                    data.awayImageUrl!, data.away!, sports),
                verticalSpace(20.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
