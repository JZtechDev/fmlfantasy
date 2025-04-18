import 'dart:developer';

import 'package:fmlfantasy/core/config/global_instances.dart';
import 'package:fmlfantasy/model/monthly_leader_model.dart';
import 'package:dio/dio.dart';

class MonthylyLeaderboardServices {
  final token = getStringValuesSF();

  Future<List<MonthlyLeaderBoardModel>> fetchMonthlyLeaderBoard(
      String getId) async {
    String subKey;

    switch (getId) {
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
        return [];
    }

    try {
      final response = await dio.get('$baseURL/leaderboard?&sportCode=$getId',
          options: Options(
            headers: {
              'Authorization': '$token',
              'X-Cid': 'aliv',
              'Ocp-Apim-Subscription-Key': subKey,
              'Content-Type': 'application/json',
            },
          ));
      log(response.statusCode.toString());

      if (response.statusCode == 200) {
        try {
          List<MonthlyLeaderBoardModel> leaderboard = (response.data as List)
              .map((json) => MonthlyLeaderBoardModel.fromJson(json))
              .toList();
          return leaderboard;
        } catch (e) {
          log('Data parsing error: $e');
          throw Exception('Failed to parse leaderboard data');
        }
      } else {
        log('Server error: ${response.statusCode} - ${response.data.toString()}');
        throw Exception('Failed to fetch leaderboard: ${response.statusCode}');
      }
    } on DioException catch (dioError) {
      if (dioError.response != null) {
        log('Dio error: ${dioError.response!.statusCode} - ${dioError.response!.data}');
        throw Exception(
            'Dio error: ${dioError.response!.statusCode} - ${dioError.response!.data}');
      } else {
        log('Dio error: ${dioError.message}');
        throw Exception('Dio error: ${dioError.message}');
      }
    } catch (error) {
      log('Unexpected error: $error');
      throw Exception('Unexpected error: $error');
    }
  }
}
