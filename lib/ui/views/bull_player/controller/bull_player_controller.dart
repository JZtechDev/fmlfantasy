import 'package:fmlfantasy/app/app%20routes/app_routes.dart';
import 'package:fmlfantasy/app/app_images/app_images.dart';
import 'package:fmlfantasy/model/select_player_model.dart';
import 'package:fmlfantasy/services/tournament_services.dart';
import 'package:get/get.dart';

class BullPlayerController extends GetxController {
  RxList<Players> selectedPlayers = Get.arguments['selectedPlayers'];
  String matchID = Get.arguments['matchID'];
  String sportName = Get.arguments['sport'];
  String tournamentId = Get.arguments['tournamentId'];
  TournamentServices tournamentServices = TournamentServices();
  RxList<Players> bullPlayer = <Players>[].obs;

  void selectBullPlayer(Players player) {
    bullPlayer.clear();
    bullPlayer.add(player);
  }

  String getPitchesImages(String sportName) {
    switch (sportName) {
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

  @override
  void onInit() {
    // Find a player with isBull set to true
    final existingBullPlayer = selectedPlayers
        .firstWhereOrNull((player) => player.isBull.value == true);

    if (existingBullPlayer != null) {
      bullPlayer.add(existingBullPlayer);
    } else if (selectedPlayers.isNotEmpty) {
      selectedPlayers.first.isBull.value = true;
      bullPlayer.add(selectedPlayers.first);
    }

    super.onInit();
  }

  String getIconPath(String sportName) {
    switch (sportName) {
      case 'CR':
        return AppImages.cricket;
      case 'AF':
        return AppImages.americanFootballsvg;
      case 'BB':
        return AppImages.baseketball;
      case 'BL':
        return AppImages.baseballsvg;
      case 'HK':
        return AppImages.iceHockeysvg;
      default:
        return AppImages.footballsvg;
    }
  }

  var selectedIndex = (-1).obs;

  void navigate() {
    Get.toNamed(AppRoutes.teamName, arguments: {
      'selectedPlayers': selectedPlayers,
      'matchID': matchID,
      'sport': sportName,
      'tournamentId': tournamentId,
      'sportsName': sportName
    });
  }
}
