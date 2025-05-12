import 'package:fmlfantasy/app/app_images/app_images.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/model/match_center_inner.dart';
import 'package:fmlfantasy/ui/components/home_appbar.dart';
import 'package:fmlfantasy/ui/views/match_center/controller/match_center_inner_controller.dart';
import 'package:fmlfantasy/ui/views/match_center/widget/label_and_toggle.dart';
import 'package:fmlfantasy/ui/views/match_center/widget/lineup_and_formation.dart';
import 'package:fmlfantasy/ui/views/match_center/widget/match_preview.dart';
import 'package:fmlfantasy/ui/views/match_center/widget/past_matches.dart';
import 'package:fmlfantasy/ui/views/match_center/widget/team_and_lineup_tabs.dart';
import 'package:fmlfantasy/ui/views/match_center/widget/top_players_sider.dart';
import 'package:fmlfantasy/ui/widgets/dashboard_button.dart';
import 'package:fmlfantasy/ui/widgets/privious_button.dart';

class MatchCenterInnerView extends GetView<MatchCenterInner> {
  const MatchCenterInnerView({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    Get.put(MatchCenterInner());
    return Scaffold(
        appBar: HomeAppBar(title: 'matchcenter'.tr),
        body: LayoutBuilder(builder: (context, constraints) {
          return CustomScrollView(slivers: [
            SliverToBoxAdapter(
                child: Column(children: [
              const Padding(
                padding:
                    EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [PreviousButton(), DashboardButton()],
                ),
              ),
              const PastMatchesSlider(),
              Obx(() {
                if (controller.isLoading.value) {
                  return Container();
                } else if (controller.hasError.value) {
                  return Center(child: Text('erroroccurred'.tr));
                } else if (controller.matchCenterInnerData.isEmpty) {
                  return Container();
                } else {
                  InnerMatchCenterModel data =
                      controller.matchCenterInnerData[0];
                  return Column(
                    children: [
                      MatchPreview(data: data),
                      Container(
                        width: Get.width,
                        padding: EdgeInsets.only(
                            left: 10.w, right: 10.w, bottom: 10.h, top: 10.h),
                        decoration: const BoxDecoration(
                          color: AppColors.primary,
                        ),
                        child: Column(
                          children: [
                            Image.asset(AppImages.star, height: 20, width: 20),
                            Text('Player of the Match'.tr,
                                style: globalTextStyle2(
                                    fontSize: 12.sp,
                                    color: AppColors.white,
                                    fontWeight: FontWeight.w700)),
                            Text(data.playerOfTheMatchName ?? '',
                                style: globalTextStyle2(
                                    fontSize: 12.sp,
                                    color: AppColors.white,
                                    fontWeight: FontWeight.w700)),
                          ],
                        ),
                      ),
                      verticalSpace(10.h),
                      const LabelAndToggle(),
                      TopPlayersSider(data: data),
                      verticalSpace(30.h),
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
