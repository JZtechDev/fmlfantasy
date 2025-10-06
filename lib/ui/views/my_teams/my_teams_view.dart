import 'package:fmlfantasy/core/config/global_instances.dart';
import 'package:fmlfantasy/ui/components/custom_sliver.dart';
import 'package:fmlfantasy/ui/components/home_appbar.dart';
import 'package:fmlfantasy/ui/components/sports_tab_bar.dart';
import 'package:fmlfantasy/ui/helpers/commons.dart';
import 'package:fmlfantasy/ui/views/my_teams/controller/my_teams_controller.dart';
import 'package:fmlfantasy/ui/views/my_teams/widgets/my_teams.dart';
import 'package:fmlfantasy/ui/views/my_teams/widgets/team_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:fmlfantasy/ui/widgets/dashboard_button.dart';
import 'package:get/get.dart';

class MyTeamsView extends GetView<MyTeamsController> {
  const MyTeamsView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MyTeamsController());
    return Scaffold(
        appBar: const HomeAppBar(title: 'My Teams'),
        body: CustomScrollView(
          slivers: [
            CustomSliver(
              appBar: Obx(
                () => SportsTabBar(
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
                            controller.myTeams[0].matchData!.matchId!;
                        controller.tournamentId.value =
                            controller.myTeams[0].tournamentId!;
                        controller.selectedCard.value = 0;
                        controller.fetchMyTeamsPlayers();
                      });
                    }),
              ),
            ),
            SliverToBoxAdapter(
                child: LayoutBuilder(builder: (context, constraints) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const DashboardButton(),
                  verticalSpace(20),
                  const TeamsTabs(),
                  verticalSpace(20),
                  const MyTeams(),
                ],
              );
            })),
          ],
        ));
  }
}
