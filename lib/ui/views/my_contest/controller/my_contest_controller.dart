import 'package:fmlfantasy/app/app_images/app_images.dart';
import 'package:fmlfantasy/core/config/global_instances.dart';
import 'package:fmlfantasy/model/sports_type.dart';
import 'package:fmlfantasy/model/tournament_model.dart';
import 'package:fmlfantasy/services/my_contest_services.dart';

import '../../../../core/imports/imports.dart';

class MyContestController extends GetxController {
  RxInt selectedIndex = 0.obs;
  RxString selectedSport = 'BB'.obs;
  String token = '';
  RxList<Tournaments> contests = <Tournaments>[].obs;

  RxList<Sport> sportsList = <Sport>[
    Sport(title: 'BB', icon: AppImages.baseketball, name: 'B-ball'),
    Sport(title: 'FB', icon: AppImages.footballsvg, name: 'Football'),
    Sport(title: 'CR', icon: AppImages.cricket, name: 'Crick'),
    Sport(title: 'AF', icon: AppImages.americanFootballsvg, name: 'Football'),
    Sport(title: 'BL', icon: AppImages.baseballsvg, name: 'Base'),
    Sport(title: 'HK', icon: AppImages.iceHockeysvg, name: 'Hockey'),
  ].obs;

  RxBool isLoading = false.obs;

  Future<List<Tournaments>> fetchMyContestTournaments() async {
    contests.clear();
    try {
      isLoading.value = true;
      List<Tournaments> contest = await MyContestServices.myContestTournaments(
          selectedSport.value, token);
      contests.value = contest;
      isLoading.value = false;
      return contest;
    } catch (error) {
      isLoading.value = false;
      rethrow;
    } finally {
      if (!isLoading.value) {
        isLoading.value = false;
      }
    }
  }

  @override
  void onInit() async {
    selectedSport.value = selectedSPort.value;
    token = await getStringValuesSF();
    await fetchMyContestTournaments();

    super.onInit();
  }
}
