import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/ui/views/sport_pick_inner_leaderboard/controller/sport_pick_inner_leaderboard_controller.dart';
import 'package:fmlfantasy/ui/views/sport_pick_inner_leaderboard/widget/top_players_card.dart';

class SportPickTopPlayers extends GetView<SportPickInnerLeaderboardController> {
  const SportPickTopPlayers({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SportPickInnerLeaderboardController());

    final List<Widget> topPlayers = [
      TopPlayersCardLeaderboard(
        imageUrl: controller.drawsLeaderboardMatches.player1Image,
        name: controller.drawsLeaderboardMatches.player1Name,
        team: controller.drawsLeaderboardMatches.player1Team,
        rank: '01',
      ),
      TopPlayersCardLeaderboard(
        imageUrl: controller.drawsLeaderboardMatches.player2Image,
        name: controller.drawsLeaderboardMatches.player2Name,
        team: controller.drawsLeaderboardMatches.player2Team,
        rank: '02',
      ),
      TopPlayersCardLeaderboard(
        imageUrl: controller.drawsLeaderboardMatches.player3Image,
        name: controller.drawsLeaderboardMatches.player3Name,
        team: controller.drawsLeaderboardMatches.player3Team,
        rank: '03',
      ),
      TopPlayersCardLeaderboard(
        imageUrl: controller.drawsLeaderboardMatches.player4Image,
        name: controller.drawsLeaderboardMatches.player4Name,
        team: controller.drawsLeaderboardMatches.player4Team,
        rank: '04',
      ),
      TopPlayersCardLeaderboard(
        imageUrl: controller.drawsLeaderboardMatches.player5Image,
        name: controller.drawsLeaderboardMatches.player5Name,
        team: controller.drawsLeaderboardMatches.player5Team,
        rank: '05',
      ),
    ];

    return CarouselSlider(
      controller: controller.sportPickLeaderCrouselController,
      options: CarouselOptions(
        height: 220.h,
        enableInfiniteScroll: false,
        enlargeCenterPage: false,
        viewportFraction: 0.5,
        padEnds: false,
      ),
      items: topPlayers.map((player) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: player,
        );
      }).toList(),
    );
  }
}
