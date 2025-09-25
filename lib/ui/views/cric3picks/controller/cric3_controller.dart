import 'dart:developer';

import 'package:carousel_slider_plus/carousel_controller.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fmlfantasy/core/config/global_instances.dart';
import 'package:fmlfantasy/model/select_player_model.dart';
import 'package:fmlfantasy/model/tournament_model.dart';
import 'package:fmlfantasy/services/tournament_services.dart';
import '../../../../core/imports/imports.dart';

class Cric3Controller extends GetxController {
  List<TournamentModel> _tournamnets = [];

  TournamentModel? selectedTournament;
  late Future<SelectTeam> selectTeam;
  List<Players> _players = [];

  CarouselSliderController homeBatsmanController = CarouselSliderController();
  CarouselSliderController awayBatsmanController = CarouselSliderController();
  CarouselSliderController homeBowlerController = CarouselSliderController();
  CarouselSliderController awayBowlerController = CarouselSliderController();
  CarouselSliderController homeFielderController = CarouselSliderController();
  CarouselSliderController awayFielderController = CarouselSliderController();

  Players? _selectedBatsman;

  Players? get selectedBatsman => _selectedBatsman;

  set selectedBatsman(Players? value) {
    _selectedBatsman = value;
    update();
  }

  Players? _selectedBowler;

  Players? get selectedBowler => _selectedBowler;

  set selectedBowler(Players? value) {
    _selectedBowler = value;
    update();
  }

  Players? _selectedFielder;

  Players? get selectedFielder => _selectedFielder;

  set selectedFielder(Players? value) {
    _selectedFielder = value;
    update();
  }

  List<Players> _homePlayers = [];

  List<Players> _awayPlayers = [];

  List<Players> get homePlayers => _homePlayers;

  set homePlayers(List<Players> value) {
    _homePlayers = value;
    update();
  }

  List<Players> get awayPlayers => _awayPlayers;
  set awayPlayers(List<Players> value) {
    _awayPlayers = value;
    update();
  }

  List<Players> get players => _players;

  set players(List<Players> value) {
    _players = value;
    update();
  }

  List<TournamentModel> get tournaments => _tournamnets;

  set tournaments(List<TournamentModel> value) {
    _tournamnets = value;
    update();
  }

  String token = '';

  void onNextPlayerCard(
      bool isHome, bool isBatsman, bool isBowler, bool isFielder) {
    if (isHome) {
      if (isBatsman) {
        homeBatsmanController.nextPage();
      } else if (isBowler) {
        homeBowlerController.nextPage();
      } else if (isFielder) {
        homeFielderController.nextPage();
      }
    } else {
      if (isBatsman) {
        awayBatsmanController.nextPage();
      } else if (isBowler) {
        awayBowlerController.nextPage();
      } else if (isFielder) {
        awayFielderController.nextPage();
      }
    }
  }

  void onPreviousPlayerCard(
      bool isHome, bool isBatsman, bool isBowler, bool isFielder) {
    if (isHome) {
      if (isBatsman) {
        homeBatsmanController.previousPage();
      } else if (isBowler) {
        homeBowlerController.previousPage();
      } else if (isFielder) {
        homeFielderController.previousPage();
      }
    } else {
      if (isBatsman) {
        awayBatsmanController.previousPage();
      } else if (isBowler) {
        awayBowlerController.previousPage();
      } else if (isFielder) {
        awayFielderController.previousPage();
      }
    }
  }

  void onSelectBatsman(
    Players player,
  ) {
    if (player == selectedBatsman) {
      selectedBatsman = null;
      update();
      EasyLoading.showToast('Batsman deselected');
      return;
    } else {
      selectedBatsman = player;
      EasyLoading.showToast('Batsman selected');
      update();
    }
  }

  void onSelectedFielder(
    Players player,
  ) {
    if (player == selectedFielder) {
      selectedFielder = null;
      update();
      EasyLoading.showToast('Fielder deselected');
      return;
    } else {
      selectedFielder = player;
      EasyLoading.showToast('Fielder selected');
      update();
    }
  }

  void onSelectedBowler(
    Players player,
  ) {
    if (player == selectedBowler) {
      selectedBowler = null;
      update();
      EasyLoading.showToast('Bowler deselected');
      return;
    } else {
      selectedBowler = player;
      EasyLoading.showToast('Bowler selected');
      update();
    }
  }

  Future<void> fetchTournaments() async {
    EasyLoading.show(status: 'Loading tournaments...');
    tournaments = await TournamentServices()
        .fetchTournamentsAndMatches(selectedSPort.value, token);
    EasyLoading.dismiss();
  }

  void onTournamentSelected(TournamentModel tournament) {
    selectedTournament = tournament;
    update();
    log('Selected Tournament: ${tournament.name}');

    selectTeam = TournamentServices().fetchPlayers(
        selectedSPort.value, tournament.matches![0].matchId, token);

    selectTeam.then((team) {
      EasyLoading.showSuccess('Players fetched successfully');
      players = [
        ...team.homeTeam?.players ?? [],
        ...team.awayTeam?.players ?? [],
      ];

      // Sort home players: wicket keeper first
      homePlayers = [...team.homeTeam?.players ?? []]..sort((a, b) {
          if (a.position!.toLowerCase() == 'wicket keeper' &&
              b.position!.toLowerCase() != 'wicket keeper') {
            return -1;
          } else if (a.position!.toLowerCase() != 'wicket keeper' &&
              b.position!.toLowerCase() == 'wicket keeper') {
            return 1;
          }
          return 0;
        });

      // Sort away players: wicket keeper first
      awayPlayers = [...team.awayTeam?.players ?? []]..sort((a, b) {
          if (a.position!.toLowerCase() == 'wicket keeper' &&
              b.position!.toLowerCase() != 'wicket keeper') {
            return -1;
          } else if (a.position!.toLowerCase() != 'wicket keeper' &&
              b.position!.toLowerCase() == 'wicket keeper') {
            return 1;
          }
          return 0;
        });

      update();
    }).catchError((error) {
      log('Error fetching players: $error');
      EasyLoading.showError('Failed to fetch players');
    });

    Get.toNamed(AppRoutes.selectCric3PlayersView);
  }

  @override
  void onInit() async {
    super.onInit();
    token = await getStringValuesSF();
    fetchTournaments();
  }
}
