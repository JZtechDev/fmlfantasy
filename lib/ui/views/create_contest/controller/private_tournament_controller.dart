import 'package:fmlfantasy/app/app_images/app_images.dart';
import 'package:fmlfantasy/core/config/global_instances.dart';
import 'package:fmlfantasy/model/sports_type.dart';
import 'package:fmlfantasy/model/tournament_model.dart';
import 'package:fmlfantasy/services/tournament_services.dart';
import 'package:get/get.dart';

class PrivateTournamentController extends GetxController {
  RxString selectedSport = 'BB'.obs;
  RxInt selectedIndex = 0.obs;

  //String token = '';
  RxBool tournamentLoading = false.obs;
  RxList<TournamentModel> tournamentCardList = <TournamentModel>[].obs;

  RxList<Sport> sportsList = <Sport>[
    Sport(title: 'BB', icon: AppImages.baseketball, name: 'B-ball'),
    Sport(title: 'FB', icon: AppImages.footballsvg, name: 'Football'),
    Sport(title: 'CR', icon: AppImages.cricket, name: 'Crick'),
    Sport(title: 'AF', icon: AppImages.americanFootballsvg, name: 'Football'),
    Sport(title: 'BL', icon: AppImages.baseballsvg, name: 'Base'),
    Sport(title: 'HK', icon: AppImages.iceHockeysvg, name: 'Hockey'),
  ].obs;

  Future<List<TournamentModel>> fetchedTournaments() async {
    try {
      tournamentLoading.value = true;
      List<TournamentModel> fetchedTournaments = await TournamentServices()
          .fetchTournamentsAndMatches(selectedSport.value);
      tournamentCardList.value = fetchedTournaments;
      tournamentLoading.value = false;
      return tournamentCardList;
    } catch (error) {
      tournamentLoading.value = false;
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
