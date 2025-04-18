import 'dart:developer';

import 'package:fmlfantasy/app/app_images/app_images.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/model/match_center_inner.dart';
import 'package:fmlfantasy/model/match_center_model.dart';
import 'package:fmlfantasy/services/match_center_services.dart';
import 'package:carousel_slider_plus/carousel_controller.dart';

class MatchCenterInner extends GetxController {
  final String matchKey = Get.arguments['matchKey'] ?? '';
  final String sportsCode = Get.arguments['sports'];
  final String? selectedSports = Get.arguments['SportsName'];
  List<MatchCenterPlayers> combinedPlayers = <MatchCenterPlayers>[].obs;
  RxList<InnerMatchCenterModel> matchCenterInnerData =
      <InnerMatchCenterModel>[].obs;
  MatchCenterServices matchCenterServices = MatchCenterServices();
  ScrollController scrollController = ScrollController();
  RxBool isStats = true.obs;
  var isStatsList = List.generate(5, (_) => true.obs).obs;
  RxInt topPlayerCrouselIndex = 0.obs;
  RxBool isLoading = false.obs;
  RxBool hasError = false.obs;
  RxBool playersTabIsAway = false.obs;
  RxBool isLineup = true.obs;

  RxList<PastMatches> pastMatches = <PastMatches>[].obs;

  PastMatches selectedMatch = PastMatches();

  RxBool isSelectedMatch = false.obs;

  final CarouselSliderController carouselController =
      CarouselSliderController();

  void onNextPlayerCard() {
    carouselController.nextPage();
    if (topPlayerCrouselIndex.value < 4) {
      topPlayerCrouselIndex.value++;
    }
  }

  void selectMatch(PastMatches match) {
    selectedMatch = match;
    fetchMatchCenterInnerData(match.matchKey!);
    update();
  }

  String getPitchesImages(String sportName) {
    switch (sportsCode) {
      case 'CR':
        return AppImages.cricketPitch;
      case 'AF':
        return AppImages.nflGround;
      case 'BB':
        return AppImages.basketBallGround;
      case 'FB':
        return AppImages.footballPitch;
      case 'BL':
        return AppImages.baseBallGround;
      default:
        return AppImages.iceHockeyGround;
    }
  }

  void onPreviousPlayerCard() {
    carouselController.previousPage();
    if (topPlayerCrouselIndex.value > 0) {
      topPlayerCrouselIndex.value--;
    }
  }

  Future<void> fetchPastMatches() async {
    log(sportsCode);
    try {
      List<PastMatches> fetchedTournaments =
          await matchCenterServices.pastMatches(sportsCode);
      pastMatches.value = fetchedTournaments;
      var foundMatch = pastMatches.where((match) {
        return match.matchKey == matchKey;
      }).toList();

      if (foundMatch.isNotEmpty) {
        selectedMatch = foundMatch.first;
      }
      update();
      log(pastMatches.toString());
    } catch (error) {
      rethrow;
    }
  }

  Future<List<InnerMatchCenterModel>> fetchMatchCenterInnerData(
      String matchKeys) async {
    try {
      isLoading.value = true;
      hasError.value = false;
      List<InnerMatchCenterModel> fetchedTournaments = await matchCenterServices
          .fetchMatchCenterInnerData(matchKeys, sportsCode);
      matchCenterInnerData.value = fetchedTournaments;
      isLoading.value = false;
      hasError.value = false;
      return matchCenterInnerData;
    } catch (error) {
      hasError.value = true;
      isLoading.value = false;
      rethrow;
    }
  }

  dynamic getPlayerName(List<dynamic> tabData, int index) {
    return tabData.length > index ? tabData[index].playerName : '';
  }

  dynamic getOvers(List<dynamic> tabData, int index) {
    return tabData.length > index ? tabData[index].overs : '';
  }

  String getBallsFaced(List<dynamic> tabData, int index) {
    return tabData.length > index && tabData[index]?.ballsFaced != null
        ? tabData[index].ballsFaced.toString().padLeft(1, '0')
        : '';
  }

  String getRunsConceded(List<dynamic> tabData, int index) {
    return tabData.length > index && tabData[index]?.runsConceded != null
        ? tabData[index].runsConceded.toString().padLeft(1, '0')
        : '';
  }

  @override
  void onInit() async {
    await fetchPastMatches();
    await fetchMatchCenterInnerData(matchKey);
    super.onInit();
  }
}
