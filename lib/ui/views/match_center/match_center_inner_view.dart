import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/model/match_center_inner.dart';
import 'package:fmlfantasy/ui/components/inner_appbar.dart';
import 'package:fmlfantasy/ui/views/match_center/controller/match_center_inner_controller.dart';
import 'package:fmlfantasy/ui/views/match_center/widget/label_and_toggle.dart';
import 'package:fmlfantasy/ui/views/match_center/widget/lineup_and_formation.dart';
import 'package:fmlfantasy/ui/views/match_center/widget/match_preview.dart';
import 'package:fmlfantasy/ui/views/match_center/widget/past_matches.dart';
import 'package:fmlfantasy/ui/views/match_center/widget/skeleton/inner_skeleton.dart';
import 'package:fmlfantasy/ui/views/match_center/widget/skeleton/match_inner_cricket_skeleton.dart';
import 'package:fmlfantasy/ui/views/match_center/widget/skeleton/match_inner_football_skeleton.dart';
import 'package:fmlfantasy/ui/views/match_center/widget/team_and_lineup_tabs.dart';
import 'package:fmlfantasy/ui/views/match_center/widget/top_players_sider.dart';

class MatchCenterInnerView extends GetView<MatchCenterInner> {
  const MatchCenterInnerView({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    Get.put(MatchCenterInner());
    return Scaffold(
        backgroundColor: AppColors.grey,
        appBar: const AppBarInner(title: 'Match Center Leaderboard'),
        body: LayoutBuilder(builder: (context, constraints) {
          return CustomScrollView(slivers: [
            SliverToBoxAdapter(
                child: Column(children: [
              const PastMatchesSlider(),
              Obx(() {
                if (controller.isLoading.value) {
                  return Center(child: Builder(builder: (context) {
                    switch (controller.selectedSports) {
                      case 'FB':
                        return const MatchInnerFBSkeleton();
                      case 'CR':
                        return const MatchInnerCRSkeleton();
                      default:
                        return const InnerMatchCenterSkeleton();
                    }
                  }));
                } else if (controller.hasError.value) {
                  return Center(child: Text('erroroccurred'.tr));
                } else if (controller.matchCenterInnerData.isEmpty) {
                  return Container();
                } else {
                  InnerMatchCenterModel data =
                      controller.matchCenterInnerData[0];
                  return Column(
                    children: [
                      verticalSpace(10.h),
                      MatchPreview(data: data),
                      verticalSpace(10.h),
                      const LabelAndToggle(),
                      verticalSpace(10.h),
                      TopPlayersSider(data: data),
                      verticalSpace(5.h),
                      TeamAndLineupTabs(data: data),
                      verticalSpace(20.h),
                      LineupAndFormation(data: data)
                    ],
                  );
                }
              })
            ]))
          ]);
        }));
  }
}
