import 'package:dio/dio.dart';
import 'package:fmlfantasy/core/config/global_instances.dart';
import 'package:fmlfantasy/new_model/match_center_inner_new.dart';
import 'package:fmlfantasy/new_model/match_center_matches_new.dart';

class MatchCenterServiceNew {
  final token = getStringValuesSF();
  Future<List<MatchCenterMatches>> fetchMatchCenterMatches() async {
    try {
      final response = await dio.get(
          'https://smartabgapimanagement.azure-api.net/smartabgcricketrestapi-dev/matches/recent-fixtures',
          options: Options(
            headers: {
              'Authorization': 'Bearer $token',
              'x-cid': 'aliv',
              'Ocp-Apim-Subscription-Key': cricketSubscriptionKeyUs,
            },
          ));
      if (response.statusCode == 200) {
        return (response.data as List)
            .map((json) => MatchCenterMatches.fromJson(json))
            .toList();
      } else {
        return [];
      }
    } catch (error) {
      rethrow;
    }
  }

  Future fetchMatchCenterData(String matchKey) async {
    try {
      final response = await dio.get(
          queryParameters: {'matchKey': matchKey},
          'https://smartabgapimanagement.azure-api.net/smartabgcricketrestapi-dev/matches/matchcentermatch-details',
          options: Options(
            headers: {
              'Authorization': 'Bearer $token',
              'x-cid': 'aliv',
              'Ocp-Apim-Subscription-Key': cricketSubscriptionKeyUs,
            },
          ));
      if (response.statusCode == 200) {
        return MatchCenterInnerNew.fromJson(response.data);
      }
    } catch (error) {
      rethrow;
    }
  }
}
