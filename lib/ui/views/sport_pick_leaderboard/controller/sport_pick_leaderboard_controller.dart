import 'dart:developer';
import 'package:fmlfantasy/app/app_images/app_images.dart';
import 'package:fmlfantasy/core/config/global_instances.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/model/lotto_leaderboard_models.dart';
import 'package:fmlfantasy/model/sports_type.dart';
import 'package:fmlfantasy/services/create_lotto_services.dart';
import 'package:fmlfantasy/services/draws_leaderboard_services.dart';

class SportPickLeaderboardController extends GetxController {
  RxBool isSearch = false.obs;
  TextEditingController searchController = TextEditingController();
  RxInt selectedIndex = 0.obs;
  RxBool isPublicTournamentsLoading = false.obs;
  RxString selectedSport = 'BB'.obs;
  String token = '';
  RxString sportsValue = ''.obs;
  RxString sportsFullName = ''.obs;

  final RxString searchQuery = ''.obs;

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

  RxList<Sport> sportsList = <Sport>[
    Sport(title: 'BB', icon: AppImages.baseketball, name: 'B-ball'),
    Sport(title: 'FB', icon: AppImages.footballsvg, name: 'Football'),
    Sport(title: 'CR', icon: AppImages.cricket, name: 'Crick'),
    Sport(title: 'AF', icon: AppImages.americanFootballsvg, name: 'Football'),
    Sport(title: 'BL', icon: AppImages.baseballsvg, name: 'Base'),
    Sport(title: 'HK', icon: AppImages.iceHockeysvg, name: 'Hockey'),
  ].obs;

  RxList<LotoLeaderboardMatches> drawsLeaderboardMatches =
      <LotoLeaderboardMatches>[].obs;

  Future<void> fetchDrawsLeaderboardMatches() async {
    drawsLeaderboardMatches.value =
        await DrawsLeaderboardServices.fetchLotoLeaderboardMatches(
            token, sportsValue.value);
    log(drawsLeaderboardMatches.toString());
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
    await CreateLottoServices.getSports(token).then(
      (response) {
        sportsLists.value = response;
        var selectedSport = sportsLists.firstWhere(
          (e) => e['text'] == sportsFullName.value,
          orElse: () => null,
        );
        log(selectedSport.toString());
        sportsValue.value =
            selectedSport != null ? selectedSport['value'] : null;
      },
    );
    await fetchDrawsLeaderboardMatches();
    super.onInit();
  }
}
