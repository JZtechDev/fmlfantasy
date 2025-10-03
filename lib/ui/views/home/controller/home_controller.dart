import 'dart:developer';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fmlfantasy/app/app_images/app_images.dart';
import 'package:fmlfantasy/core/config/global_instances.dart';
import 'package:fmlfantasy/model/my_teams_model.dart';
import 'package:fmlfantasy/model/sports_type.dart';
import 'package:fmlfantasy/model/tournament_model.dart';
import 'package:fmlfantasy/services/match_center_services.dart';
import 'package:fmlfantasy/services/myteam_services.dart';
import 'package:fmlfantasy/services/tournament_services.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxInt selectedIndex = 0.obs;
  double scrollOffset = 0.0;
  RxString selectedSport = 'BB'.obs;
  MatchCenterServices matchCenterServices = MatchCenterServices();
  String token = '';
  RxList<TournamentModel> tournaments = <TournamentModel>[].obs;
  RxList<TournamentModel> filteredTournaments = <TournamentModel>[].obs;
  RxList<TournamentModel> privateTournaments = <TournamentModel>[].obs;
  TournamentServices tournamentServices = TournamentServices();
  MyteamServices getMyTeamServices = MyteamServices();
  RxBool isPublicSelected = true.obs;
  RxList<Sport> sportsList = <Sport>[
    Sport(title: 'BB', icon: AppImages.baseketball, name: 'B-ball'),
    Sport(title: 'FB', icon: AppImages.footballsvg, name: 'Football'),
    Sport(title: 'CR', icon: AppImages.cricket, name: 'Crick'),
    Sport(title: 'AF', icon: AppImages.americanFootballsvg, name: 'Football'),
    Sport(title: 'BL', icon: AppImages.baseballsvg, name: 'Base'),
    Sport(title: 'HK', icon: AppImages.iceHockeysvg, name: 'Hockey'),
  ].obs;

  List<String> _teamNames = [];

  List<String> get teamNames => _teamNames;

  set teamNames(List<String> value) {
    _teamNames = value;
    update();
  }

  String _selectedFilterTeam = '';

  String get selectedFilterTeam => _selectedFilterTeam;

  set selectedFilterTeam(String value) {
    _selectedFilterTeam = value;
    update();
  }

  RxList<MyTeamsModel> myTeams = <MyTeamsModel>[].obs;
  RxList<MyTeamsModel> filteredData = <MyTeamsModel>[].obs;

  Future<List<MyTeamsModel>> fetchTeams() async {
    try {
      List<MyTeamsModel> fetchedTeams =
          await getMyTeamServices.getMyTeams(token, selectedSport.value);
      myTeams.value = fetchedTeams;
      filteredData.value = fetchedTeams;

      log(myTeams.toString());
      return fetchedTeams;
    } catch (error) {
      rethrow;
    }
  }

  String getIconPath(String sportName) {
    switch (sportName) {
      case 'CR':
        return AppImages.cricket;
      case 'AF':
        return AppImages.americanFootballsvg;
      case 'BB':
        return AppImages.baseketball;
      case 'FB':
        return AppImages.footballsvg;
      case 'BL':
        return AppImages.baseballsvg;
      default:
        return AppImages
            .iceHockeysvg; // A default icon in case the sport is not recognized
    }
  }

  void filterTournaments() {
    if (selectedFilterTeam.isNotEmpty) {
      log('tap');
      filteredTournaments.value = tournaments.where((tournament) {
        return tournament.matches!.any((match) =>
            match.home == selectedFilterTeam ||
            match.away == selectedFilterTeam);
      }).toList();
      log(tournaments.toString());
    }
  }

  Future<List<TournamentModel>> fetchData() async {
    try {
      EasyLoading.show(status: 'Loading...');
      List<TournamentModel> fetchedTournaments = await tournamentServices
          .fetchTournamentsAndMatches(selectedSport.value, token);
      // tournaments.value = fetchedTournaments;
      tournaments.value = fetchedTournaments.where((tournament) {
        DateTime? endDate;
        try {
          endDate = DateTime.parse(tournament.endDate ?? '');
        } catch (e) {
          return false;
        }
        return endDate.isAfter(DateTime.now());
      }).toList();

      filteredTournaments.value = tournaments;

      Set<String> uniqueTeamNames = {};
      for (var tournament in tournaments) {
        for (var match in tournament.matches!) {
          // Assuming matches is a list in Tournaments
          if (match.home != null) uniqueTeamNames.add(match.home!);
          if (match.away != null) uniqueTeamNames.add(match.away!);
        }
      }

      // Update teamNames with unique names
      teamNames = uniqueTeamNames.toList();
      EasyLoading.dismiss();
      return tournaments;
    } catch (error) {
      EasyLoading.dismiss();
      rethrow; // Rethrow the error to handle it in the FutureBuilder
    }
  }

  @override
  void onInit() async {
    selectedSport.value = selectedSPort.value;
    log(selectedSport.value);
    token = await getStringValuesSF();
    fetchData();
    fetchTeams();
    super.onInit();
  }
}
