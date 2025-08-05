import 'dart:developer';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fmlfantasy/app/app_images/app_images.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/model/match_center_inner.dart';
import 'package:fmlfantasy/model/match_center_model.dart';
import 'package:fmlfantasy/new_model/match_center_inner_new.dart';
import 'package:fmlfantasy/new_model/match_center_matches_new.dart';
import 'package:fmlfantasy/new_services/match_center/match_center_service.dart';
import 'package:fmlfantasy/services/match_center_services.dart';
import 'package:carousel_slider_plus/carousel_controller.dart';
import 'package:fmlfantasy/ui/views/match_center/controller/match_center_controller.dart';

class MatchCenterInner extends GetxController {
  final MatchCenterController matchCenterController = Get.find();
  final String matchKey = Get.arguments['matchKey'] ?? '';
  final String sportsCode = Get.arguments['sports'];
  final String? selectedSports = Get.arguments['SportsName'];
  List<MatchCenterPlayers> combinedPlayers = <MatchCenterPlayers>[].obs;
  RxList<InnerMatchCenterModel> matchCenterInnerData =
      <InnerMatchCenterModel>[].obs;
  MatchCenterServices matchCenterServices = MatchCenterServices();
  MatchCenterServiceNew matchCenterServiceNew = MatchCenterServiceNew();

  MatchCenterInnerNew matchCenterInnerNew = MatchCenterInnerNew();

  // List<MatchCenterInnerNew> matchCenterInnerNew = [];
  ScrollController scrollController = ScrollController();
  RxBool isStats = true.obs;
  var isStatsList = List.generate(5, (_) => true.obs).obs;
  RxInt topPlayerCrouselIndex = 0.obs;
  RxBool isLoading = false.obs;
  RxBool hasError = false.obs;
  RxBool playersTabIsAway = false.obs;
  RxBool isLineup = true.obs;

  RxList<PastMatches> pastMatches = <PastMatches>[].obs;

  MatchCenterMatches selectedMatch = MatchCenterMatches();

  RxBool isSelectedMatch = false.obs;

  final CarouselSliderController carouselController =
      CarouselSliderController();

  void onNextPlayerCard() {
    carouselController.nextPage();
    if (topPlayerCrouselIndex.value < 4) {
      topPlayerCrouselIndex.value++;
    }
  }

  void selectMatch(MatchCenterMatches match) {
    selectedMatch = match;
    fetchMatchCenterData(selectedMatch.matchKey!);
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

  // Future<void> fetchPastMatches() async {
  //   log(sportsCode);
  //   try {
  //     List<MatchCenterMatches> fetchedTournaments =
  //         await matchCenterServices.pastMatches(sportsCode);
  //     pastMatches.value = fetchedTournaments;
  //     var foundMatch = pastMatches.where((match) {
  //       return match.matchKey == matchKey;
  //     }).toList();

  //     if (foundMatch.isNotEmpty) {
  //       selectedMatch = foundMatch.first;
  //     }
  //     update();
  //     log(pastMatches.toString());
  //   } catch (error) {
  //     rethrow;
  //   }
  // }

  // Future<List<InnerMatchCenterModel>> fetchMatchCenterInnerData(
  //     String matchKeys) async {
  //   try {
  //     EasyLoading.show(status: 'Loading...');
  //     isLoading.value = true;
  //     hasError.value = false;
  //     List<InnerMatchCenterModel> fetchedTournaments = await matchCenterServices
  //         .fetchMatchCenterInnerData(matchKeys, sportsCode);
  //     matchCenterInnerData.value = fetchedTournaments;
  //     isLoading.value = false;
  //     hasError.value = false;
  //     EasyLoading.dismiss();
  //     return matchCenterInnerData;
  //   } catch (error) {
  //     hasError.value = true;
  //     isLoading.value = false;
  //     EasyLoading.dismiss();
  //     rethrow;
  //   }
  // }

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

  Future<void> fetchMatchCenterData(String matchKey) async {
    try {
      EasyLoading.show(status: 'Loading...');
      isLoading.value = true;
      hasError.value = false;
      MatchCenterInnerNew fetchedTournament =
          await matchCenterServiceNew.fetchMatchCenterData(matchKey);
      matchCenterInnerNew = fetchedTournament;

      isLoading.value = false;
      hasError.value = false;
      EasyLoading.dismiss();
    } catch (error) {
      hasError.value = true;
      isLoading.value = false;
      EasyLoading.dismiss();
      log('Error fetching match center data: $error');
      rethrow;
    }
  }

  @override
  void onInit() async {
    fetchMatchCenterData(matchKey);
    // matchCenterServiceNew
    //     .fetchMatchCenterData('a-rz--cricket--TH1907127176910741558');
    // await fetchPastMatches();
    // await fetchMatchCenterInnerData(matchKey);
    super.onInit();
  }
}
