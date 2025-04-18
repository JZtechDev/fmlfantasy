import 'dart:developer';
import 'package:fmlfantasy/core/config/global_instances.dart';
import 'package:fmlfantasy/model/my_draws_model.dart';
import 'package:dio/dio.dart';

class MyDrawsServices {
  static Future<List<DrawTeamsModel>> fetchMyDraws(
      String token, String sportsId) async {
    try {
      final response = await dio.get(
        '$dailyMatchPickUrl/api/usermatchdrawentries/userdrawmatchinfos/$sportsId/1/10',
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
            "X-Cid": "aliv",
            "Ocp-Apim-Subscription-Key": dailyMatchPickKey,
          },
        ),
      );

      if (response.statusCode == 200) {
        if (response.data is List) {
          List<dynamic> responseData = response.data;
          return responseData
              .map((team) => DrawTeamsModel.fromJson(team))
              .toList();
        } else {
          throw Exception('Unexpected response format');
        }
      } else {
        throw Exception(
            'Failed to fetch data. Status code: ${response.statusCode}');
      }
    } on DioException catch (dioError) {
      if (dioError.response != null) {
        log('Dio error with response: ${dioError.response?.data}');
        throw Exception(
            'Server Error: ${dioError.response?.statusCode} - ${dioError.response?.statusMessage}');
      } else {
        throw Exception('Unexpected error: ${dioError.message}');
      }
    } catch (e) {
      log('Error: $e');
      return [];
    }
  }

  static Future<List<MyDrawsModels>> fetchMyDrawsDetails(
      String token, String drawId) async {
    try {
      final response = await dio.get(
        '$dailyMatchPickUrl/api/usermatchdrawentries/userdraws/$drawId',
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
            "X-Cid": "aliv",
            "Ocp-Apim-Subscription-Key": dailyMatchPickKey,
          },
        ),
      );
      if (response.statusCode == 200) {
        if (response.data is List) {
          List<dynamic> responseData = response.data;
          return responseData
              .map((team) => MyDrawsModels.fromJson(team))
              .toList();
        } else {
          throw Exception('Unexpected response format');
        }
      } else {
        throw Exception(
            'Failed to fetch data. Status code: ${response.statusCode}');
      }
    } on DioException catch (dioError) {
      if (dioError.response != null) {
        log('Dio error with response: ${dioError.response?.data}');
        throw Exception(
            'Server Error: ${dioError.response?.statusCode} - ${dioError.response?.statusMessage}');
      } else {
        throw Exception('Unexpected error: ${dioError.message}');
      }
    } catch (e) {
      log('Error: $e');
      return [];
    }
  }
}
