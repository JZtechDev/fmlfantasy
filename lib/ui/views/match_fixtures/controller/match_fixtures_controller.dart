import 'package:fmlfantasy/app/app_images/app_images.dart';
import 'package:fmlfantasy/core/config/global_instances.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/model/sports_type.dart';
import 'package:fmlfantasy/model/tournament_model.dart';
import 'package:fmlfantasy/services/tournament_services.dart';

class MatchFixturesController extends GetxController {
  RxBool isSearchEnable = false.obs;
  RxBool isLoading = false.obs;
  RxInt selectedIndex = 0.obs;
  RxString selectedSport = 'BB'.obs;
  RxList<Sport> sportsList = <Sport>[
    Sport(title: 'BB', icon: AppImages.baseketball, name: 'B-ball'),
    Sport(title: 'FB', icon: AppImages.footballsvg, name: 'Football'),
    Sport(title: 'CR', icon: AppImages.cricket, name: 'Crick'),
    Sport(title: 'AF', icon: AppImages.americanFootballsvg, name: 'Football'),
    Sport(title: 'BL', icon: AppImages.baseballsvg, name: 'Base'),
    Sport(title: 'HK', icon: AppImages.iceHockeysvg, name: 'Hockey'),
  ].obs;

  RxList<Tournaments> fixtures = <Tournaments>[].obs;

  Future<List<Tournaments>> fetchedTournaments() async {
    try {
      isLoading.value = true;
      List<Tournaments> fetchedTournaments = await TournamentServices()
          .fetchTournamentsAndMatches(selectedSport.value);
      fixtures.value = fetchedTournaments;
      isLoading.value = false;
      return fixtures;
    } catch (error) {
      isLoading.value = false;
      rethrow; // Rethrow the error to handle it in the FutureBuilder
    }
  }

  @override
  void onInit() {
    selectedSport.value = selectedSPort.value;
    fetchedTournaments();
    super.onInit();
  }
}
