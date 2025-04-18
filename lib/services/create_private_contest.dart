import 'dart:convert';
import 'dart:developer';

import 'package:fmlfantasy/core/config/global_instances.dart';
import 'package:fmlfantasy/model/tournaments_name_model.dart';
import 'package:dio/dio.dart';

class CreatePrivateContestServices {
  static Future<List<TournamentsName>> createPrivateContest(
      String match) async {
    String url;
    String subKey;
    switch (match) {
      case "BB":
        url = '$clientApi/aquabasketballapi-dev/competition';
        subKey = basketballSubscriptionKeyUs;
        break;
      case "FB":
        url = '$clientApi/aquafootballapi-dev/competition';
        subKey = footballSubscriptionKeyUs;
        break;
      case "CR":
        url = '$clientApi/aquacricketapi-dev/competition';
        subKey = cricketSubscriptionKeyUs;
        break;
      case 'AF':
        url = '$clientApi/aquaamericanfootballapi-dev/competition';
        subKey = americanFootballSubscriptionKeyUs;
        break;
      case 'BL':
        url = '$clientApi/aquabaseballapi-dev/competition';
        subKey = baseballSubscriptionKeyUs;
        break;
      case 'HK':
        url = '$clientApi/aquahockeyapi-dev/competition';
        subKey = iceHockeySubscriptionKeyUs;
        break;
      default:
        return [];
    }
    try {
      final response = await dio.get(
        url,
        options: Options(
          headers: {
            'Ocp-Apim-Subscription-Key': subKey,
            'X-Cid': 'aliv',
          },
        ),
      );
      if (response.statusCode == 200) {
        List<TournamentsName> tounamentsName = (response.data as List)
            .map((json) => TournamentsName.fromJson(json))
            .toList();
        return tounamentsName;
      } else {
        return [];
      }
    } on DioException catch (dioError) {
      if (dioError.response != null) {
      } else {
        return [];
      }
      return [];
    } catch (error) {
      return [];
    }
  }

  static Future<List<Matches>> privateTournamentMatch(
      String match, String competitionId) async {
    String uri;
    String subKey;
    switch (match) {
      case "BB":
        uri =
            '$clientApi/aquabasketballmonitorapi-dev/competitions/$competitionId/matches/upcoming';
        subKey = basketballSubscriptionKeyUs;
        break;
      case "FB":
        uri =
            '$clientApi/aquafootballmonitorapi-dev/competitions/$competitionId/matches/upcoming';
        subKey = footballSubscriptionKeyUs;
        break;
      case "CR":
        uri =
            '$clientApi/aquacricketmonitorapi-dev/competitions/$competitionId/matches/upcoming';
        subKey = cricketSubscriptionKeyUs;
        break;
      case 'AF':
        uri =
            '$clientApi/aquaamericanfootballmonitorapi-dev/competitions/$competitionId/matches/upcoming';
        subKey = americanFootballSubscriptionKeyUs;
        break;
      case 'BL':
        uri =
            '$clientApi/aquabaseballmonitorapi-dev/competitions/$competitionId/matches/upcoming';
        subKey = baseballSubscriptionKeyUs;
        break;
      case 'HK':
        uri =
            '$clientApi/aquahockeymonitorapi-dev/competitions/$competitionId/matches/upcoming';
        subKey = iceHockeySubscriptionKeyUs;
        break;
      default:
        throw Exception('abc');
    }

    try {
      final response = await dio.get(uri,
          options: Options(headers: {
            // 'Authorization': token,
            'X-Cid': 'aliv',
            'Ocp-Apim-Subscription-Key': subKey,
          }));

      if (response.statusCode == 200) {
        List<Matches> matchesName = (response.data as List)
            .map((json) => Matches.fromJson(json))
            .toList();
        return matchesName;
      } else {
        return [];
      }
    } on DioException catch (dioError) {
      if (dioError.response != null) {
      } else {
        return [];
      }
      return [];
    } catch (error) {
      return [];
    }
  }

  static Future<Map<String, dynamic>> createPrivateContestData(
      String sportsCode,
      String authToken,
      Map<String, dynamic> postData) async {
    log(sportsCode);
    String url;
    String subKey;
    log(sportsCode);
    log('try');
    switch (sportsCode) {
      case "BB":
        url = '$baseURL/tournaments/private';
        subKey = basketballSubscriptionKeyUs;
        break;
      case "FB":
        url = '$baseURL/tournaments/private';
        subKey = footballSubscriptionKeyUs;
        break;
      case "CR":
        url = '$baseURL/tournaments/private';
        subKey = cricketSubscriptionKeyUs;
        break;
      case 'AF':
        url = '$baseURL/tournaments/private';
        subKey = americanFootballSubscriptionKeyUs;
        break;
      case 'BL':
        url = '$baseURL/tournaments/private';
        subKey = baseballSubscriptionKeyUs;
        break;
      case 'HK':
        url = '$baseURL/tournaments/private';
        subKey = iceHockeySubscriptionKeyUs;
        break;
      default:
        return {};
    }
    try {
      log('test');
      final response = await dio.post(
        url,
        options: Options(
          headers: {
            'Ocp-Apim-Subscription-Key': subKey,
            'x-cid': 'aliv',
            'Authorization': 'Bearer $authToken',
          },
        ),
        data: postData,
      );
      if (response.statusCode == 200) {
        log(response.data.toString());
        return response.data;
      } else {
        return {};
      }
    } catch (e) {
      return {};
    }
  }

  static Future<bool> inviteCoontacts(
      String token, List contactIds, String tournamentId) async {
    log(contactIds.toString());
    log(tournamentId.toString());
    log(token.toString());
    try {
      final response = await dio.post(
        '$baseURL/invitations/$tournamentId',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'X-Cid': 'aliv',
          },
        ),
        data: jsonEncode(contactIds),
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      log(e.toString());
      return false;
    }
  }

  static Future<bool> inviteGroups(
      String token, String groupId, String tournamentId) async {
    log(tournamentId.toString());
    log(token.toString());
    try {
      final response = await dio.post(
        '$baseURL/invitations/$tournamentId/groups/$groupId',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'X-Cid': 'aliv',
          },
        ),
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      log(e.toString());
      return false;
    }
  }

  static Future<bool> invite(
      String token, Map<String, dynamic> data, String tournamentId) async {
    try {
      final response = await dio.post('$baseURL/invitations/$tournamentId',
          options: Options(
            headers: {
              'Authorization': 'Bearer $token',
              'X-Cid': 'aliv',
            },
          ),
          data: data);

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      log(e.toString());
      return false;
    }
  }
}
