import 'dart:developer';

import 'package:fmlfantasy/core/config/global_instances.dart';
import 'package:fmlfantasy/model/contacts_model.dart';
import 'package:dio/dio.dart';

class FriendsServices {
  static Future<bool> addFriend(
      Map<String, dynamic> contactData, String token) async {
    try {
      final response = await dio.post(
        '$baseURL/contactsbook/contacts',
        data: [contactData],
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'X-Cid': 'aliv',
          },
        ),
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        log('Error: Unexpected status code ${response.statusCode}');
        log('Response data: ${response.data}');
        return false;
      }
    } on DioException catch (dioError) {
      if (dioError.response != null) {
        log('DioError: ${dioError.response?.statusCode}');
        log('DioError response data: ${dioError.response?.data}');
      } else {
        log('DioError: ${dioError.message}');
      }
      return false;
    } catch (e) {
      log('Error: $e');
      return false;
    }
  }

  static Future<bool> createGroup(
      Map<String, dynamic> groupData, String token) async {
    try {
      final response = await dio.post(
        '$baseURL/contactsbook/usergroups',
        data: groupData,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'X-Cid': 'aliv',
            'Ocp-Apim-Subscription-Key': subscriptionkey,
          },
        ),
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        log('Error: Unexpected status code ${response.statusCode}');
        log('Response data: ${response.data}');
        return false;
      }
    } on DioException catch (dioError) {
      if (dioError.response != null) {
        log('DioError: ${dioError.response?.statusCode}');
        log('DioError response data: ${dioError.response?.data}');
      } else {
        log('DioError: ${dioError.message}');
      }
      return false;
    } catch (e) {
      log('Error: $e');
      return false;
    }
  }

  static Future<List<GetContacts>> getContacts(String token) async {
    try {
      final response = await dio.get(
        '$baseURL/contactsbook/contacts/my',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'X-Cid': 'aliv',
            'Ocp-Apim-Subscription-Key': subscriptionkey,
          },
        ),
      );
      List<GetContacts> contacts = (response.data as List)
          .map((json) => GetContacts.fromJson(json))
          .toList();

      if (response.statusCode == 200) {
        return contacts;
      } else {
        log('Error: Unexpected status code ${response.statusCode}');
        log('Response data: ${response.data}');
        return [];
      }
    } on DioException catch (dioError) {
      if (dioError.response != null) {
        log('DioError: ${dioError.response?.statusCode}');
        log('DioError response data: ${dioError.response?.data}');
      } else {
        log('DioError: ${dioError.message}');
      }
      return [];
    } catch (e) {
      log('Error: $e');
      return [];
    }
  }

  static Future<List<GetGroups>> getGroups(String token) async {
    try {
      final response = await dio.get(
        '$baseURL/contactsbook/usergroups',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'X-Cid': 'aliv',
            'Ocp-Apim-Subscription-Key': subscriptionkey,
          },
        ),
      );
      List<GetGroups> groups = (response.data as List)
          .map((json) => GetGroups.fromJson(json))
          .toList();

      if (response.statusCode == 200) {
        return groups;
      } else {
        log('Error: Unexpected status code ${response.statusCode}');
        log('Response data: ${response.data}');
        return [];
      }
    } on DioException catch (dioError) {
      if (dioError.response != null) {
        log('DioError: ${dioError.response?.statusCode}');
        log('DioError response data: ${dioError.response?.data}');
      } else {
        log('DioError: ${dioError.message}');
      }
      return [];
    } catch (e) {
      log('Error: $e');
      return [];
    }
  }

  static Future<List<GetGroupMembers>> getGroupMembers(
      String token, String id) async {
    try {
      final response = await dio.get(
        '$baseURL/contactsbook/usergroups/$id/members',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'X-Cid': 'aliv',
            'Ocp-Apim-Subscription-Key': subscriptionkey,
          },
        ),
      );

      List<GetGroupMembers> members = (response.data as List)
          .map((json) => GetGroupMembers.fromJson(json))
          .toList();

      if (response.statusCode == 200) {
        return members;
      } else {
        log('Error: Unexpected status code ${response.statusCode}');
        log('Response data: ${response.data}');
        return [];
      }
    } on DioException catch (dioError) {
      if (dioError.response != null) {
        log('DioError: ${dioError.response?.statusCode}');
        log('DioError response data: ${dioError.response?.data}');
      } else {
        log('DioError: ${dioError.message}');
      }
    }
    return [];
  }

  static Future<bool> deleteContact(String token, String contactId) async {
    try {
      final response = await dio.delete(
        '$baseURL/contactsbook/contacts/$contactId',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'X-Cid': 'aliv',
            'Ocp-Apim-Subscription-Key': subscriptionkey,
          },
        ),
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        log('Error: Unexpected status code ${response.statusCode}');
        log('Response data: ${response.data}');
        return false;
      }
    } on DioException catch (dioError) {
      if (dioError.response != null) {
        log('DioError: ${dioError.response?.statusCode}');
        log('DioError response data: ${dioError.response?.data}');
      } else {
        log('DioError: ${dioError.message}');
      }
      return false;
    } catch (e) {
      log('Error: $e');
      return false;
    }
  }

  static Future<bool> deleteGroup(String token, String groupId) async {
    try {
      final response = await dio.delete(
        '$baseURL/contactsbook/usergroups/$groupId',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'X-Cid': 'aliv',
            'Ocp-Apim-Subscription-Key': subscriptionkey,
          },
        ),
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        log('Error: Unexpected status code ${response.statusCode}');
        log('Response data: ${response.data}');
        return false;
      }
    } on DioException catch (dioError) {
      if (dioError.response != null) {
        log('DioError: ${dioError.response?.statusCode}');
        log('DioError response data: ${dioError.response?.data}');
      } else {
        log('DioError: ${dioError.message}');
      }
      return false;
    } catch (e) {
      log('Error: $e');
      return false;
    }
  }

  static Future<bool> editGroupName(
      String token, String groupId, String name) async {
    try {
      final response =
          await dio.put('$baseURL/contactsbook/usergroups/$groupId',
              options: Options(
                headers: {
                  'Authorization': 'Bearer $token',
                  'X-Cid': 'aliv',
                  'Ocp-Apim-Subscription-Key': subscriptionkey,
                },
              ),
              data: {'GroupName': name});

      if (response.statusCode == 200) {
        return true;
      } else {
        log('Error: Unexpected status code ${response.statusCode}');
        log('Response data: ${response.data}');
        return false;
      }
    } catch (e) {
      log('Error: $e');
      return false;
    }
  }

  static Future<bool> addGroupMember(
      String groupId, String memberId, String token) async {
    try {
      final response = await dio.post(
        '$baseURL/contactsbook/usergroups/$groupId/members/$memberId',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'X-Cid': 'aliv',
            'Ocp-Apim-Subscription-Key': subscriptionkey,
          },
        ),
      );
      if (response.statusCode == 200) {
        return true;
      } else {
        log('Error: Unexpected status code ${response.statusCode}');
        log('Response data: ${response.data}');
        return false;
      }
    } catch (e) {
      log('Error: $e');
      return false;
    }
  }

  static Future<bool> deleteGroupMember(
      String groupId, String memberId, String token) async {
    try {
      final response = await dio.delete(
        '$baseURL/contactsbook/usergroups/$groupId/members/$memberId',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'X-Cid': 'aliv',
            'Ocp-Apim-Subscription-Key': subscriptionkey,
          },
        ),
      );
      if (response.statusCode == 200) {
        return true;
      } else {
        log('Error: Unexpected status code ${response.statusCode}');
        log('Response data: ${response.data}');
        return false;
      }
    } catch (e) {
      log('Error: $e');
      return false;
    }
  }

  static Future<bool> editContact(
      String token, Map<String, dynamic> contactData) async {
    try {
      final response = await dio.put('$baseURL/contactsbook/contacts',
          options: Options(
            headers: {
              'Authorization': 'Bearer $token',
              'X-Cid': 'aliv',
              'Ocp-Apim-Subscription-Key': subscriptionkey,
            },
          ),
          data: [contactData]);
      if (response.statusCode == 200) {
        return true;
      } else {
        false;
      }
      return false;
    } catch (e) {
      log(3.toString());
      return false;
    }
  }
}
