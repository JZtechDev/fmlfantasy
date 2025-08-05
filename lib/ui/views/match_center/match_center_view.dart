import 'package:fmlfantasy/app/app%20routes/app_routes.dart';
import 'package:fmlfantasy/app/app_colors/app_colors.dart';
import 'package:fmlfantasy/core/config/global_instances.dart';
import 'package:fmlfantasy/new_model/match_center_matches_new.dart';
import 'package:fmlfantasy/ui/components/custom_sliver.dart';
import 'package:fmlfantasy/ui/components/home_appbar.dart';
import 'package:fmlfantasy/ui/components/sports_tab_bar.dart';
import 'package:fmlfantasy/ui/helpers/commons.dart';
import 'package:fmlfantasy/ui/views/match_center/controller/match_center_controller.dart';
import 'package:fmlfantasy/ui/views/match_center/widget/match_center_tiles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fmlfantasy/ui/widgets/dashboard_button.dart';
import 'package:get/get.dart';

class MatchCenter extends GetView<MatchCenterController> {
  const MatchCenter({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MatchCenterController());
    return Scaffold(
        backgroundColor: AppColors.backgroud,
        appBar: const HomeAppBar(title: 'Match Center'),
        resizeToAvoidBottomInset: true,
        body: CustomScrollView(slivers: [
          CustomSliver(
            appBar: Obx(() {
              return SportsTabBar(
                sportsList: controller.sportsList,
                selectedIndex: controller.sportsList
                    .indexWhere((sport) => sport.title == selectedSPort.value),
                onTap: (index) {
                  selectedSPort.value = controller.sportsList[index].title;
                  controller.selectedIndex.value = index;
                  controller.selectedSport.value =
                      controller.sportsList[index].title;
                },
              );
            }),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                const DashboardButton(),
                verticalSpace(10.h),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      FutureBuilder<List<MatchCenterMatches>>(
                          future: controller.fetchMatchCenterData(),
                          builder: (context, snapshot) {
                            if (snapshot.hasError) {
                              return Text('servererror'.tr);
                            } else if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Container();
                            } else {
                              return Obx(() {
                                final query =
                                    controller.searchQuery.value.toLowerCase();
                                final filteredList =
                                    snapshot.data!.where((item) {
                                  return item.homeTeamName!
                                          .toLowerCase()
                                          .contains(query) ||
                                      item.awayTeamName!
                                          .toLowerCase()
                                          .contains(query);
                                }).toList();
                                return ListView.builder(
                                    itemCount: filteredList.length,
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      MatchCenterMatches data =
                                          filteredList[index];
                                      return GestureDetector(
                                          onTap: () {
                                            Get.toNamed(
                                                AppRoutes.matchCenterInner,
                                                arguments: {
                                                  'sports': controller
                                                      .selectedSport.value,
                                                  'matchKey': data.matchKey,
                                                  'SportsName': controller
                                                      .selectedSport.value,
                                                });
                                          },
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                left: 15.w, right: 15.w),
                                            child:
                                                MatchCenterTiles(matches: data),
                                          ));
                                    });
                              });
                            }
                          }),
                    ],
                  ),
                )
              ],
            ),
          )
        ]));
  }
}
