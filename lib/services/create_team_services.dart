import 'package:fmlfantasy/core/config/global_instances.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class CreateTeamServices {
  Future<bool> createTeam(
    List<Map<String, dynamic>> postData,
    String teamName,
    String tournamentId,
    String token,
    String sports,
  ) async {
    String subKey;
    switch (sports) {
      case "BB":
        subKey = basketballSubscriptionKeyUs;
        break;
      case "FB":
        subKey = footballSubscriptionKeyUs;
        break;
      case "CR":
        subKey = cricketSubscriptionKeyUs;
        break;
      case 'AF':
        subKey = americanFootballSubscriptionKeyUs;
        break;
      case 'BL':
        subKey = baseballSubscriptionKeyUs;
        break;
      case 'HK':
        subKey = iceHockeySubscriptionKeyUs;
        break;
      default:
        Get.snackbar('Error', 'Invalid sport type');
        return false;
    }

    try {
      final response = await dio.post(
        "http://40.113.171.107:50086/teams/with-players",
        data: {
          "name": teamName,
          "players": postData,
          "tournamentId": tournamentId,
          "sportCode": sports,
          "isPrivate": false,
          "joinCode": '',
        },
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'X-Cid': 'aliv',
            'Ocp-Apim-Subscription-Key': subKey,
            'Content-Type': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        Get.snackbar('Error', 'Error Occurred: ${response.statusMessage}');
        return false;
      }
    } on DioException catch (e) {
      if (e.response != null) {
        // Server responded with an error
        Get.snackbar(
            'Error', e.response!.data['Message'] ?? 'Unknown server error');
        return false;
      } else {
        // Error sending request
        Get.snackbar('Error', 'Network error: ${e.response}');
        return false;
      }
    } catch (e) {
      // Handle other errors such as parsing errors
      Get.snackbar('Error', 'Something went wrong: ${e.toString()}');
      return false;
    }
  }

  Future<bool> createPrivateTeam(
      List<Map<String, dynamic>> postData,
      String teamName,
      String tournamentId,
      String token,
      String sports,
      String joinCode) async {
    String subKey;
    switch (sports) {
      case "BB":
        subKey = basketballSubscriptionKeyUs;
        break;
      case "FB":
        subKey = footballSubscriptionKeyUs;
        break;
      case "CR":
        subKey = cricketSubscriptionKeyUs;
        break;
      case 'AF':
        subKey = americanFootballSubscriptionKeyUs;
        break;
      case 'BL':
        subKey = baseballSubscriptionKeyUs;
        break;
      case 'HK':
        subKey = iceHockeySubscriptionKeyUs;
        break;
      default:
        Get.snackbar('Error', 'Invalid sport type');
        return false;
    }

    try {
      final response = await dio.post(
        "$baseURL/teams/with-players",
        data: {
          "name": teamName,
          "players": postData,
          "TournamentId": tournamentId,
          "type": '1',
          "joinCode": joinCode
        },
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'X-Cid': 'aliv',
            'Ocp-Apim-Subscription-Key': subKey,
            'Content-Type': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        Get.snackbar('Error', 'Error Occurred: ${response.statusMessage}');
        return false;
      }
    } on DioException catch (e) {
      if (e.response != null) {
        // Server responded with an error
        Get.snackbar(
            'Error', e.response!.data['Message'] ?? 'Unknown server error');
        return false;
      } else {
        // Error sending request
        Get.snackbar('Error', 'Network error: ${e.response}');
        return false;
      }
    } catch (e) {
      // Handle other errors such as parsing errors
      Get.snackbar('Error', 'Something went wrong: ${e.toString()}');
      return false;
    }
  }
}
