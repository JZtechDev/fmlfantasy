import 'package:fmlfantasy/ui/views/my_teams/controller/my_teams_controller.dart';
import 'package:fmlfantasy/ui/views/my_teams/widgets/my_teams_card.dart';
import 'package:fmlfantasy/ui/views/my_teams/widgets/team_stats_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyTeams extends GetView<MyTeamsController> {
  const MyTeams({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MyTeamsController());
    return Obx(() {
      switch (controller.showAll.value) {
        case "all":
          controller.filteredData.value = controller.myTeams;
          break;
        case "upcoming":
          controller.filteredData.value = controller.myTeams
              .where((e) => e.matchData!.status == "not_started")
              .toList();
          break;
        case "closed":
          controller.filteredData.value = controller.myTeams
              .where((e) => e.matchData!.status == "closed")
              .toList();
          break;
        default:
          controller.filteredData.value = controller.myTeams;
      }
      return Column(
        children: controller.filteredData
            .map((myTeams) => GestureDetector(
                  onTap: () {
                    controller.teamId.value = myTeams.id!;
                    controller.matchCode.value = myTeams.matchData!.matchId!;
                    controller.tournamentId.value =
                        myTeams.tournamentId.toString();
                    controller.team.value = myTeams.name!;
                    controller.selectTeam(
                        controller.filteredData.indexOf(myTeams),
                        myTeams.id!,
                        myTeams);
                    Get.to(() => TeamStatsView(
                          myTeams: myTeams,
                        ));
                  },
                  child: MyTeamsCard(
                    controller.filteredData.indexOf(myTeams),
                    myTeams: myTeams,
                  ),
                ))
            .toList(),
      );
    });
  }
}
