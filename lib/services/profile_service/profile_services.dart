import 'dart:developer';

import 'package:fmlfantasy/core/config/global_instances.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/model/account_details_model.dart';
import 'package:fmlfantasy/model/transaction_model.dart';
import 'package:dio/dio.dart';

class ProfileServices {
  Future<AccountDetailsModel> getProfile(String token) async {
    try {
      final response = await dio.get(
        '$clientApi/smartuserprofileapi-dev/profile',
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
            "X-Cid": "aliv",
            "Ocp-Apim-Subscription-Key": subscriptionkey,
          },
        ),
      );

      if (response.statusCode == 200) {
        return AccountDetailsModel.fromJson(response.data);
      } else {
        log('Failed to fetch profile. Status code: ${response.statusCode}');
        throw Exception('Failed to fetch profile');
      }
    } on DioException catch (e) {
      log('DioError: ${e.message}');
      throw Exception('Failed to fetch profile');
    } catch (e) {
      log('Error: $e');
      throw Exception('Failed to fetch profile');
    }
  }

  Future<bool> updateProfile(
      String token, Map<String, dynamic> updatedData) async {
    try {
      final response = await dio.put(
        '$clientApi/smartuserprofileapi-dev/profile/update',
        data: updatedData,
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
            "X-Cid": "aliv",
            "Ocp-Apim-Subscription-Key": subscriptionkey,
          },
        ),
      );
      if (response.statusCode == 200) {
        log('Profile updated successfully');
        return true;
      } else {
        log('Failed to update profile. Status code: ${response.statusCode}, Response: ${response.data}');
        throw Exception('Failed to update profile');
      }
    } on DioException catch (e) {
      log('DioError updating profile: ${e.message}');

      if (e.response != null) {
        log('Response data: ${e.response?.data}');
        Get.snackbar('Error', '${e.response?.data['message']}');
        log('Response headers: ${e.response?.headers}');
        switch (e.response?.statusCode) {
          case 400:
            log('Bad Request: ${e.response?.data}');
            break;
          case 401:
            log('Unauthorized: ${e.response?.data}');

            break;
          case 403:
            log('Forbidden: ${e.response?.data}');
            break;
          case 404:
            log('Not Found: ${e.response?.data}');
            break;
          default:
            log('Unexpected error: ${e.response?.data}');
        }
      }
      return false;
    } catch (e) {
      log('General error updating profile: $e');
      return false;
    }
  }

  Future<List<TransactionModel>> fetchTransaction(String token) async {
    try {
      final response = await dio.get(
        '$baseURL/transactions',
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
            "X-Cid": "aliv",
            "Ocp-Apim-Subscription-Key": subscriptionkey,
          },
        ),
      );

      if (response.statusCode == 200) {
        // Since the response is a list of transactions, we need to parse it as a list
        List<dynamic> responseData = response.data;
        return responseData
            .map((transaction) => TransactionModel.fromJson(transaction))
            .toList(); // Map the list of JSON to a list of TransactionModel
      } else {
        // print( 'Failed to fetch transactions. Status code: ${response.statusCode}');
        throw Exception('Failed to fetch transactions');
      }
    } catch (e) {
      // print('Error: $e');
      return [];
    }
  }

  Future<List<dynamic>> fetchTransactionGraphData(String token) async {
    try {
      final response = await dio.get(
        '$baseURL/transactions/pnl',
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
            "X-Cid": "aliv",
            "Ocp-Apim-Subscription-Key": subscriptionkey,
          },
        ),
      );
      if (response.statusCode == 200) {
        // print(response.data);
        return response.data;
      } else {
        //print('Failed to fetch transactions. Status code: ${response.statusCode}');
        throw Exception('Failed to fetch transactions');
      }
    } catch (e) {
      throw Exception('Failed to fetch transactions');
    }
  }

  static Future<List<dynamic>> fetchAvatars(String token) async {
    try {
      final response = await dio.get(
        '$clientApi/smartuserprofileapi-uat/avatars',
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
            "X-Cid": "aliv",
            "Ocp-Apim-Subscription-Key": subscriptionkey,
          },
        ),
      );
      if (response.statusCode == 200) {
        // print(response.data);
        return response.data;
      } else {
        // print('TEsting');
        //print( 'Failed to fetch transactions. Status code: ${response.statusCode}');
        throw Exception('Failed to fetch transactions');
      }
    } catch (e) {
      throw Exception('Failed to fetch transactions');
    }
  }
}
