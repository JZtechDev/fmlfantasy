import 'dart:developer';

import 'package:fmlfantasy/core/config/global_instances.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class CreateLottoServices {
  static Future<Map<String, dynamic>> createLotto(
      Map<String, dynamic> data, String token) async {
    try {
      final response = await dio.post(
        '$dailyMatchPickUrl/api/usermatchdrawentries',
        data: data,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'X-Cid': 'aliv',
            'Authorization': 'Bearer $token',
            'Ocp-Apim-Subscription-Key': dailyMatchPickKey,
          },
        ),
      );
      return response.data;
    } on DioException catch (dioError) {
      // Handle Dio-specific errors
      if (dioError.response != null) {
        Get.snackbar('Error', '${dioError.response?.data}');
        log('Dio error response: ${dioError.response?.data}');
        return {
          'error':
              'Error: ${dioError.response?.statusCode}, ${dioError.response?.data}'
        };
      } else {
        Get.snackbar('Error', '${dioError.message}');
        log('Dio error message: ${dioError.message}');
        return {'error': 'Connection error: ${dioError.message}'};
      }
    } catch (e) {
      // Handle other exceptions
      log('General error: $e');
      return {'error': 'An unexpected error occurred.'};
    }
  }

  static Future<List> getSports(String token) async {
    try {
      final response = await dio.get(
        '$dailyMatchPickUrl/api/selectoptions/sports',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Ocp-Apim-Subscription-Key': dailyMatchPickKey,
            'X-Cid': 'aliv',
            'Content-Type': 'application/json',
          },
        ),
      );
      return response.data;
    } catch (e) {
      log(e.toString());
    }
    return [];
  }

  static Future<Map<String, dynamic>> getPrizePool(String token,
      String sportsId, String tournamentKey, String matchKey) async {
    try {
      final response = await dio.get(
        '$dailyMatchPickUrl/api/prizepools/$sportsId/$tournamentKey/$matchKey',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Ocp-Apim-Subscription-Key': dailyMatchPickKey,
            'X-Cid': 'aliv',
            'Content-Type': 'application/json',
          },
        ),
      );

      return response.data;
    } catch (e) {
      log(e.toString());
    }
    return {};
  }

  static Future<bool> deleteDraws(
      String id, String token, String matchKey) async {
    try {
      final response = await dio.delete(
        '$dailyMatchPickUrl/api/usermatchdrawentries/$id/$matchKey',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Ocp-Apim-Subscription-Key': dailyMatchPickKey,
            'X-Cid': 'aliv',
            'Content-Type': 'application/json',
          },
        ),
      );
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      throw 'error $e';
    }
  }
}
