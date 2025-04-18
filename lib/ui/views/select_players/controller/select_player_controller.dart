import 'package:fmlfantasy/app/app%20routes/app_routes.dart';
import 'package:fmlfantasy/app/app_images/app_images.dart';
import 'package:fmlfantasy/model/select_player_model.dart';
import 'package:fmlfantasy/services/tournament_services.dart';
import 'package:fmlfantasy/ui/helpers/get_initials.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectPlayerController extends GetxController {
  var isVisible = false.obs;
  var searchVisible = false.obs;
  bool isDelayApplied = false;
  var showMatchTimer = false.obs;
  RxDouble totalPoints = 100.0.obs;
  String matchID = Get.arguments['matchID'];
  String sportName = Get.arguments['sport'];
  String tournamentId = Get.arguments['tournamentId'];
  String? teamId = Get.arguments['teamId'];
  RxList<dynamic>? getPlayers = Get.arguments['players'];
  RxList<dynamic> players = [].obs;
  String? joinCode = Get.arguments['joinCode'];
  TournamentServices tournamentServices = TournamentServices();
  late Future<SelectTeam> selectTeam;
  RxList<int> selectedIndexes = <int>[].obs;
  RxList<Players> selectedPlayers = <Players>[].obs;
  RxList combinedPlayers = <List>[].obs;
  var matchData = {}.obs;
  int maxSelections = 11;
  final ScrollController scrollController = ScrollController();
  RxBool isScrolled = false.obs;
  RxList postionsList = <PositionModel>[].obs;
  int homeTeamCount = 0;
  int awayTeamCount = 0;
  RxString homeTeam = ''.obs;
  RxString awayTeam = ''.obs;
  String token = '';
  double sumOfInvestments = 0.0;
  double width = Get.width * 0.45;
  RxDouble occupiedPoints = 0.0.obs;

  final TextEditingController searchController = TextEditingController();
  final RxString searchQuery = ''.obs;
  RxBool isSearch = false.obs;

  RxList<Players> selectedPlayersPlaceholders = <Players>[
    Players(assetCode: 'placeholder', imageUrl: AppImages.userPlaceHolder),
    Players(assetCode: 'placeholder', imageUrl: AppImages.userPlaceHolder),
    Players(assetCode: 'placeholder', imageUrl: AppImages.userPlaceHolder),
    Players(assetCode: 'placeholder', imageUrl: AppImages.userPlaceHolder),
    Players(assetCode: 'placeholder', imageUrl: AppImages.userPlaceHolder),
    Players(assetCode: 'placeholder', imageUrl: AppImages.userPlaceHolder),
    Players(assetCode: 'placeholder', imageUrl: AppImages.userPlaceHolder),
    Players(assetCode: 'placeholder', imageUrl: AppImages.userPlaceHolder),
    Players(assetCode: 'placeholder', imageUrl: AppImages.userPlaceHolder),
    Players(assetCode: 'placeholder', imageUrl: AppImages.userPlaceHolder),
    Players(assetCode: 'placeholder', imageUrl: AppImages.userPlaceHolder),
  ].obs;

  void toggleSelection(Players player, String homeTeamName, String awayTeamName,
      String playerTeam) {
    players.removeWhere((element) => element.assetCode == player.assetCode);

    homeTeam.value = homeTeamName;
    awayTeam.value = awayTeamName;

    if (selectedPlayers.any(
        (selectedPlayer) => selectedPlayer.assetCode == player.assetCode)) {
      totalPoints.value += player.assetIndexPrice!;
      occupiedPoints.value -= player.assetIndexPrice!;

      selectedPlayersPlaceholders.add(
        Players(assetCode: 'placeholder', imageUrl: AppImages.userPlaceHolder),
      );

      selectedPlayers.removeWhere(
          (selectedPlayer) => selectedPlayer.assetCode == player.assetCode);
    } else {
      if (selectedPlayers.length < maxSelections &&
          player.assetIndexPrice! <= totalPoints.value) {
        totalPoints.value -= player.assetIndexPrice!;
        occupiedPoints.value += player.assetIndexPrice!;
        player.teamName = playerTeam;
        selectedPlayersPlaceholders.removeAt(0);
        selectedPlayers.add(player);
      } else {
        Get.snackbar('Error', 'errormax'.tr);
      }
    }
  }

  void filterPlayersByPosition() {
    combinedPlayers.clear();
    String selectedPosition = isPostion.value;
    combinedPlayers = combinedPlayers
        .where((player) => getInitials(player[0].position) == selectedPosition)
        .toList()
        .obs;
    update();
  }

  void filterPlayers(SelectTeam selectTeam) {
    combinedPlayers.clear();

    if (isSelectedTeamFliter.value == 'home') {
      if (selectTeam.homeTeam?.players != null) {
        combinedPlayers.addAll(selectTeam.homeTeam!.players!
            .map((player) => [player, selectTeam.homeTeam!.name ?? 'Home Team'])
            .toList());
      }
    } else if (isSelectedTeamFliter.value == 'away') {
      if (selectTeam.awayTeam?.players != null) {
        combinedPlayers.addAll(selectTeam.awayTeam!.players!
            .map((player) => [player, selectTeam.awayTeam!.name ?? 'Away Team'])
            .toList());
      }
    } else {
      if (selectTeam.homeTeam?.players != null) {
        combinedPlayers.addAll(selectTeam.homeTeam!.players!
            .map((player) => [player, selectTeam.homeTeam!.name ?? 'Home Team'])
            .toList());
      }
      if (selectTeam.awayTeam?.players != null) {
        combinedPlayers.addAll(selectTeam.awayTeam!.players!
            .map((player) => [player, selectTeam.awayTeam!.name ?? 'Away Team'])
            .toList());
      }
    }
    if (isPostion.isNotEmpty) {
      combinedPlayers = combinedPlayers
          .where((player) => getInitials(player[0].position) == isPostion.value)
          .toList()
          .obs;
    }
  }

  void filter() {
    switch (sportName) {
      case 'BB':
        postionsList.value = postionList;
        break;
      case 'CR':
        postionsList.value = cricketList;
        break;
      case 'AF':
        postionsList.value = americanFootballList;
      case 'FB':
        postionsList.value = footballList;
      case 'BL':
        postionsList.value = baseballList;
        break;
      case 'HK':
        postionsList.value = hockeyList;
        break;
      default:
    }
  }

  Future<void> fetchMatchTime(String matchID) async {
    try {
      var data = await tournamentServices.fetchMatchTime(matchID, sportName);
      matchData.value = data;
    } catch (error) {
      rethrow;
    } finally {}
  }

  bool isSelected(int index) {
    return selectedIndexes.contains(index);
  }

  void navigateToNextPage() {
    Get.toNamed(AppRoutes.bullPlayer, arguments: {
      'selectedPlayers': selectedPlayers,
      'matchID': matchID,
      'sport': sportName,
      'tournamentId': tournamentId
    });
  }

  void removeSelectedPLayers() {
    for (int i = 0; i < selectedPlayers.length; i++) {
      selectedPlayersPlaceholders
          .add(Players(imageUrl: AppImages.userPlaceHolder));
    }
    selectedPlayers.clear();
    selectedIndexes.clear();
    occupiedPoints.value = 0.0;
    totalPoints.value = 100.0;
    update();
  }

  @override
  void onInit() async {
    getPlayers == null ? null : players.value = [...getPlayers!];
    selectTeam = tournamentServices.fetchPlayers(sportName, matchID);

    fetchMatchTime(matchID);
    filter();
    filterPlayersByPosition();
    scrollController.addListener(onScroll);
    super.onInit();
  }

  void onScroll() {
    if (scrollController.offset > 10 && !isScrolled.value) {
      isScrolled.value = true;
    } else if (scrollController.offset <= 0 && isScrolled.value) {
      isScrolled.value = false;
      isDelayApplied = false;
    }
  }

  void toggleVisibility() {
    isVisible.value = !isVisible.value;
  }

  double getPlayersPercentage() {
    return (selectedPlayers.length / 11);
  }

  double getSalaryPercentage() {
    return (occupiedPoints.value / 100) * 1;
  }

  String getIconPath(String sportName) {
    switch (sportName) {
      case 'CR':
        return AppImages.cricket;
      case 'AF':
        return AppImages.americanFootballsvg;
      case 'BB':
        return AppImages.baseketball;
      case 'BL':
        return AppImages.baseballsvg;
      case 'FB':
        return AppImages.footballsvg;
      case 'HK':
        return AppImages.iceHockeysvg;
      default:
        return AppImages
            .iceHockeysvg; // A default icon in case the sport is not recognized
    }
  }

  RxString isSelectedTeamFliter = 'none'.obs;
  RxString isPostion = ''.obs;
  RxList postionList = [
    PositionModel(
        positionName: 'PG',
        positionImage: 'assets/bullsket_icons/pg.svg',
        players: 0.obs),
    PositionModel(
        positionName: 'PF',
        positionImage: 'assets/bullsket_icons/pf.svg',
        players: 0.obs),
    PositionModel(
        positionName: 'SG',
        positionImage: 'assets/bullsket_icons/sg.svg',
        players: 0.obs),
    PositionModel(
        positionName: 'SF',
        positionImage: 'assets/bullsket_icons/sf.svg',
        players: 0.obs),
    PositionModel(
        positionName: 'CE',
        positionImage: 'assets/bullsket_icons/ce.svg',
        players: 0.obs),
  ].obs;

  RxList americanFootballList = [
    PositionModel(
        positionName: 'QU',
        positionImage: 'assets/bullsket_icons/pg.svg',
        players: 0.obs),
    PositionModel(
        positionName: 'CO',
        positionImage: 'assets/bullsket_icons/pg.svg',
        players: 0.obs),
    PositionModel(
        positionName: 'WR',
        positionImage: 'assets/bullsket_icons/pg.svg',
        players: 0.obs),
    PositionModel(
        positionName: 'SA',
        positionImage: 'assets/bullsket_icons/pg.svg',
        players: 0.obs),
  ].obs;

  RxList cricketList = [
    PositionModel(
        positionName: 'BO',
        positionImage: 'assets/bullsket_icons/pg.svg',
        players: 0.obs),
    PositionModel(
        positionName: 'AR',
        positionImage: 'assets/bullsket_icons/pg.svg',
        players: 0.obs),
    PositionModel(
        positionName: 'WK',
        positionImage: 'assets/bullsket_icons/pg.svg',
        players: 0.obs),
    PositionModel(
        positionName: 'BA',
        positionImage: 'assets/bullsket_icons/pg.svg',
        players: 0.obs),
  ].obs;

  RxList footballList = [
    PositionModel(
        positionName: 'FO',
        positionImage: 'assets/bullsket_icons/pg.svg',
        players: 0.obs),
    PositionModel(
        positionName: 'DE',
        positionImage: 'assets/bullsket_icons/pg.svg',
        players: 0.obs),
    PositionModel(
        positionName: 'MI',
        positionImage: 'assets/bullsket_icons/pg.svg',
        players: 0.obs),
    PositionModel(
        positionName: 'GO',
        positionImage: 'assets/bullsket_icons/pg.svg',
        players: 0.obs),
  ].obs;

  RxList baseballList = [
    PositionModel(
        positionName: 'FB',
        positionImage: 'assets/bullsket_icons/pg.svg',
        players: 0.obs),
    PositionModel(
        positionName: 'DH',
        positionImage: 'assets/bullsket_icons/pg.svg',
        players: 0.obs),
    PositionModel(
        positionName: 'RF',
        positionImage: 'assets/bullsket_icons/pg.svg',
        players: 0.obs),
    PositionModel(
        positionName: 'SP',
        positionImage: 'assets/bullsket_icons/pg.svg',
        players: 0.obs),
    PositionModel(
        positionName: 'SB',
        positionImage: 'assets/bullsket_icons/pg.svg',
        players: 0.obs),
    PositionModel(
        positionName: 'CF',
        positionImage: 'assets/bullsket_icons/pg.svg',
        players: 0.obs),
    PositionModel(
        positionName: 'TB',
        positionImage: 'assets/bullsket_icons/pg.svg',
        players: 0.obs),
    PositionModel(
        positionName: 'LF',
        positionImage: 'assets/bullsket_icons/pg.svg',
        players: 0.obs),
    PositionModel(
        positionName: 'RP',
        positionImage: 'assets/bullsket_icons/pg.svg',
        players: 0.obs),
    PositionModel(
        positionName: 'CA',
        positionImage: 'assets/bullsket_icons/pg.svg',
        players: 0.obs),
  ].obs;

  RxList hockeyList = [
    PositionModel(
        positionName: 'GO',
        positionImage: 'assets/bullsket_icons/pg.svg',
        players: 0.obs),
    PositionModel(
        positionName: 'CE',
        positionImage: 'assets/bullsket_icons/pg.svg',
        players: 0.obs),
    PositionModel(
        positionName: 'LW',
        positionImage: 'assets/bullsket_icons/pg.svg',
        players: 0.obs),
    PositionModel(
        positionName: 'DE',
        positionImage: 'assets/bullsket_icons/pg.svg',
        players: 0.obs),
    PositionModel(
        positionName: 'RW',
        positionImage: 'assets/bullsket_icons/pg.svg',
        players: 0.obs),
  ].obs;
}
