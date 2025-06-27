import 'package:fmlfantasy/app/app_images/app_images.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/ui/components/home_appbar.dart';
import 'package:fmlfantasy/ui/views/sport_pick_inner_leaderboard/controller/sport_pick_inner_leaderboard_controller.dart';
import 'package:fmlfantasy/ui/views/sport_pick_inner_leaderboard/widget/label_and_toggle.dart';
import 'package:fmlfantasy/ui/views/sport_pick_inner_leaderboard/widget/sport_pick_top_players.dart';
import 'package:fmlfantasy/ui/views/sport_pick_inner_leaderboard/widget/sport_picker_button.dart';
import 'package:fmlfantasy/ui/widgets/navigation_buttons.dart';

class SportPickInnerLeaderboard
    extends GetView<SportPickInnerLeaderboardController> {
  const SportPickInnerLeaderboard({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SportPickInnerLeaderboardController());
    return GetBuilder<SportPickInnerLeaderboardController>(
      builder: (controller) => Scaffold(
        appBar: const HomeAppBar(title: 'Sport Pick Inner Leaderboard'),
        body: controller.isLoading
            ? const Center(child: CircularProgressIndicator())
            : GetBuilder(
                builder: (SportPickInnerLeaderboardController controller) =>
                    CustomScrollView(
                  slivers: [
                    const NavigationButtons(),
                    // SliverAppBar(
                    //   automaticallyImplyLeading: false,
                    //   pinned: true,
                    //   collapsedHeight: 80.h,
                    //   backgroundColor: Colors.white,
                    //   elevation: 0,
                    //   flexibleSpace: Column(
                    //     children: [
                    //       Padding(
                    //         padding: EdgeInsets.only(
                    //           left: 15.w,
                    //           right: 15.w,
                    //           top: 20.h,
                    //         ),
                    //         child: Row(
                    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //           children: [
                    //             Column(
                    //               mainAxisAlignment: MainAxisAlignment.start,
                    //               crossAxisAlignment: CrossAxisAlignment.start,
                    //               children: [
                    //                 Text(
                    //                   controller.drawsLeaderboardMatches
                    //                           .winnerTeamName ??
                    //                       '-',
                    //                   style: globalTextStyle(
                    //                       fontSize: 18.sp,
                    //                       fontWeight: FontWeight.w600),
                    //                 ),
                    //                 verticalSpace(5.h),
                    //                 Container(
                    //                   alignment: Alignment.center,
                    //                   padding: EdgeInsets.only(
                    //                       left: 10.w,
                    //                       right: 10.w,
                    //                       top: 5.h,
                    //                       bottom: 5.h),
                    //                   decoration: BoxDecoration(
                    //                     color: AppColors.grey,
                    //                     borderRadius:
                    //                         BorderRadius.circular(5.r),
                    //                   ),
                    //                   child: Text(
                    //                     'Won',
                    //                     style: globalTextStyle(
                    //                         fontSize: 14.sp,
                    //                         fontWeight: FontWeight.w600,
                    //                         color: AppColors.primary),
                    //                   ),
                    //                 )
                    //               ],
                    //             ),
                    //             controller.drawsLeaderboardMatches
                    //                             .winnerTeamImageUrl ==
                    //                         null ||
                    //                     controller.drawsLeaderboardMatches
                    //                             .winnerTeamImageUrl ==
                    //                         ''
                    //                 ? Container()
                    //                 : controller.drawsLeaderboardMatches
                    //                         .winnerTeamImageUrl!
                    //                         .endsWith('.svg')
                    //                     ? SvgPicture.network(
                    //                         controller.drawsLeaderboardMatches
                    //                             .winnerTeamImageUrl!,
                    //                         height: 40.h,
                    //                         width: 40.w)
                    //                     : Image.network(
                    //                         controller.drawsLeaderboardMatches
                    //                             .winnerTeamImageUrl!,
                    //                         height: 40.h,
                    //                         width: 40.w),
                    //           ],
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 15.w, right: 15.w, bottom: 10.h),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            verticalSpace(20.h),
                            const SportPickInnerLabelAndToggle(),
                            verticalSpace(10.h),
                            const SportPickTopPlayers(),
                            verticalSpace(10.h),
                            SportPickerButton(
                                onPressed: () {},
                                title: 'Go to Match Center',
                                iconPath: AppImages.viewMatchIcon),
                            verticalSpace(10.h),
                            // InnerLeaderboard(
                            //     leaderboard:
                            //         controller.drawsLeaderboardMatches),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
