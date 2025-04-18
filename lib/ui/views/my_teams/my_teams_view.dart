import 'package:fmlfantasy/app/app_colors/app_colors.dart';
import 'package:fmlfantasy/app/app_sizings.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/config/global_instances.dart';
import 'package:fmlfantasy/ui/components/app_appbar.dart';
import 'package:fmlfantasy/ui/components/sports_tab_bar.dart';
import 'package:fmlfantasy/ui/helpers/commons.dart';
import 'package:fmlfantasy/ui/views/my_teams/controller/my_teams_controller.dart';
import 'package:fmlfantasy/ui/views/my_teams/widgets/my_teams.dart';
import 'package:fmlfantasy/ui/views/my_teams/widgets/team_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MyTeamsView extends GetView<MyTeamsController> {
  const MyTeamsView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MyTeamsController());
    return Scaffold(
        backgroundColor: AppColors.grey,
        appBar: const AppBarGeneral(
          title: 'Home',
          backgroundColor: AppColors.white,
        ),
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 45.h,
              collapsedHeight: 45.h,
              automaticallyImplyLeading: false,
              pinned: true,
              backgroundColor: Colors.transparent,
              elevation: 0,
              flexibleSpace: Obx(() {
                return SportsTabBar(
                    sportsList: controller.sportsList,
                    selectedIndex: controller.sportsList.indexWhere(
                        (sport) => sport.title == selectedSPort.value),
                    onTap: (index) {
                      selectedSPort.value = controller.sportsList[index].title;
                      controller.selectedIndex.value = index;
                      controller.selectedSport.value =
                          controller.sportsList[index].title;
                      controller.fetchTeams().then((value) {
                        controller.selectedTeamId.value =
                            controller.myTeams[0].id!;
                        controller.teamId.value = controller.myTeams[0].id!;
                        controller.team.value = controller.myTeams[0].name!;
                        controller.matchCode.value =
                            controller.myTeams[0].matchData!.matchCode!;
                        controller.tournamentId.value =
                            controller.myTeams[0].matchData!.tournamentId!;
                        controller.selectedCard.value = 0;
                        controller.fetchMyTeamsPlayers();
                      });
                    });
              }),
            ),
            SliverToBoxAdapter(
                child: LayoutBuilder(builder: (context, constraints) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSpace(10),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Text(
                      'recentFixtures'.tr,
                      style: globalTextStyle(
                          fontSize: AppSizing.isMobile(context) ? 28.sp : 16.sp,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  const TeamsDropdown(),
                  verticalSpace(20),
                  const MyTeams(),
                  verticalSpace(20),
                  //const LeaderBoard(),
                  verticalSpace(20),
                  //const TeamStatistics(),
                  verticalSpace(20.h),
                ],
              );
            })),
          ],
        ));
  }
}
