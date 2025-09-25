import 'dart:developer';
import 'package:fmlfantasy/core/config/global_instances.dart';
import 'package:fmlfantasy/model/loto_model.dart';
import 'package:fmlfantasy/model/select_player_model.dart';
import 'package:fmlfantasy/services/create_lotto_services.dart';
import 'package:fmlfantasy/services/tournament_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LotoController extends GetxController {
  var isVisible = false.obs;
  var searchVisible = false.obs;
  bool isDelayApplied = false;
  var showMatchTimer = false.obs;
  RxDouble totalPoints = 100.0.obs;
  String matchID = Get.arguments['matchID'];
  String sportName = Get.arguments['sport'];
  String tournamentId = Get.arguments['tournamentId'];
  String? teamId = Get.arguments['teamId'];
  RxList<dynamic>? players = Get.arguments['players'];
  String? joinCode = Get.arguments['joinCode'];
  TournamentServices tournamentServices = TournamentServices();
  late Future<SelectTeam> selectTeam;
  RxList<int> selectedIndexes = <int>[].obs;
  RxList combinedPlayers = <List>[].obs;
  var matchData = {}.obs;
  int maxSelections = 5;
  final ScrollController scrollController = ScrollController();
  RxBool isScrolled = false.obs;
  RxList postionsList = <PositionModel>[].obs;
  int homeTeamCount = 0;
  int awayTeamCount = 0;
  RxString homeTeam = ''.obs;
  RxString awayTeam = ''.obs;
  String homeTeamKey = '';
  String awayTeamKey = '';
  String homeTeamName = '';
  String awayTeamName = '';
  RxString winner = ''.obs;
  String token = '';
  double sumOfInvestments = 0.0;
  RxInt drawIndexs = 0.obs;
  RxInt drawFees = 5.obs;
  RxInt matchOutcome = 0.obs;
  RxList<dynamic> sportsList = <dynamic>[].obs;
  RxString selectedSport = ''.obs;
  RxString sportsFullName = ''.obs;

  RxList<Players> winnerTeam = <Players>[].obs;
  RxString sportsValue = ''.obs;

  final TextEditingController searchController = TextEditingController();
  final RxString searchQuery = ''.obs;
  RxBool isSearch = false.obs;

  void toggleSelection(Players player, int index, int drawIndex,
      String teamName, String teamKey) {
    log(teamName);
    drawIndexs.value = drawIndex;
    if (drawsList[drawIndex].players.contains(player)) {
      drawsList[drawIndex].players[index] = Players(
        assetCode: '',
        imageUrl: '',
      );
      drawsList.refresh();
      update();
      Get.back();
    } else {
      drawsList[drawIndex].players[index] = player;
      drawsList[drawIndex].players[index].teamName = teamName;
      drawsList[drawIndex].players[index].teamKey = teamKey;
      drawsList.refresh();
      update();
      Get.back();
    }
  }

  void removePlayer(int index, int drawIndex) {
    drawsList[drawIndex].players[index] = Players(
      assetCode: '',
      imageUrl: '',
    );
    drawsList.refresh();
    update();
  }

  RxList<List<Players>> draws = <List<Players>>[
    List<Players>.generate(5, (index) {
      return Players(
        assetCode: '',
        imageUrl: '',
      );
    })
  ].obs;

  RxList<Draw> drawsList = <Draw>[
    Draw(
        players: List<Players>.generate(
            5,
            (index) => Players(
                  assetCode: '',
                  imageUrl: '',
                )),
        winner: Winner(assetCode: '', name: '', imageUrl: '', id: 0),
        drawId: null)
  ].obs;

  Future<void> addDraw() async {
    // ignore: unrelated_type_equality_checks
    if (drawsList[drawIndexs.value].drawId == 0) {
      Get.snackbar('Error', 'Can not Add New Draw');
    } else {
      drawFees.value += entryFee.toInt();
      List<Players> newPlayers = List.generate(5, (index) {
        return Players(
          assetCode: '',
          imageUrl: '',
        );
      });
      drawsList.add(
        Draw(
            players: newPlayers,
            winner: Winner(assetCode: '', name: '', imageUrl: '', id: 0),
            drawId: null),
      );
    }
  }

  void postDraw() {
    Map<String, dynamic> detailPost() {
      CreateLoto saveDetails = CreateLoto(
        sportId: int.parse(sportsValue.value),
        tournamentKey: tournamentId,
        matchKey: matchID,
        homeTeamKey: homeTeamKey,
        awayTeamKey: awayTeamKey,
        playerRank1: drawsList[drawIndexs.value].players[0].assetCode,
        player1Team: drawsList[drawIndexs.value].players[0].teamKey,
        playerRank2: drawsList[drawIndexs.value].players[1].assetCode,
        player2Team: drawsList[drawIndexs.value].players[1].teamKey,
        playerRank3: drawsList[drawIndexs.value].players[2].assetCode,
        player3Team: drawsList[drawIndexs.value].players[2].teamKey,
        playerRank4: drawsList[drawIndexs.value].players[3].assetCode,
        player4Team: drawsList[drawIndexs.value].players[3].teamKey,
        playerRank5: drawsList[drawIndexs.value].players[4].assetCode,
        player5Team: drawsList[drawIndexs.value].players[4].teamKey,
        matchOutcome: matchOutcome.value,
        winnerTeamKey: drawsList[drawIndexs.value].winner.assetCode,
      );
      return saveDetails.toJson();
    }

    CreateLottoServices.createLotto(detailPost(), token).then((response) {
      // ignore: unnecessary_null_comparison
      if (response != null && response.containsKey('drawUserEntryId')) {
        Get.snackbar('Success', 'Draw created successfully!');
        drawsList[drawIndexs.value].drawId.value = response['drawUserEntryId'];
        matchOutcome.value = 0;
      }
    }).catchError((error) {
      Get.snackbar('Error', 'Error Creating Draw');
    });
    drawsList.refresh();
    update();
  }

  var isDeleted = false.obs;

  Future<void> deleteDraw(String id, int drawIndex) async {
    isDeleted.value = true;
    bool result = await CreateLottoServices.deleteDraws(id, token, matchID);
    isDeleted.value = false;
    if (result) {
      Get.snackbar('Success', 'Draw deleted successfully!');
      removeDraw(drawIndex);
      drawsList.refresh();
      update();
    } else {
      Get.snackbar('Error', 'Failed to delete draw');
    }
  }

  void removeDraw(int drawIndex) {
    if (drawsList.length > 1) {
      drawFees.value -= entryFee.toInt();
      drawsList.removeAt(drawIndex);
    } else {
      drawsList[drawIndex].players = List<Players>.generate(5, (index) {
        return Players(
          assetCode: '',
          imageUrl: '',
        );
      });

      drawsList[drawIndex].winner =
          Winner(assetCode: '', name: '', imageUrl: '', id: 0);

      drawsList[drawIndex].drawId.value = 0;

      // Get.snackbar('Error', 'Cannot remove last draw');
    }
  }

  void selectWinner(
      String winner, String winnerName, String winnerImageUrl, int id) {
    drawsList[drawIndexs.value].winner.id = id;
    drawsList[drawIndexs.value].winner.assetCode = winner;
    drawsList[drawIndexs.value].winner.name = winnerName;
    drawsList[drawIndexs.value].winner.imageUrl = winnerImageUrl;
    drawsList.refresh();
    update();
    postDraw();
    Get.back();
  }

  // void selectPlayer(int drawIndex, int playerIndex, Players player) {
  //   draws[drawIndex][playerIndex] = player;
  //   Get.back();
  // }

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

  void navigateToNextPage() {}

  void removeSelectedPLayers() {
    selectedPlayers.clear();
    selectedIndexes.clear();
    totalPoints.value = 100.0;
    update();
  }

  void getSportsName() {
    switch (sportName) {
      case 'BB':
        sportsFullName.value = 'Basketball';
        break;
      case 'CR':
        sportsFullName.value = 'Cricket';
        break;
      case 'AF':
        sportsFullName.value = 'AmericanFootball';
      case 'FB':
        sportsFullName.value = 'Football';
      case 'BL':
        sportsFullName.value = 'Baseball';
        break;
      case 'HK':
        sportsFullName.value = 'Hockey';
        break;
      default:
    }
  }

  RxDouble prizePool = 0.0.obs;
  RxDouble entryFee = 0.0.obs;

  Future<void> fetchPrizePool(String token, String sportsId,
      String tournamentKey, String matchKey) async {
    try {
      // Call the API function to get prize pool data
      Map<String, dynamic> data = await CreateLottoServices.getPrizePool(
          token, sportsId, tournamentKey, matchKey);

      // Update the observable variables with the fetched data
      prizePool.value = data['prizePool'] ?? 0.0;
      entryFee.value = data['entryFee'] ?? 0.0;
    } catch (e) {
      log('Error fetching prize pool data: $e');
    } finally {}
  }

  @override
  void onInit() async {
    token = await getStringValuesSF();
    selectTeam = tournamentServices.fetchPlayers(sportName, matchID, token);
    fetchMatchTime(matchID);
    scrollController.addListener(onScroll);

    getSportsName();
    await CreateLottoServices.getSports(token).then(
      (response) {
        sportsList.value = response;
        var selectedSport = sportsList.firstWhere(
          (e) => e['text'] == sportsFullName.value,
          orElse: () => null,
        );
        sportsValue.value =
            selectedSport != null ? selectedSport['value'] : null;
      },
    );
    await fetchPrizePool(token, sportsValue.value, tournamentId, matchID);
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

  RxList<Players> selectedPlayers = <Players>[
    Players(assetCode: '', imageUrl: ''),
    Players(assetCode: '', imageUrl: ''),
    Players(assetCode: '', imageUrl: ''),
    Players(assetCode: '', imageUrl: ''),
    Players(assetCode: '', imageUrl: ''),
  ].obs;

  void toggleVisibility() {
    isVisible.value = !isVisible.value;
  }

  RxBool isloadingSelectPlayer = false.obs;
}

class Draw {
  List<Players> players;
  Winner winner;
  RxInt drawId;

  Draw({
    required this.players,
    required this.winner,
    int? drawId,
  }) : drawId = (drawId ?? 0).obs;
}

class Winner {
  int id;
  String assetCode;
  String name;
  String imageUrl;
  Winner(
      {required this.assetCode,
      required this.name,
      required this.imageUrl,
      required this.id});
}
