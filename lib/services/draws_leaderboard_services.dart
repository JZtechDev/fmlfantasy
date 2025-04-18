import 'dart:developer';
import 'package:fmlfantasy/core/config/global_instances.dart';
import 'package:fmlfantasy/model/lotto_leaderboard_models.dart';
import 'package:dio/dio.dart';

class DrawsLeaderboardServices {
  static Future<LotoInnerLeaderboardModel?> fetchDrawsLeaderboard(
      String token, String matchKey, String sportsId) async {
    log(matchKey);
    log(sportsId);
    try {
      final response = await dio.get(
        '$dailyMatchPickUrl/api/drawmatchleaderboards/$sportsId/$matchKey',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'X-Cid': 'aliv',
          },
        ),
      );
      log(response.data.toString());

      if (response.data is Map<String, dynamic>) {
        final data = response.data;
        LotoInnerLeaderboardModel drawsLeaderboard =
            LotoInnerLeaderboardModel.fromJson(data);

        return drawsLeaderboard;
      } else {
        log("Unexpected response format: ${response.data}");
        return null;
      }
    } catch (error) {
      log(error.toString());
      return null;
    }
  }

  static Future<List<LotoLeaderboardMatches>> fetchLotoLeaderboardMatches(
      String token, String sportsId) async {
    try {
      final response = await dio.get(
        '$dailyMatchPickUrl/api/drawmatchleaderboards/matches/$sportsId/1/10',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'X-Cid': 'aliv',
          },
        ),
      );
      List<LotoLeaderboardMatches> lotoLeaderboard = (response.data as List)
          .map((json) => LotoLeaderboardMatches.fromJson(json))
          .toList();
      return lotoLeaderboard;
    } catch (error) {
      log(error.toString());
      return [];
    }
  }
}
