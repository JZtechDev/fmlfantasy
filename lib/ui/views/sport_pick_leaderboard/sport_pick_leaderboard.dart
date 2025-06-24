import 'dart:developer';

import 'package:fmlfantasy/core/config/global_instances.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/ui/components/custom_sliver.dart';
import 'package:fmlfantasy/ui/components/home_appbar.dart';
import 'package:fmlfantasy/ui/views/sport_pick_leaderboard/controller/sport_pick_leaderboard_controller.dart';
import 'package:fmlfantasy/ui/views/sport_pick_leaderboard/widget/sport_leaderboard_list_item.dart';
import 'package:fmlfantasy/ui/views/sport_pick_leaderboard/widget/top_label_search.dart';
import 'package:fmlfantasy/ui/widgets/app_textfield.dart';
import 'package:flutter/rendering.dart';
import 'package:fmlfantasy/ui/widgets/dashboard_button.dart';

class SportPickLeaderboard extends GetView<SportPickLeaderboardController> {
  const SportPickLeaderboard({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SportPickLeaderboardController());
    return Scaffold(
        //resizeToAvoidBottomInset: true,
        appBar: HomeAppBar(title: 'Sport Pick Leaderboard'),
        body: CustomScrollView(slivers: [
          CustomSliver(
            appBar: Obx(
              () => SportsTabBar(
                sportsList: controller.sportsList,
                selectedIndex: controller.sportsList
                    .indexWhere((sport) => sport.title == selectedSPort.value),
                onTap: (index) {
                  selectedSPort.value = controller.sportsList[index].title;
                  controller.selectedIndex.value = index;
                  controller.selectedSport.value =
                      controller.sportsList[index].title;
                  controller.getSportsName();
                  controller.getSportsId();
                  controller.fetchDrawsLeaderboardMatches();
                },
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Column(
                children: [
                  DashboardButton(),
                  const TopLabelAndSearch(),
                  verticalSpace(20.h),
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
                            labelText: 'Search',
                            controller: controller.searchController,
                            onChanged: (value) {
                              controller.searchQuery.value = value;
                            },
                          ),
                        )),
                  ),
                  verticalSpace(5.h),
                  Obx(() {
                    final query = controller.searchQuery.value.toLowerCase();
                    final filteredList =
                        controller.drawsLeaderboardMatches.where((item) {
                      return item.homeTeamName!.toLowerCase().contains(query) ||
                          item.awayTeamName!.toLowerCase().contains(query);
                    }).toList();
                    return Column(
                      children: [
                        ...filteredList.map((e) {
                          return GestureDetector(
                              onTap: () {
                                log(e.matchKey!);
                                Get.toNamed(AppRoutes.sportPickInnerLeaderboard,
                                    arguments: {
                                      'matchKey': e.matchKey,
                                      'sportsId': controller.sportsValue.value
                                    });
                              },
                              child: SportLeaderboardListItem(matches: e));
                        })
                      ],
                    );
                  }),
                ],
              ),
            ),
          ),
        ]));
  }
}
