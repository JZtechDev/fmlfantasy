import 'package:fmlfantasy/core/config/global_instances.dart';
import 'package:fmlfantasy/model/tournament_model.dart';
import 'package:dio/dio.dart';

class MyContestServices {
  static Future<List<Tournaments>> myContestTournaments(
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
        '$baseURL/tournaments/my?sportCode=$sportsCode&includePastTournaments=true&seeOnlyPrivateTournaments=true&seeOnlyPublicTournaments=false',
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
        return privateTournaments; // Return tournaments instead of response.data
      } else {
        throw ' ${response.statusMessage.toString()}';
      }
    } on DioException catch (dioError) {
      if (dioError.response != null) {
        // Server errors
        throw Exception(
            ' ${dioError.response?.statusCode} ${dioError.response?.statusMessage}');
      } else {
        // Network errors or other Dio errors
        throw Exception('${dioError.message}');
      }
    } catch (error) {
      // Other types of errors (e.g., parsing errors)
      throw Exception(' $error');
    }
  }
}
