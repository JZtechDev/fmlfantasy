import 'package:fmlfantasy/ui/views/my_teams/controller/my_teams_controller.dart';
import 'package:fmlfantasy/ui/views/my_teams/widgets/my_teams_card.dart';
import 'package:fmlfantasy/ui/views/my_teams/widgets/my_teams_skeleton.dart';
import 'package:fmlfantasy/ui/views/my_teams/widgets/team_stats_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyTeams extends GetView<MyTeamsController> {
  const MyTeams({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MyTeamsController());
    return Obx(
      () => controller.isLoading.value
          ? const MyTeamsSkeleton()
          : Obx(() {
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
                            controller.matchCode.value =
                                myTeams.matchData!.matchCode!;
                            controller.tournamentId.value =
                                myTeams.matchData!.tournamentId!;
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
            }),
      // LayoutBuilder(
      //     builder: (BuildContext context, BoxConstraints constraints) {
      //     final maxWidth = constraints.maxWidth;
      //     return SlideTransition(
      //       position: Tween(
      //         begin: const Offset(1, 0),
      //         end: Offset.zero,
      //       ).animate(CurvedAnimation(
      //           parent: controller.animationController,
      //           curve: Curves.easeIn)),
      //       child: Obx(
      //         () =>
      //         CarouselSlider.builder(
      //           itemCount: controller.myTeams.length,
      //           controller: controller.myTeamCrouselController,
      //           itemBuilder:
      //               (BuildContext context, int index, int realIndex) {
      //             MyTeamsModel myTeams = controller.myTeams[index];
      //             return GestureDetector(
      //               onTap: () {
      //                 controller.teamId.value = myTeams.id!;
      //                 controller.matchCode.value =
      //                     myTeams.matchData!.matchCode!;
      //                 controller.tournamentId.value =
      //                     myTeams.matchData!.tournamentId!;
      //                 controller.team.value = myTeams.name!;
      //                 controller.selectTeam(index, myTeams.id!);
      //               },
      //               child: MyTeamsCard(index, myTeams: myTeams)
      //             );
      //           },
      //           options: CarouselOptions(
      //             clipBehavior: Clip.antiAliasWithSaveLayer,
      //             aspectRatio: maxWidth > 600 ? 25 / 7 : 25 / 10.5,
      //             viewportFraction: 0.6,
      //             padEnds: false,
      //             initialPage: 0,
      //             disableCenter: true,
      //             enableInfiniteScroll: false,
      //             reverse: false,
      //             autoPlay: false,
      //             enlargeCenterPage: false,
      //             scrollDirection: Axis.horizontal,
      //             onPageChanged: (index, reason) {
      //               controller.myTeamCrouselIndex.value = index;
      //             },
      //           ),
      //         ),
      //       ),
      //     );
      //   }),
    );
  }
}
