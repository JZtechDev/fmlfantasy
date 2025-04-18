import 'dart:developer';
import 'package:fmlfantasy/app/app_images/app_images.dart';
import 'package:fmlfantasy/core/config/global_instances.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/model/match_center_inner.dart';
import 'package:fmlfantasy/model/my_teams_model.dart';
import 'package:fmlfantasy/model/my_teams_players_model.dart';
import 'package:fmlfantasy/model/sports_type.dart';
import 'package:fmlfantasy/services/match_center_services.dart';
import 'package:fmlfantasy/services/myteam_services.dart';
import 'package:fmlfantasy/ui/views/my_teams/widgets/copy_team_modal.dart';
import 'package:fmlfantasy/ui/views/my_teams/widgets/top_performers_modal.dart';
import 'package:carousel_slider_plus/carousel_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyTeamsController extends GetxController
    with GetTickerProviderStateMixin {
  RxString selectedSport = 'BB'.obs;
  RxInt myTeamCrouselIndex = 0.obs;
  RxBool isLoadingMyTeamPlayer = false.obs;
  late AnimationController animationController;
  RxList<MyTeamsModel> myTeams = <MyTeamsModel>[].obs;
  RxList<MyTeamsModel> filteredData = <MyTeamsModel>[].obs;
  RxList<InnerMatchCenterModel> matchCenterInnerData =
      <InnerMatchCenterModel>[].obs;
  RxList<MyTeamPlayersModel> myTeamPlayers = <MyTeamPlayersModel>[].obs;
  final CarouselSliderController myTeamCrouselController =
      CarouselSliderController();
  TextEditingController teamName = TextEditingController();
  RxString teamId = ''.obs;
  RxString team = ''.obs;
  RxString matchCode = ''.obs;
  RxString tournamentId = ''.obs;
  var selectedCard = 0.obs;
  var selectedTeamId = ''.obs;
  var isSelected = false.obs;
  var selectedleader = (-1).obs;
  RxBool isLoading = false.obs;
  RxBool copyLoading = false.obs;
  String token = '';
  var isdeleteloading = false.obs;
  MyteamServices getMyTeamServices = MyteamServices();
  RxInt selectedIndex = 0.obs;
  RxBool isPlayersLoading = false.obs;
  RxInt totalPoints = 0.obs;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  RxString showAll = 'all'.obs;

  MatchCenterServices matchCenterServices = MatchCenterServices();
  ScrollController scrollController = ScrollController();
  RxBool isStats = true.obs;
  var isStatsList = List.generate(5, (_) => true.obs).obs;
  RxInt topPlayerCrouselIndex = 0.obs;
  RxBool isLoadingTopPlayers = false.obs;
  RxBool hasError = false.obs;
  MyTeamsModel selectedTeams = MyTeamsModel();
  void selectTeam(int index, String id, MyTeamsModel selectedTeam) {
    selectedCard.value = index;
    selectedTeamId.value = id;
    selectedTeams = selectedTeam;
    fetchMyTeamsPlayers();
    if (selectedTeam.matchData!.status! == 'not_started') {
      log('Test');
    } else {
      fetchMatchCenterInnerData(matchCode.value);
    }
  }

  var deleteIndex = 0.obs;
  var deleteTeamId = ''.obs;
  void deleteTeam(String teamId, int index) async {
    deleteIndex.value = index;
    deleteTeamId.value = teamId;
  }

  void showCopyModal(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return const CopyTeamDialogue();
        });
  }

  void showTopPerfomers(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return const TopPerformersModal();
        });
  }

  int calculateTotalPoitns() {
    totalPoints.value = 0;
    for (var element in myTeamPlayers) {
      totalPoints.value = totalPoints.value + element.investment!.toInt();
    }
    return totalPoints.value;
  }

  @override
  void onInit() async {
    selectedSport.value = selectedSPort.value;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    log(prefs.getString('kycSid').toString());
    token = await getStringValuesSF();
    await fetchTeams();
    editTeamUpdateValue();
    await fetchMyTeamsPlayers();
    super.onInit();
  }

  void editTeamUpdateValue() {
    selectedTeamId.value = myTeams[0].id.toString();
    team.value = myTeams[0].name.toString();
    teamId.value = myTeams[0].id.toString();
    tournamentId.value = myTeams[0].matchData!.tournamentId.toString();
    matchCode.value = myTeams[0].matchData!.matchCode.toString();
  }

  RxList<Sport> sportsList = <Sport>[
    Sport(title: 'BB', icon: AppImages.baseketball, name: 'B-ball'),
    Sport(title: 'FB', icon: AppImages.footballsvg, name: 'Football'),
    Sport(title: 'CR', icon: AppImages.cricket, name: 'Crick'),
    Sport(title: 'AF', icon: AppImages.americanFootballsvg, name: 'Football'),
    Sport(title: 'BL', icon: AppImages.baseballsvg, name: 'Base'),
    Sport(title: 'HK', icon: AppImages.iceHockeysvg, name: 'Hockey'),
  ].obs;
  Future<List<MyTeamsModel>> fetchTeams() async {
    try {
      isLoading.value = true;
      List<MyTeamsModel> fetchedTeams =
          await getMyTeamServices.getMyTeams(token, selectedSport.value);
      myTeams.value = fetchedTeams;
      filteredData.value = fetchedTeams;
      if (myTeams.isEmpty) {
        clearMyTeamsPlayers();
      } else {
        fetchMyTeamsPlayers();
      }
      isLoading.value = false;
      animationController.reset();
      animationController.forward();
      return fetchedTeams;
    } catch (error) {
      isLoading.value = false;
      rethrow;
    }
  }

  String getPitchesImages(String sportName) {
    switch (selectedSport.value) {
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

  Future<List<MyTeamPlayersModel>> fetchMyTeamsPlayers() async {
    try {
      isLoadingMyTeamPlayer.value = true;
      List<MyTeamPlayersModel> fetchedTeamsPlayer = await getMyTeamServices
          .gethMyTeamsPlayers(selectedSport.value, selectedTeamId.value, token);
      fetchedTeamsPlayer.sort((a, b) {
        if (a.isCaptain == true && b.isCaptain != true) {
          return -1;
        } else if (a.isCaptain != true && b.isCaptain == true) {
          return 1;
        } else {
          return 0;
        }
      });
      isLoadingMyTeamPlayer.value = false;
      myTeamPlayers.value = fetchedTeamsPlayer;
      return fetchedTeamsPlayer;
    } catch (error) {
      isLoadingMyTeamPlayer.value = false;
      log('Error fetching players: $error');

      rethrow;
    }
  }

  void clearMyTeamsPlayers() {
    myTeamPlayers.clear();
  }

  Future<bool> copyTeam(String sportsCode, String teamId, String teamName,
      String token, BuildContext context) async {
    if (formKey.currentState!.validate()) {
      copyLoading.value = true;
      bool data =
          await getMyTeamServices.copyTeam(sportsCode, teamId, teamName, token);
      if (data) {
        copyLoading.value = false;
        Get.snackbar('Success', 'Team Copied Successfully');
        // ignore: use_build_context_synchronously
        Navigator.pop(context);
        return true;
      } else {
        copyLoading.value = false;
        Get.snackbar('Error', 'Something went wrong');
        return false;
      }
    }
    return false;
  }

  Future<List<InnerMatchCenterModel>> fetchMatchCenterInnerData(
      String matchKeys) async {
    try {
      isLoadingTopPlayers.value = true;
      hasError.value = false;
      List<InnerMatchCenterModel> fetchedTournaments = await matchCenterServices
          .fetchMatchCenterInnerData(matchKeys, selectedSport.value);
      matchCenterInnerData.value = fetchedTournaments;
      isLoadingTopPlayers.value = false;
      hasError.value = false;

      return matchCenterInnerData;
    } catch (error) {
      hasError.value = true;
      isLoading.value = false;
      rethrow;
    }
  }

  void onNextPublicCard() {
    myTeamCrouselController.nextPage();
  }

  void onPreviousPublicCard() {
    myTeamCrouselController.previousPage();
  }
}
