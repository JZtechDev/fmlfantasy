import 'dart:developer';

import 'package:carousel_slider_plus/carousel_controller.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fmlfantasy/model/select_player_model.dart';
import 'package:fmlfantasy/model/tournament_model.dart';
import 'package:fmlfantasy/services/tournament_services.dart';
import '../../../../core/imports/imports.dart';

class Cric3Controller extends GetxController {
  List<Tournaments> _tournamnets = [];

  Tournaments? selectedTournament;
  late Future<SelectTeam> selectTeam;
  List<Players> _players = [];

  CarouselSliderController homeBatsmanController = CarouselSliderController();
  CarouselSliderController awayBatsmanController = CarouselSliderController();
  CarouselSliderController homeBowlerController = CarouselSliderController();
  CarouselSliderController awayBowlerController = CarouselSliderController();
  CarouselSliderController homeFielderController = CarouselSliderController();
  CarouselSliderController awayFielderController = CarouselSliderController();

  Players? _selectedHomeBatsman;

  Players? get selectedHomeBatsman => _selectedHomeBatsman;

  set selectedHomeBatsman(Players? value) {
    _selectedHomeBatsman = value;
    update();
  }

  Players? _selectedAwayBatsman;

  Players? get selectedAwayBatsman => _selectedAwayBatsman;

  set selectedAwayBatsman(Players? value) {
    _selectedAwayBatsman = value;
    update();
  }

  Players? _selectedHomeBowler;

  Players? get selectedHomeBowler => _selectedHomeBowler;

  set selectedHomeBowler(Players? value) {
    _selectedHomeBowler = value;
    update();
  }

  Players? _selectedAwayBowler;

  Players? get selectedAwayBowler => _selectedAwayBowler;

  set selectedAwayBowler(Players? value) {
    _selectedAwayBowler = value;
    update();
  }

  Players? _selectedHomeFielder;

  Players? get selectedHomeFielder => _selectedHomeFielder;

  set selectedHomeFielder(Players? value) {
    _selectedHomeFielder = value;
    update();
  }

  Players? _selectedAwayFielder;

  Players? get selectedAwayFielder => _selectedAwayFielder;

  set selectedAwayFielder(Players? value) {
    _selectedAwayFielder = value;
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

  List<Tournaments> get tournaments => _tournamnets;

  set tournaments(List<Tournaments> value) {
    _tournamnets = value;
    update();
  }

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

  void onSelectedHomeBatsman(
    Players player,
    bool isHome,
  ) {
    if (isHome) {
      if (player == selectedHomeBatsman) {
        selectedHomeBatsman = null;
        update();
        EasyLoading.showToast('Home Batsman deselected');
        return;
      } else {
        selectedHomeBatsman = player;
        EasyLoading.showToast('Home Batsman selected');
        update();
      }
    } else {
      if (player == selectedAwayBatsman) {
        selectedAwayBatsman = null;
        update();
        EasyLoading.showToast('Away Batsman deselected');
        return;
      } else {
        selectedAwayBatsman = player;
        EasyLoading.showToast('Away Batsman selected');
        update();
      }
    }
  }

  void onSelectedFielder(
    Players player,
    bool isHome,
  ) {
    if (isHome) {
      if (player == selectedHomeFielder) {
        selectedHomeFielder = null;
        update();
        EasyLoading.showToast('Home Fielder deselected');
        return;
      } else {
        selectedHomeFielder = player;
        EasyLoading.showToast('Home Fielder selected');
        update();
      }
    } else {
      if (player == selectedAwayFielder) {
        selectedAwayFielder = null;
        update();
        EasyLoading.showToast('Away Fielder deselected');
        return;
      } else {
        selectedAwayFielder = player;
        EasyLoading.showToast('Away Fielder selected');
        update();
      }
    }
  }

  void onSelectedBowler(
    Players player,
    bool isHome,
  ) {
    if (isHome) {
      if (player == selectedHomeBowler) {
        selectedHomeBowler = null;
        update();
        EasyLoading.showToast('Home Bowler deselected');
        return;
      } else {
        selectedHomeBowler = player;
        EasyLoading.showToast('Home Bowler selected');
        update();
      }
    } else {
      if (player == selectedAwayBowler) {
        selectedAwayBowler = null;
        update();
        EasyLoading.showToast('Away Bowler deselected');
        return;
      } else {
        selectedAwayBowler = player;
        EasyLoading.showToast('Away Bowler selected');
        update();
      }
    }
  }

  Future<void> fetchTournaments() async {
    EasyLoading.show(status: 'Loading tournaments...');
    tournaments = await TournamentServices().fetchTournamentsAndMatches('CR');
    EasyLoading.dismiss();
  }

  void onTournamentSelected(Tournaments tournament) {
    selectedTournament = tournament;
    update();
    log('Selected Tournament: ${tournament.name}');

    selectTeam = TournamentServices()
        .fetchPlayers('CR', tournament.matches![0].matchCode!);

    selectTeam.then((team) {
      EasyLoading.showSuccess('Players fetched successfully');

      // Combine both home and away players
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
  void onInit() {
    super.onInit();
    fetchTournaments();
  }
}
