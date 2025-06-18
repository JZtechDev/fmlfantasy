import 'package:fmlfantasy/app/app_images/app_images.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/model/sports_type.dart';
import 'package:fmlfantasy/ui/views/dashboard/models/cards_model.dart';

class DashboardController extends GetxController {
  RxList<Sport> sportsList = <Sport>[
    Sport(title: 'BB', icon: AppImages.baseketball, name: 'B-ball'),
    Sport(title: 'FB', icon: AppImages.footballsvg, name: 'Football'),
    Sport(title: 'CR', icon: AppImages.cricket, name: 'Crick'),
    Sport(title: 'AF', icon: AppImages.americanFootballsvg, name: 'Football'),
    Sport(title: 'BL', icon: AppImages.baseballsvg, name: 'Base'),
    Sport(title: 'HK', icon: AppImages.iceHockeysvg, name: 'Hockey'),
  ].obs;

  RxInt selectedIndex = 0.obs;
  double scrollOffset = 0.0;

  RxList<Cards> filteredList = <Cards>[].obs;

  List<Cards> cardsList = [
    Cards(
      image: 'assets/images/dashboardcards.png',
      title: 'CREATE NEW TEAM',
      subtitle:
          'Amet id felis ut nulla eget vitae. Tortor, risus lacus, cras elementum commodo metus. Sed velit varius tortor amet, adipiscing in.',
      icon: 'assets/new_images/create team.svg',
      route: AppRoutes.home,
    ),
    Cards(
      image: 'assets/images/dashboardcards.png',
      title: 'MATCH CENTER',
      subtitle:
          'Amet id felis ut nulla eget vitae. Tortor, risus lacus, cras elementum commodo metus. Sed velit varius tortor amet, adipiscing in.',
      icon: AppImages.matchCenter,
      route: AppRoutes.matchCenter,
    ),
    Cards(
      image: 'assets/images/dashboardcards.png',
      title: 'LEADERBOARD',
      subtitle:
          'Amet id felis ut nulla eget vitae. Tortor, risus lacus, cras elementum commodo metus. Sed velit varius tortor amet, adipiscing in.',
      icon: AppImages.leaderboard,
      route: AppRoutes.leaderboard,
    ),
    Cards(
      image: 'assets/images/dashboardcards.png',
      title: 'HOW IT WORKS',
      subtitle:
          'Amet id felis ut nulla eget vitae. Tortor, risus lacus, cras elementum commodo metus. Sed velit varius tortor amet, adipiscing in.',
      icon: AppImages.howItWork,
      route: AppRoutes.howItWorks,
    ),
    Cards(
      image: 'assets/images/dashboardcards.png',
      title: 'MY TEAMS',
      subtitle:
          'Amet id felis ut nulla eget vitae. Tortor, risus lacus, cras elementum commodo metus. Sed velit varius tortor amet, adipiscing in.',
      icon: AppImages.myTeam,
      route: AppRoutes.myTeams,
    ),
    Cards(
        image: 'assets/images/dashboardcards.png',
        title: 'MY CONTESTS',
        subtitle:
            'Amet id felis ut nulla eget vitae. Tortor, risus lacus, cras elementum commodo metus. Sed velit varius tortor amet, adipiscing in.',
        icon: AppImages.myTeam,
        route: AppRoutes.myContestView),
    Cards(
        image: 'assets/images/dashboardcards.png',
        title: 'FRIENDS',
        subtitle:
            'Amet id felis ut nulla eget vitae. Tortor, risus lacus, cras elementum commodo metus. Sed velit varius tortor amet, adipiscing in.',
        icon: 'assets/new_images/create team.svg',
        route: AppRoutes.friendsView),
  ];

  List<Cards> sportyPickList = [
    Cards(
      image: 'assets/images/dashboardcards.png',
      title: 'CREATE A DRAW',
      subtitle:
          'Amet id felis ut nulla eget vitae. Tortor, risus lacus, cras elementum commodo metus. Sed velit varius tortor amet, adipiscing in.',
      icon: 'assets/new_images/create team.svg',
      route: AppRoutes.matchFixturesView,
    ),
    Cards(
      image: 'assets/images/dashboardcards.png',
      title: 'MY DRAWS',
      subtitle:
          'Amet id felis ut nulla eget vitae. Tortor, risus lacus, cras elementum commodo metus. Sed velit varius tortor amet, adipiscing in.',
      icon: AppImages.matchCenter,
      route: AppRoutes.myDrawsView,
    ),
    Cards(
      image: 'assets/images/dashboardcards.png',
      title: 'DRAWS LEADERBOARD',
      subtitle:
          'Amet id felis ut nulla eget vitae. Tortor, risus lacus, cras elementum commodo metus. Sed velit varius tortor amet, adipiscing in.',
      icon: AppImages.leaderboard,
      route: AppRoutes.sportPickLeaderboard,
    ),
  ];

  @override
  void onInit() {
    filteredList.addAll(cardsList);
    super.onInit();
  }
}
