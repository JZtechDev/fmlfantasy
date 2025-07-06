import 'package:fmlfantasy/model/my_draws_model.dart';
import 'package:fmlfantasy/ui/views/my_draws/controller/my_draws_controller.dart';
import 'package:fmlfantasy/ui/views/my_draws/widget/draws_leaderboard_table.dart';
import 'package:fmlfantasy/ui/views/play_sportypick/widgets/team_response_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyResponsesTeams extends GetView<MyDrawsController> {
  const MyResponsesTeams({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MyDrawsController());
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Obx(() => ListView.builder(
              reverse: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.myDrawsTeams.length,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int index) {
                DrawTeamsModel myDraws = controller.myDrawsTeams[index];
                return GestureDetector(
                  onTap: () {
                    controller.fetchDrawsDetails(myDraws.drawID.toString());
                    Get.to(() => DrawsLeaderboardTable(myDrawsTeams: myDraws));
                  },
                  child: TeamResponseCard(index, myDraws),
                );
              },
            ));
      },
    );
  }
}
