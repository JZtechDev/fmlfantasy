import 'package:fmlfantasy/core/config/global_instances.dart';
import 'package:fmlfantasy/model/my_teams_model.dart';
import 'package:fmlfantasy/model/my_teams_players_model.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class MyteamServices {
  Future<List<MyTeamsModel>> getMyTeams(String token, String sports) async {
    String url;
    String subKey;
    switch (sports) {
      case "BB":
        url = "http://40.113.171.107:50086/teams?sportCode=$sports";
        subKey = basketballSubscriptionKeyUs;
        break;
      case "FB":
        url = "$baseURL/teams?sportCode=$sports";
        subKey = footballSubscriptionKeyUs;
        break;
      case "CR":
        url = "$baseURL/teams?sportCode=$sports";
        subKey = cricketSubscriptionKeyUs;
        break;
      case 'AF':
        url = "http://40.113.171.107:50086/teams/$sports";
        subKey = americanFootballSubscriptionKeyUs;
        break;
      case 'BL':
        url = "$baseURL/teams?sportCode=$sports";
        subKey = baseballSubscriptionKeyUs;
        break;
      case 'HK':
        url = "$baseURL/teams?sportCode=$sports";
        subKey = iceHockeySubscriptionKeyUs;
        break;
      default:
        Get.snackbar('Error', 'Invalid sport type');
        return [];
    }
    try {
      final response = await dio.get(
        url,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'X-Cid': 'aliv',
            'Ocp-Apim-Subscription-Key': subKey,
            // 'Content-Type': 'application/json',
          },
        ),
      );
      // print(response.data);
      List<MyTeamsModel> myTeams = (response.data as List)
          .map((json) => MyTeamsModel.fromJson(json))
          .toList();
      return myTeams;
    } catch (error) {
      throw Exception('Failed to fetch tournaments and matches: $error');
    }
  }

  Future<List<MyTeamPlayersModel>> gethMyTeamsPlayers(
      String sports, String teamId, String token) async {
    String url;
    String subKey;
    switch (sports) {
      case "BB":
        url = "$baseURL/teams/${sports}/$teamId/players?sportCode=$sports";
        subKey = basketballSubscriptionKeyUs;
        break;
      case "FB":
        url = "$baseURL/teams/$teamId/players?sportCode=$sports";
        subKey = footballSubscriptionKeyUs;
        break;
      case "CR":
        url = "$baseURL/teams/$teamId/players?sportCode=$sports";
        subKey = cricketSubscriptionKeyUs;
        break;
      case 'AF':
        url = "http://40.113.171.107:50086/teams/${sports}/$teamId/players";

        subKey = americanFootballSubscriptionKeyUs;
        break;
      case 'BL':
        url = "$baseURL/teams/$teamId/players?sportCode=$sports";
        subKey = baseballSubscriptionKeyUs;
        break;
      case 'HK':
        url = "$baseURL/teams/$teamId/players?sportCode=$sports";
        subKey = iceHockeySubscriptionKeyUs;
        break;
      default:
        throw Exception('Invalid sport type');
    }
    try {
      final response = await dio.get(
        url,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'X-Cid': 'aliv',
            'Ocp-Apim-Subscription-Key': subKey,
            // 'Content-Type': 'application/json',
          },
        ),
      );
      if (response.statusCode == 200) {
        List<MyTeamPlayersModel> myTeamPlayers = (response.data as List)
            .map((json) => MyTeamPlayersModel.fromJson(json))
            .toList();
        return myTeamPlayers;
      } else {
        return [];
      }
    } catch (error) {
      return [];
    }
  }

  static Future<bool> editTeam(
    String token,
    String teamId,
    String sports,
    String teamName,
    List<Map<String, dynamic>> postData,
  ) async {
    String url;
    String subKey;
    switch (sports) {
      case "BB":
        url = "$baseURL/teams";
        subKey = basketballSubscriptionKeyUs;
        break;
      case "FB":
        url = "$baseURL/teams";
        subKey = footballSubscriptionKeyUs;
        break;
      case "CR":
        url = "$baseURL/teams";
        subKey = cricketSubscriptionKeyUs;
        break;
      case 'AF':
        url = "$baseURL/teams";
        subKey = americanFootballSubscriptionKeyUs;
        break;
      case 'BL':
        url = "$baseURL/teams";
        subKey = baseballSubscriptionKeyUs;
        break;
      case 'HK':
        url = "$baseURL/teams";
        subKey = iceHockeySubscriptionKeyUs;
        break;
      default:
        throw Exception('Invalid sport type');
    }

    try {
      final response = await dio.put(
        url,
        data: {
          "id": teamId,
          "name": teamName,
          "players": postData,
          "sportCode": sports,
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
        Get.snackbar('Success', 'Team Edited Successfully');
        return true;
      }
    } catch (error) {
      throw Exception('Failed to fetch tournaments and matches: $error');
    }
    return false;
  }

  Future<bool> copyTeam(
      String sportsCode, String teamId, String teamName, String token) async {
    String subKey;
    switch (sportsCode) {
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
        '$baseURL/teams/copy',
        data: {
          "name": teamName,
          "id": teamId,
        },
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'X-Cid': 'aliv',
            'Ocp-Apim-Subscription-Key': subKey,
          },
        ),
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        Get.snackbar('Error',
            'Failed to copy team. Status code: ${response.statusCode}');
        return false;
      }
    } on DioException catch (e) {
      Get.snackbar('Error',
          'Failed to copy team. Error: ${e.response?.data['message']}');
      return false;
    } catch (error) {
      Get.snackbar('Error', 'An unexpected error occurred. Please try again.');
      return false;
    }
  }
}
