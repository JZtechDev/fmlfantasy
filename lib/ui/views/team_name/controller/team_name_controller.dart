import 'package:fmlfantasy/app/app%20routes/app_routes.dart';
import 'package:fmlfantasy/app/app_colors/app_colors.dart';
import 'package:fmlfantasy/model/select_player_model.dart';
import 'package:fmlfantasy/services/create_team_services.dart';
import 'package:fmlfantasy/services/myteam_services.dart';
import 'package:fmlfantasy/ui/views/select_players/controller/select_player_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TeamNameController extends GetxController {
  CreateTeamServices createTeamServices = CreateTeamServices();
  static SelectPlayerController get selectPlayersController => Get.find();
  final teamName = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  RxList<Players> selectedPlayers = Get.arguments['selectedPlayers'];
  String sportsName = Get.arguments['sport'];
  String tournamentId = Get.arguments['tournamentId'];
  late String token;
  RxBool isLoading = false.obs;

  Future<void> sendBullPlayerData() async {
    List<Map<String, dynamic>> playerData = selectedPlayers
        .map((player) =>
            {'assetCode': player.assetCode, 'isCaptain': player.isBull.value})
        .toList();
    try {
      isLoading.value = true;
      bool result = await createTeamServices.createTeam(
          playerData, teamName.text, tournamentId, token, sportsName);
      if (result == true) {
        isLoading.value = false;
        Get.snackbar(
          'Success',
          'Team created successfully. Redirecting to home page',
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppColors.dark,
        );
        Get.offAllNamed(AppRoutes.home);
      } else {
        isLoading.value = false;
        //Get.snackbar('Error', 'Error Occurred',colorText: Colors.white,snackPosition: SnackPosition.BOTTOM,backgroundColor: AppColors.dark,);
      }
    } catch (e) {
      isLoading.value = false;
    }
  }

  Future<void> createPrivateTeam() async {
    List<Map<String, dynamic>> playerData = selectedPlayers
        .map((player) =>
            {'assetCode': player.assetCode, 'isCaptain': player.isBull.value})
        .toList();
    try {
      isLoading.value = true;
      bool result = await createTeamServices.createPrivateTeam(
          playerData,
          teamName.text,
          tournamentId,
          token,
          sportsName,
          selectPlayersController.joinCode.toString());
      if (result == true) {
        isLoading.value = false;
        Get.snackbar(
          'Success',
          'Team created successfully. Redirecting to home page',
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppColors.dark,
        );
        Get.offAllNamed(AppRoutes.home);
      } else {
        isLoading.value = false;
        //Get.snackbar('Error', 'Error Occurred',colorText: Colors.white,snackPosition: SnackPosition.BOTTOM,backgroundColor: AppColors.dark,);
      }
    } catch (e) {
      isLoading.value = false;
    }
  }

  Future<void> editTeam() async {
    List<Map<String, dynamic>> players = selectedPlayers
        .map((player) =>
            {'assetCode': player.assetCode, 'isCaptain': player.isBull.value})
        .toList();

    try {
      isLoading.value = true;
      bool result = await MyteamServices.editTeam(
        token,
        selectPlayersController.teamId.toString(),
        sportsName,
        teamName.text,
        players,
      );
      if (result == true) {
        isLoading.value = false;
        Get.snackbar(
          'Success',
          'Team edited successfully. Redirecting to home page',
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppColors.dark,
        );
        Get.offAllNamed(AppRoutes.home);
      } else {
        isLoading.value = false;
      }
    } catch (e) {
      isLoading.value = false;
    }
  }

  @override
  void onInit() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token') ?? '';
    super.onInit();
  }

  Future<void> validate() async {
    if (formKey.currentState!.validate()) {
      selectPlayersController.joinCode != null
          ? createPrivateTeam()
          : selectPlayersController.teamId == null
              ? sendBullPlayerData()
              : editTeam();
    }
  }
}
