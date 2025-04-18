import 'dart:developer';

import 'package:fmlfantasy/core/config/global_instances.dart';
import 'package:fmlfantasy/ui/views/player_stats_view/models/players_info_model.dart';
import 'package:dio/dio.dart';

class PlayersServices {
  static Future<PlayersInfoModel> getPlayersData(String assetCode) async {
    try {
      final response = await dio.get(
        '$baseURL/players/$assetCode/info',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'X-Cid': 'aliv',
            'Ocp-Apim-Subscription-Key': subscriptionkey,
          },
        ),
      );

      if (response.statusCode == 200) {
        return PlayersInfoModel.fromJson(response.data);
      } else {
        return PlayersInfoModel();
      }
    } catch (e) {
      log('Error: $e');
      return PlayersInfoModel();
    }
  }

  static Future<List<PlayersRecentStats>> getPlayersDataList(
      String assetCode) async {
    try {
      final response = await dio.get(
        '$baseURL/players/$assetCode/recent-stats',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'X-Cid': 'aliv',
            'Ocp-Apim-Subscription-Key': subscriptionkey,
          },
        ),
      );

      if (response.statusCode == 200) {
        List<PlayersRecentStats> data = (response.data as List)
            .map((json) => PlayersRecentStats.fromJson(json))
            .toList();
        return data;
      } else {
        return [];
      }
    } catch (e) {
      log('Error: $e');
      return [];
    }
  }
}
