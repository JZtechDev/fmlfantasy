import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fmlfantasy/core/config/global_instances.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/model/select_player_model.dart';
import 'package:fmlfantasy/model/tournament_model.dart';
import 'package:dio/dio.dart';

class TournamentServices {
  final token = getStringValuesSF();

  TournamentServices() {
    // Add headers to the Dio instance
    dio.options.headers['Authorization'] = token;
    dio.options.headers['X-Cid'] = 'aliv';
    dio.options.headers['Ocp-Apim-Subscription-Key'] = subscriptionkey;
  }

  Future<List<Tournaments>> fetchTournamentsAndMatches(
      String sportsCode) async {
    try {
      final response =
          await dio.get('$baseURL/tournaments/daily?sportCode=$sportsCode');

      if (response.statusCode == 200) {
        List<Tournaments> tournaments = (response.data as List)
            .map((json) => Tournaments.fromJson(json))
            .toList();
        return tournaments;
      } else {
        throw ' ${response.statusMessage.toString()}';
      }
    } on DioException catch (dioError) {
      if (dioError.response != null) {
        throw Exception(
            ' ${dioError.response?.statusCode} ${dioError.response?.statusMessage}');
      } else {
        throw Exception('${dioError.message}');
      }
    } catch (error) {
      throw Exception(' $error');
    }
  }

  Future<SelectTeam> fetchPlayers(String sports, String matchId) async {
    String uri;
    String subKey;
    switch (sports) {
      case "BB":
        uri = "$baseURL/matchcenter/basketball/match/$matchId/line-up";
        subKey = baseballSubscriptionKeyUs;
        break;
      case "FB":
        uri = "$baseURL/matchcenter/football/match/$matchId/line-up";
        subKey = footballSubscriptionKeyUs;
        break;
      case "CR":
        uri = "$baseURL/matchcenter/cricket/match/$matchId/line-up";
        subKey = cricketSubscriptionKeyUs;
        break;
      case 'AF':
        uri = "$baseURL/matchcenter/americanfootball/match/$matchId/line-up";
        subKey = americanFootballSubscriptionKeyUs;
        break;
      case 'BL':
        uri = "$baseURL/matchcenter/baseball/match/$matchId/line-up";
        subKey = baseballSubscriptionKeyUs;
        break;
      case 'HK':
        uri = "$baseURL/matchcenter/hockey/match/$matchId/line-up";
        subKey = iceHockeySubscriptionKeyUs;
        break;
      default:
        throw Exception('Invalid sport type');
    }
    EasyLoading.show(status: 'Fetching players...');

    try {
      final response = await dio.get(
        uri.toString(),
        options: Options(headers: {
          'Authorization': token,
          'X-Cid': 'aliv',
          'Ocp-Apim-Subscription-Key': subKey,
        }),
      );
      if (response.statusCode == 200) {
        EasyLoading.dismiss();
        return SelectTeam.fromJson(response.data);
      } else {
        EasyLoading.dismiss();
        Get.snackbar(
            'Error', 'Failed to fetch players: ${response.statusCode}');
        throw Exception('Failed to fetch players: ${response.statusCode}');
      }
    } on DioException catch (error) {
      EasyLoading.dismiss();
      if (error.response != null) {
        EasyLoading.dismiss();
        Get.snackbar(
            'Error', 'Failed to fetch players: ${error.response?.statusCode}');
        throw Exception(
            'Failed to fetch players: ${error.response?.statusCode}');
      } else {
        EasyLoading.dismiss();
        Get.snackbar('Error', 'Failed to fetch players: ${error.message}');
        throw Exception('Failed to fetch players: ${error.message}');
      }
    } catch (error) {
      EasyLoading.dismiss();
      Get.snackbar('Error', 'An unexpected error occurred');
      throw Exception('An unexpected error occurred: $error');
    }
  }

  Future<Map<String, dynamic>> fetchMatchTime(
      String matchID, String sports) async {
    String uri;
    String subKey;
    switch (sports) {
      case "BB":
        uri = "$baseURL/matchcenter/basketball/match/$matchID/info";
        subKey = basketballSubscriptionKeyUs;
        break;
      case "FB":
        uri = "$baseURL/matchcenter/football/match/$matchID/info";
        subKey = footballSubscriptionKeyUs;
        break;
      case "CR":
        uri = "$baseURL/matchcenter/cricket/match/$matchID/info";
        subKey = cricketSubscriptionKeyUs;
        break;
      case 'AF':
        uri = "$baseURL/matchcenter/americanfootball/match/$matchID/info";
        subKey = americanFootballSubscriptionKeyUs;
        break;
      case 'BL':
        uri = "$baseURL/matchcenter/baseball/match/$matchID/info";
        subKey = baseballSubscriptionKeyUs;
        break;
      case 'HK':
        uri = "$baseURL/matchcenter/hockey/match/$matchID/info";
        subKey = iceHockeySubscriptionKeyUs;
      default:
        throw Exception('abc');
    }
    try {
      final response = await dio.get(
        uri,
        options: Options(headers: {
          'Authorization': token,
          'X-Cid': 'aliv',
          'Ocp-Apim-Subscription-Key': subKey,
        }),
      );
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('Failed to load match data');
      }
    } catch (error) {
      throw Exception('Unexpected error: $error');
    }
  }

  Future<List<Tournaments>> fetchPrivateTournaments(
      String sportsCode, String authToken) async {
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
      default:
        throw Exception('abc');
    }

    try {
      final response = await dio.get(
        '$baseURL/tournaments/private?sportCode=$sportsCode',
        options: Options(headers: {
          'Authorization': "Bearer $authToken",
          'X-Cid': 'aliv',
          'Ocp-Apim-Subscription-Key': subKey,
        }),
      );

      if (response.statusCode == 200) {
        List<Tournaments> privateTournaments = (response.data as List)
            .map((json) => Tournaments.fromJson(json))
            .toList();
        return privateTournaments;
      } else {
        throw ' ${response.statusMessage.toString()}';
      }
    } on DioException catch (dioError) {
      if (dioError.response != null) {
        throw Exception(
            ' ${dioError.response?.statusCode} ${dioError.response?.statusMessage}');
      } else {
        throw Exception('${dioError.message}');
      }
    } catch (error) {
      throw Exception(' $error');
    }
  }
}
