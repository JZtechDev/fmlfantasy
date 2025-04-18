import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/services/players_services.dart';
import 'package:fmlfantasy/ui/views/player_stats_view/models/players_info_model.dart';
import 'package:flutter/cupertino.dart';

class PlayersStatsController extends GetxController {
  String assetCode = Get.arguments['assetCode'];

  PlayersInfoModel playersInfo = PlayersInfoModel();

  RxList<PlayersRecentStats> playersRecentStats = RxList<PlayersRecentStats>();

  List<String> tabLabels = ['Overview', 'Pitch Map', 'Compare', 'Find Similar'];

  RxString selectedTitle = 'Total'.obs;
  List<String> statsFilter = [
    'Total',
    'Per 90 Mins',
    'Average',
    'Percentile Rank'
  ];

  List<CareerAllTime> career = [
    CareerAllTime(title: 'Event Titls', data: [
      Data(name: 'Appearnace', club: 1, international: 20),
      Data(name: 'Goals', club: 10, international: 200),
      Data(name: 'Assists', club: 15, international: 30)
    ])
  ];

  String _selectedTab = 'Overview';

  String get selectedTab => _selectedTab;

  set selectedTab(String value) {
    _selectedTab = value;
    update();
  }

  bool _isLoading = false;
  bool _isStatsoadding = false;

  bool get isStatsoadding => _isStatsoadding;

  set isStatsoadding(bool value) {
    _isStatsoadding = value;
    update();
  }

  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    update();
  }

  @override
  void onInit() async {
    getPlayersData();
    getPlayersRecentStats();
    super.onInit();
  }

  Future<void> getPlayersData() async {
    isLoading = true;
    playersInfo = await PlayersServices.getPlayersData(assetCode);
    update();
    isLoading = false;
  }

  Future<void> getPlayersRecentStats() async {
    isStatsoadding = true;
    playersRecentStats.value =
        await PlayersServices.getPlayersDataList(assetCode);
    update();
    isStatsoadding = false;
  }

  void showAutoDismissAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        Future.delayed(const Duration(seconds: 2), () {
          Get.back();
        });
        // Return the AlertDialog widget
        return AlertDialog(
          backgroundColor: AppColors.white,
          surfaceTintColor: AppColors.white,
          title: const Icon(
            CupertinoIcons.exclamationmark_circle_fill,
            color: AppColors.primary,
          ),
          content: Text(
            "Total point of previous 5 matches",
            style: globalTextStyle(fontSize: 12.sp),
          ),
        );
      },
    );
  }
}

class CareerAllTime {
  String title;
  List<Data> data;
  CareerAllTime({required this.title, required this.data});
}

class Data {
  String name;
  int club;
  int international;

  Data({required this.name, required this.club, required this.international});
}
