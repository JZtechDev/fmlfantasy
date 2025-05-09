import 'package:fmlfantasy/app/app_colors/app_colors.dart';
import 'package:fmlfantasy/core/config/global_instances.dart';
import 'package:fmlfantasy/ui/components/app_appbar.dart';
import 'package:fmlfantasy/ui/components/custom_sliver.dart';
import 'package:fmlfantasy/ui/components/home_appbar.dart';
import 'package:fmlfantasy/ui/components/sports_tab_bar.dart';
import 'package:fmlfantasy/ui/helpers/commons.dart';
import 'package:fmlfantasy/ui/views/monthly_leaderboard/controller/monthly_leaderboard_controller.dart';
import 'package:fmlfantasy/ui/views/monthly_leaderboard/widget/label.dart';
import 'package:fmlfantasy/ui/views/monthly_leaderboard/widget/leaderboard_list.dart';
import 'package:fmlfantasy/ui/views/monthly_leaderboard/widget/leaderboard_shimmer.dart';
import 'package:fmlfantasy/ui/views/monthly_leaderboard_inner/monthly_inner_leaderboard.dart';
import 'package:fmlfantasy/ui/widgets/app_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MonthlyLeaderboard extends GetView<MonthlyLeaderboardController> {
  const MonthlyLeaderboard({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MonthlyLeaderboardController());
    return Scaffold(
      backgroundColor: AppColors.backgroud,
      appBar: const HomeAppBar(title: 'Monthly Leaderboard'),
      body: CustomScrollView(
        slivers: [
          CustomSliver(
            appBar: Obx(() => SportsTabBar(
                sportsList: controller.sportsList,
                selectedIndex: controller.sportsList
                    .indexWhere((sport) => sport.title == selectedSPort.value),
                onTap: (index) {
                  selectedSPort.value = controller.sportsList[index].title;
                  controller.selectedIndex.value = index;
                  controller.selectedSport.value =
                      controller.sportsList[index].title;
                  controller.leaderboard.clear();
                  controller.fetchMonthlyLeaderBoard();
                })),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(left: 15.w, right: 15.w),
              child: Column(
                children: [
                  //verticalSpace(20.h),
                  // const LabelText(),
                  //verticalSpace(10),
                  Obx(
                    () => AnimatedContainer(
                        clipBehavior: Clip.hardEdge,
                        height: controller.isSearch.value ? 60 : 0,
                        duration: const Duration(milliseconds: 400),
                        decoration: BoxDecoration(
                            color: AppColors.grey,
                            borderRadius: BorderRadius.circular(5)),
                        child: OverflowBox(
                          fit: OverflowBoxFit.deferToChild,
                          minHeight: 0,
                          maxHeight: 60,
                          child: AppTextField(
                            fillColor: AppColors.white,
                            labelText: 'search'.tr,
                            controller: controller.searchController,
                            onChanged: (value) {
                              controller.searchQuery.value = value;
                            },
                          ),
                        )),
                  ),
                  verticalSpace(20.h),
                  Obx(() {
                    final query = controller.searchQuery.value.toLowerCase();
                    final filteredList = controller.leaderboard.where((item) {
                      return item.homeShortName!
                              .toLowerCase()
                              .contains(query) ||
                          item.home!.toLowerCase().contains(query) ||
                          item.away!.toLowerCase().contains(query);
                    }).toList();
                    return controller.isLoading.value
                        ? const LeaderboardShimmer()
                        : controller.leaderboard.isEmpty
                            ? Text('noMatchesfound'.tr)
                            : ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                itemCount: filteredList.length,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  final leaderBoardData = filteredList[index];
                                  return GestureDetector(
                                    onTap: () {
                                      if (leaderBoardData.rankings != null &&
                                          leaderBoardData.topPlayers != null) {
                                        Get.to(
                                            () => MonthlyInnerLeaderboard(
                                                  sports: controller
                                                      .selectedSport.value,
                                                  data: leaderBoardData,
                                                ),
                                            arguments: {
                                              'sportName': controller
                                                  .selectedSport.value,
                                            });
                                      }
                                    },
                                    child: LeaderboardListItems(
                                        leaderboard: leaderBoardData),
                                  );
                                },
                              );
                  }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
