import 'dart:async';
import 'dart:developer';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fmlfantasy/app/app_images/app_images.dart';
import 'package:fmlfantasy/core/config/global_instances.dart';
import 'package:fmlfantasy/model/monthly_leader_model.dart';
import 'package:fmlfantasy/model/my_teams_model.dart';
import 'package:fmlfantasy/model/sports_type.dart';
import 'package:fmlfantasy/services/monthly_leaderboard_services.dart';
import 'package:fmlfantasy/ui/views/monthly_leaderboard_inner/monthly_inner_leaderboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MonthlyLeaderboardController extends GetxController
    with GetTickerProviderStateMixin {
  MonthylyLeaderboardServices monthylyLeaderboardServices =
      MonthylyLeaderboardServices();
  RxList<MonthlyLeaderBoardModel> leaderboard = <MonthlyLeaderBoardModel>[].obs;
  var isLoading = false.obs;
  RxInt selectedIndex = 0.obs;
  double scrollOffset = 0.0;
  RxString selectedSport = 'BB'.obs;
  final TextEditingController searchController = TextEditingController();
  final RxString searchQuery = ''.obs;
  RxBool isSearch = false.obs;

  MyTeamsModel? selectedMatch;

  @override
  void onInit() async {
    super.onInit();
    if (Get.arguments != null && Get.arguments.containsKey('data')) {
      selectedMatch = Get.arguments['data'];
    } else {
      selectedMatch = MyTeamsModel();
    }
    selectedSport.value = selectedSPort.value;
    await fetchMonthlyLeaderBoard();
  }

  RxList<Sport> sportsList = <Sport>[
    Sport(title: 'BB', icon: AppImages.baseketball, name: 'B-ball'),
    Sport(title: 'FB', icon: AppImages.footballsvg, name: 'Football'),
    Sport(title: 'CR', icon: AppImages.cricket, name: 'Crick'),
    Sport(title: 'AF', icon: AppImages.americanFootballsvg, name: 'Football'),
    Sport(title: 'BL', icon: AppImages.baseballsvg, name: 'Base'),
    Sport(title: 'HK', icon: AppImages.iceHockeysvg, name: 'Hockey'),
  ].obs;
  // Future<TopPlayers> fetchMonthlyLeaderBoard() async {
  //   try {
  //     isLoading(true);
  //     final data = await monthylyLeaderboardServices
  //         .fetchMonthlyLeaderBoard(selectedSport.value);
  //     leaderboard.assignAll(data);
  //     isLoading(false);
  //   } catch (e) {
  //     throw Exception('Failed to fetch data and matches: $e');
  //   } finally {
  //     isLoading(false);
  //     // ignore: control_flow_in_finally
  //     return TopPlayers();
  //   }
  // }

  Future<TopPlayers> fetchMonthlyLeaderBoard() async {
    try {
      EasyLoading.show(status: 'Loading...');
      isLoading(true);
      final data = await monthylyLeaderboardServices
          .fetchMonthlyLeaderBoard(selectedSport.value);
      leaderboard.assignAll(data);
      log('Fetched leaderboard: ${leaderboard.length} items.');
      if (selectedMatch != null) {
        log('Selected match: ${selectedMatch!.matchData!.matchCode}');
        MonthlyLeaderBoardModel? matchedLeaderboard =
            leaderboard.firstWhereOrNull(
          (match) => match.matchCode == selectedMatch!.matchData!.matchCode,
        );

        if (matchedLeaderboard != null) {
          log('Match found in leaderboard: ${matchedLeaderboard.matchCode}');

          Get.to(
            () => MonthlyInnerLeaderboard(
              sports: selectedSport.value,
              data: matchedLeaderboard,
            ),
            arguments: {
              'sportName': selectedSport.value,
            },
          );
        } else {}
      } else {}
      EasyLoading.dismiss();
      isLoading(false);
    } catch (e) {
      EasyLoading.dismiss();
      log('Error: $e');
      throw Exception('Failed to fetch data and matches: $e');
    } finally {
      EasyLoading.dismiss();
      isLoading(false);
      return TopPlayers();
    }
  }
}
