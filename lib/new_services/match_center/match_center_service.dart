import 'package:dio/dio.dart';
import 'package:fmlfantasy/core/config/global_instances.dart';
import 'package:fmlfantasy/new_model/match_center_inner_new.dart';
import 'package:fmlfantasy/new_model/match_center_matches_new.dart';

class MatchCenterServiceNew {
  final token = getStringValuesSF();
  Future<List<MatchCenterMatches>> fetchMatchCenterMatches() async {
    try {
      final response = await dio.get(
          'http://40.113.171.107:50086/matchcenter/recent-fixtures/${selectedSPort.value}/15',
          options: Options(
            headers: {
              'Authorization': 'Bearer $authToken',
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
          //  queryParameters: {'matchKey': matchKey},
          'http://40.113.171.107:50086/matchcenter/matchcentermatch-details/$matchKey',
          options: Options(
            headers: {
              'Authorization': 'Bearer $authToken',
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
