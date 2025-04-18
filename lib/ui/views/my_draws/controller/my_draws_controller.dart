import 'dart:developer';

import 'package:fmlfantasy/app/app_images/app_images.dart';
import 'package:fmlfantasy/core/config/global_instances.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/model/my_draws_model.dart';
import 'package:fmlfantasy/model/sports_type.dart';
import 'package:fmlfantasy/services/create_lotto_services.dart';
import 'package:fmlfantasy/services/my_draws_services.dart';
import 'package:carousel_slider_plus/carousel_controller.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class MyDrawsController extends GetxController {
  RxBool isTileExpanded = false.obs;
  RxString selectedSport = 'BB'.obs;
  RxInt selectedIndex = 0.obs;
  RxBool isLoadingWinGrid = false.obs;
  String token = '';
  RxList<DrawTeamsModel> myDrawsTeams = <DrawTeamsModel>[].obs;
  RxString sportsValue = ''.obs;
  RxBool selectedCard = false.obs;
  RxString sportsFullName = ''.obs;
  RxList<bool> expanded = <bool>[].obs;

  RxList<MyDrawsModels> myDrawsDetails = <MyDrawsModels>[].obs;
  late Map<String, dynamic> decodedToken;
  RxString userId = ''.obs;

  void getSportsName() {
    switch (selectedSport.value) {
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

  RxList<dynamic> sportsLists = <dynamic>[].obs;

  RxBool isLoading = false.obs;
  late AnimationController animationController;
  final CarouselSliderController myDrawsCrouselController =
      CarouselSliderController();

  RxList<Sport> sportsList = <Sport>[
    Sport(title: 'BB', icon: AppImages.baseketball, name: 'B-ball'),
    Sport(title: 'FB', icon: AppImages.footballsvg, name: 'Football'),
    Sport(title: 'CR', icon: AppImages.cricket, name: 'Crick'),
    Sport(title: 'AF', icon: AppImages.americanFootballsvg, name: 'Football'),
    Sport(title: 'BL', icon: AppImages.baseballsvg, name: 'Base'),
    Sport(title: 'HK', icon: AppImages.iceHockeysvg, name: 'Hockey'),
  ].obs;

  void onPreviousPublicCard() {
    myDrawsCrouselController.previousPage();
  }

  void onNextPublicCard() {
    myDrawsCrouselController.nextPage();
  }

  Future<List<DrawTeamsModel>> fetchDrawsTeams() async {
    try {
      isLoading.value = true;
      List<DrawTeamsModel> fetchedTeams =
          await MyDrawsServices.fetchMyDraws(token, sportsValue.value);
      myDrawsTeams.value = fetchedTeams;
      isLoading.value = false;

      return fetchedTeams;
    } catch (error) {
      isLoading.value = false;
      rethrow;
    }
  }

  Future<List<MyDrawsModels>> fetchDrawsDetails(String drawId) async {
    try {
      isLoading.value = true;
      List<MyDrawsModels> fetchedDetails =
          await MyDrawsServices.fetchMyDrawsDetails(token, drawId);
      myDrawsDetails.value = fetchedDetails;
      for (int i = 0; i < myDrawsDetails.length; i++) {
        expanded.add(false);
        log(expanded.toString());
      }
      isLoading.value = false;
      return fetchedDetails;
    } catch (error) {
      isLoading.value = false;
      rethrow;
    }
  }

  void getSportsId() {
    var selectedSport = sportsLists.firstWhere(
      (e) => e['text'] == sportsFullName.value,
      orElse: () => null,
    );
    sportsValue.value = selectedSport != null ? selectedSport['value'] : null;
  }

  @override
  void onInit() async {
    selectedSport.value = selectedSPort.value;
    token = await getStringValuesSF();
    getSportsName();
    decodedToken = JwtDecoder.decode(token);
    log(decodedToken.toString());
    userId.value = await decodedToken['nameid'];
    isLoading.value = true;
    await CreateLottoServices.getSports(token).then(
      (response) {
        sportsLists.value = response;
        var selectedSport = sportsLists.firstWhere(
          (e) => e['text'] == sportsFullName.value,
          orElse: () => null,
        );
        sportsValue.value =
            selectedSport != null ? selectedSport['value'] : null;
      },
    );
    await fetchDrawsTeams();
    isLoading.value = false;
    super.onInit();
  }
}
