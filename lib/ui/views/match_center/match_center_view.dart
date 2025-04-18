import 'package:fmlfantasy/app/app%20routes/app_routes.dart';
import 'package:fmlfantasy/app/app_colors/app_colors.dart';
import 'package:fmlfantasy/core/config/global_instances.dart';
import 'package:fmlfantasy/model/match_center_model.dart';
import 'package:fmlfantasy/ui/components/app_appbar.dart';
import 'package:fmlfantasy/ui/components/sports_tab_bar.dart';
import 'package:fmlfantasy/ui/helpers/commons.dart';
import 'package:fmlfantasy/ui/views/match_center/controller/match_center_controller.dart';
import 'package:fmlfantasy/ui/views/match_center/widget/label_and_search.dart';
import 'package:fmlfantasy/ui/views/match_center/widget/match_center_skeleton.dart';
import 'package:fmlfantasy/ui/views/match_center/widget/match_center_tiles.dart';
import 'package:fmlfantasy/ui/widgets/app_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MatchCenter extends GetView<MatchCenterController> {
  const MatchCenter({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MatchCenterController());
    return Scaffold(
        backgroundColor: AppColors.grey,
        appBar: const AppBarGeneral(title: 'Match center'),
        body: CustomScrollView(slivers: [
          SliverAppBar(
            toolbarHeight: 45.h,
            expandedHeight: 45.h,
            collapsedHeight: 45.h,
            automaticallyImplyLeading: false,
            pinned: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
            flexibleSpace: Obx(() {
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
                verticalSpace(5.h),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      verticalSpace(20.h),
                      const LabelAndSearch(),
                      Obx(() {
                        return AnimatedContainer(
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
                              child: Padding(
                                padding:
                                    EdgeInsets.only(left: 15.w, right: 15.w),
                                child: AppTextField(
                                  fillColor: AppColors.white,
                                  labelText: 'search'.tr,
                                  controller: controller.searchController,
                                  onChanged: (value) {
                                    controller.searchQuery.value = value;
                                  },
                                ),
                              ),
                            ));
                      }),
                      verticalSpace(10.h),
                      Obx(() => FutureBuilder<List<MatchCenterModel>>(
                          future: controller.fetchMatchCenterData(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const MatchCenterSkeleton();
                            } else if (snapshot.hasError) {
                              return Text('servererror'.tr);
                            } else if (!snapshot.hasData ||
                                snapshot.data!.isEmpty) {
                              return Text('notournamentavailable.'.tr);
                            } else {
                              return Obx(() {
                                final query =
                                    controller.searchQuery.value.toLowerCase();
                                final filteredList =
                                    snapshot.data!.where((item) {
                                  return item.competitionName!
                                          .toLowerCase()
                                          .contains(query) ||
                                      item.teams![0].name!
                                          .toLowerCase()
                                          .contains(query) ||
                                      item.teams![1].name!
                                          .toLowerCase()
                                          .contains(query);
                                }).toList();
                                return ListView.builder(
                                    itemCount: filteredList.length,
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      MatchCenterModel data =
                                          filteredList[index];
                                      return GestureDetector(
                                          onTap: () {
                                            Get.toNamed(
                                                AppRoutes.matchCenterInner,
                                                arguments: {
                                                  'sports': controller
                                                      .selectedSport.value,
                                                  'matchKey': data.matchKey!,
                                                  'SportsName': controller
                                                      .selectedSport.value,
                                                });
                                          },
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                left: 15.w, right: 15.w),
                                            child: MatchCenterTiles(data: data),
                                          ));
                                    });
                              });
                            }
                          })),
                    ],
                  ),
                )
              ],
            ),
          )
        ]));
  }
}
