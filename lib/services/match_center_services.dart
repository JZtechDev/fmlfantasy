import 'dart:developer';

import 'package:fmlfantasy/core/config/global_instances.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/model/match_center_inner.dart';
import 'package:fmlfantasy/model/match_center_model.dart';
import 'package:dio/dio.dart';

class MatchCenterServices {
  final token = getStringValuesSF();

  Future<List<MatchCenterModel>> fetchMatchCenterData(
      String match, String formattedDate, String formattedPastDate) async {
    String uri;
    String subKey;
    switch (match) {
      case "BB":
        uri = '$clientApi/aquabasketballmonitorapi-dev/matches/ended/recent';
        subKey = basketballSubscriptionKeyUs;
        break;
      case "FB":
        uri =
            '$clientApi/aquafootballmonitorapi-dev/matches/ended/recent?fromDateYYYYMMDD=$formattedPastDate&toDateYYYYMMDD=$formattedDate';
        subKey = footballSubscriptionKeyUs;
        break;
      case "CR":
        uri = '$clientApi/aquacricketmonitorapi-dev/matches/ended/recent';
        subKey = cricketSubscriptionKeyUs;
        break;
      case 'AF':
        uri =
            '$clientApi/aquaamericanfootballmonitorapi-dev/matches/ended/recent';
        subKey = americanFootballSubscriptionKeyUs;
        break;
      case 'BL':
        uri = '$clientApi/aquabaseballmonitorapi-dev/matches/ended/recent';
        subKey = baseballSubscriptionKeyUs;
        break;
      case 'HK':
        uri = '$clientApi/aquahockeymonitorapi-dev/matches/ended/recent';
        subKey = iceHockeySubscriptionKeyUs;
        break;
      default:
        return [];
    }
    try {
      final response = await dio.get(
        uri,
        options: Options(
          headers: {
            'Ocp-Apim-Subscription-Key': subKey,
            'X-Cid': 'aliv',
          },
        ),
      );

      if (response.statusCode == 200) {
        List<MatchCenterModel> leaderboard = (response.data as List)
            .map((json) => MatchCenterModel.fromJson(json))
            .toList();
        return leaderboard;
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
      //print('General error: $error');
      return [];
    }
  }

  Future<List<InnerMatchCenterModel>> fetchMatchCenterInnerData(
      String matchKey, String sports) async {
    String uri;
    String subKey;
    switch (sports) {
      case "BB":
        uri = '$baseURL/matchcenter/basketball/match/$matchKey';
        subKey = baseballSubscriptionKeyUs;
        break;
      case "FB":
        uri = '$baseURL/matchcenter/football/match/$matchKey';
        subKey = footballSubscriptionKeyUs;
        break;
      case "CR":
        uri = '$baseURL/matchcenter/cricket/match/$matchKey';
        subKey = cricketSubscriptionKeyUs;
        break;
      case 'AF':
        uri = '$baseURL/matchcenter/americanfootball/match/$matchKey';
        subKey = americanFootballSubscriptionKeyUs;
        break;
      case 'BL':
        uri = '$baseURL/matchcenter/baseball/match/$matchKey';
        subKey = baseballSubscriptionKeyUs;
        break;
      case 'HK':
        uri = '$baseURL/matchcenter/hockey/match/$matchKey';
        subKey = iceHockeySubscriptionKeyUs;
        break;
      default:
        return [];
    }

    try {
      final response = await Dio().get(
        uri,
        options: Options(
          headers: {
            'Ocp-Apim-Subscription-Key': subKey,
            'X-Cid': 'aliv',
          },
        ),
      );

      log(response.data.toString());

      if (response.statusCode == 200) {
        log(response.data.toString());
        if (response.data is List) {
          List<InnerMatchCenterModel> matchCenterInner = (response.data as List)
              .map((json) => InnerMatchCenterModel.fromJson(json))
              .toList();
          return matchCenterInner;
        } else if (response.data is Map) {
          InnerMatchCenterModel matchCenterInner =
              InnerMatchCenterModel.fromJson(response.data);
          return [matchCenterInner];
        } else {
          log('Unexpected data type: ${response.data.runtimeType}');
          return [];
        }
      } else {
        log('Failed to load data. Status code: ${response.statusCode}');
        return [];
      }
    } on DioException catch (dioError) {
      if (dioError.response != null) {
        // The server responded with a non-2xx status code
        Get.snackbar('Error',
            'Failed to load data: ${dioError.response?.data['Message']}');
      } else {
        Get.snackbar('Error', 'Failed to send request: ${dioError.message}');
      }
      return [];
    } catch (error) {
      Get.snackbar('Error', 'An unexpected error occurred: $error');
      return [];
    }
  }

  Future<List<PastMatches>> pastMatches(String sportsCode) async {
    String uri;
    String subKey;

    switch (sportsCode) {
      case "BB":
        uri =
            '$clientApi/aquabasketballmonitorapi-dev/matches/ended/recent-info';
        subKey = basketballSubscriptionKeyUs;
        break;
      case "FB":
        uri = '$clientApi/aquafootballmonitorapi-dev/matches/ended/recent-info';
        subKey = footballSubscriptionKeyUs;
        break;
      case "CR":
        uri = '$clientApi/aquacricketmonitorapi-dev/matches/ended/recent-info';
        subKey = cricketSubscriptionKeyUs;
        break;
      case 'AF':
        uri =
            '$clientApi/aquaamericanfootballmonitorapi-dev/matches/ended/recent-info';
        subKey = americanFootballSubscriptionKeyUs;
        break;
      case 'BL':
        uri = '$clientApi/aquabaseballmonitorapi-dev/matches/ended/recent-info';
        subKey = baseballSubscriptionKeyUs;
        break;
      case 'HK':
        uri = '$clientApi/aquahockeymonitorapi-dev/matches/ended/recent-info';
        subKey = iceHockeySubscriptionKeyUs;
        break;
      default:
        return [];
    }

    try {
      final response = await dio.get(
        uri,
        options: Options(
          headers: {
            'X-Cid': 'aliv',
            'Ocp-Apim-Subscription-Key': subKey,
          },
        ),
      );
      if (response.statusCode == 200) {
        List<PastMatches> leaderboard = (response.data as List)
            .map((json) => PastMatches.fromJson(json))
            .toList();
        return leaderboard;
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
      //print('General error: $error');
      return [];
    }
  }
}





///matches/ended/recent-info


