import 'dart:developer';

import 'package:fmlfantasy/app/app_images/app_images.dart';
import 'package:fmlfantasy/core/config/global_instances.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/model/lotto_leaderboard_models.dart';
import 'package:fmlfantasy/model/sport_pick_inner_model.dart';
import 'package:fmlfantasy/services/draws_leaderboard_services.dart';
import 'package:carousel_slider_plus/carousel_controller.dart';
import 'package:get/get.dart';

class SportPickInnerLeaderboardController extends GetxController {
  String matchKey = Get.arguments['matchKey'];
  String sportsId = Get.arguments['sportsId'];

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  set setIsLoading(bool value) {
    _isLoading = value;
    update();
  }

  RxList sportPickerInnerSliderList = [
    SportPickInnerSlideodel(
      imageUrl: AppImages.userPlaceHolder,
      name: 'Abdul',
      rank: '12',
      team: 'Rehman',
    ),
    SportPickInnerSlideodel(
      imageUrl: AppImages.userPlaceHolder,
      name: 'Kumail',
      rank: '32',
      team: 'Kumail',
    ),
    SportPickInnerSlideodel(
      imageUrl: AppImages.userPlaceHolder,
      name: 'Asad',
      rank: '12',
      team: 'Kumail',
    ),
  ].obs;

  RxList innerLeaderBoardList = [
    SportPickInnerLeaderModel(
      rank: '1',
      awardImageUrl: AppImages.reward,
      gold: '12',
      goldSub: '3333',
      points: '45',
      pointSub: '123',
      price: '12',
    ),
    SportPickInnerLeaderModel(
      rank: '1',
      awardImageUrl: AppImages.reward,
      gold: '12',
      goldSub: '3333',
      points: '45',
      pointSub: '123',
      price: '12',
    ),
    SportPickInnerLeaderModel(
      rank: '1',
      awardImageUrl: AppImages.reward,
      gold: '12',
      goldSub: '3333',
      points: '45',
      pointSub: '123',
      price: '12',
    ),
    SportPickInnerLeaderModel(
      rank: '1',
      awardImageUrl: AppImages.reward,
      gold: '12',
      goldSub: '3333',
      points: '45',
      pointSub: '123',
      price: '12',
    ),
    SportPickInnerLeaderModel(
      rank: '1',
      awardImageUrl: AppImages.reward,
      gold: '12',
      goldSub: '3333',
      points: '45',
      pointSub: '123',
      price: '12',
    ),
    SportPickInnerLeaderModel(
      rank: '1',
      awardImageUrl: AppImages.reward,
      gold: '12',
      goldSub: '3333',
      points: '45',
      pointSub: '123',
      price: '12',
    ),
  ].obs;

  RxInt sportPickCrouselIndex = 0.obs;
  final CarouselSliderController sportPickLeaderCrouselController =
      CarouselSliderController();

  void onPreviousPublicCard() {
    sportPickLeaderCrouselController.previousPage();
  }

  void onNextPublicCard() {
    sportPickLeaderCrouselController.nextPage();
  }

  String token = '';

  LotoInnerLeaderboardModel drawsLeaderboardMatches =
      LotoInnerLeaderboardModel();

  Future<void> fetchDrawsLeaderboardMatches() async {
    try {
      setIsLoading = true;
      drawsLeaderboardMatches =
          await DrawsLeaderboardServices.fetchDrawsLeaderboard(
                  token, matchKey, sportsId) ??
              LotoInnerLeaderboardModel();
      log("Testing: ${drawsLeaderboardMatches.toString()}");
      update();
      setIsLoading = false;
    } catch (e) {
      setIsLoading = false;
      log("Error fetching leaderboard: $e");
    }
  }

  @override
  void onInit() async {
    token = await getStringValuesSF();
    log(matchKey);
    await fetchDrawsLeaderboardMatches();
    super.onInit();
  }
}
