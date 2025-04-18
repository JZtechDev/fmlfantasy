import 'dart:math';

import 'package:fmlfantasy/core/config/global_instances.dart'; // Make sure this is correctly configured
import 'package:fmlfantasy/ui/helpers/snackbar.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationServices {
  AuthenticationServices() {
    dio.options.headers['X-Cid'] = 'aliv';
    dio.options.headers['Ocp-Apim-Subscription-Key'] =
        '8a6c156920a54a03b165a50358622df9';
  }

  Future<bool> signIn(String email, String password) async {
    try {
      final response = await dio.post(
        'https://smartabgapimanagement.azure-api.net/smartauthenticationapi-uat/token',
        data: {
          'username': email,
          'password': password,
        },
      );
      if (response.statusCode == 200) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('token', response.data['accessToken']);
        //String token = prefs.getString('token') ?? '';
        getKycId(response.data['accessToken']);
        return true;
      } else {
        // Handle incorrect status codes
        //Get.snackbar('Error', 'Incorrect Email or Password');
        Snackbars.error('Incorrect Email or Password');
        return false;
      }
    } on DioException catch (e) {
      // Handle DioErrors (network issues, server responses other than 200)
      if (e.response != null) {
        // When the server responded with an error
        Snackbars.error(
            e.response!.data['message'] ?? 'Unknown error occurred');
      } else {
        // When there is no response (network issues, timeouts, etc.)
        Get.snackbar('Error', 'Check Your Internet Connection');
      }
      return false;
    } catch (e) {
      // Handle any other errors that might occur
      Get.snackbar('Error', 'Server Error');
      return false;
    }
  }

  Future<bool> signUp(Map<String, dynamic> postData) async {
    String basePath =
        "https://smartabgapimanagement.azure-api.net/smartonboadingapi-uat";
    try {
      final response = await Dio().post(
        '$basePath/signup/live',
        data: postData,
        options: Options(
          headers: {
            "X-Cid": "aliv",
            "Content-Type": "application/json",
            'Ocp-Apim-Subscription-Key': '8a6c156920a54a03b165a50358622df9',
          },
        ),
      );

      if (response.statusCode == 200) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', response.data['accessToken']);
        await prefs.setString('kycSid', response.data['kycSid']);
        return true;
      } else {
        Get.snackbar(
            'Error', 'Sign-up failed with status: ${response.statusCode}');
        return false;
      }
    } on DioException catch (dioError) {
      if (dioError.response != null) {
        Get.snackbar('Error',
            dioError.response!.data['message'] ?? 'Unknown error occurred');
      } else {
        Get.snackbar('Error', 'Check Your Internet Connection');
      }
      return false;
    } catch (e) {
      Get.snackbar('Error', 'Server Error: $e');
      return false;
    } finally {}
  }

  Future<bool> emailCheck(String email, String otp) async {
    String basePath =
        "https://smartabgapimanagement.azure-api.net/smartonboadingapi-uat";
    var endpoint = "$basePath/code/email/verify";
    try {
      final response = await dio.post(endpoint,
          data: {
            "code": otp,
            "email": email,
          },
          options: Options(
            headers: {
              "x-g-recaptcha": "FHFRnWthOh1OnEwpTeRg",
              'subscription-key': '8a6c156920a54a03b165a50358622df9',
            },
          ));
      response.data;
      if (response.statusCode == 200) {
        if (response.data['isValid'] == true) {
          return true;
        } else {
          Get.snackbar('Error', 'Invalid OTP');
          return false;
        }
      } else {
        log(response.data.toString() as num);
        // Handle other status codes or errors accordingly
        return false;
      }
    } catch (e) {
      log(e.toString() as num);
      // Handle exceptions
      return false;
    }
  }

  Future<bool> sendEmailOTP(String email) async {
    String basePath =
        "https://smartabgapimanagement.azure-api.net/smartonboadingapi-uat";
    var endpoint = "$basePath/code/email/send";
    try {
      final response = await dio.post(
        endpoint,
        data: {"email": email},
        options: Options(
          headers: {
            'x-cid': 'aliv',
            'Ocp-Apim-Subscription-Key': '8a6c156920a54a03b165a50358622df9',
          },
        ),
      );
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } on DioException catch (dioError) {
      if (dioError.response != null) {
        Get.snackbar('Error',
            dioError.response!.data['message'] ?? 'Unknown error occurred');
      } else {
        Get.snackbar('Error', 'Check Your Internet Connection');
      }
      return false;
    } catch (e) {
      Get.snackbar('Error', 'Server Error');
      return false;
    }
  }

  Future<bool> forgetPasswordSendEmail(String email) async {
    String basePath =
        "https://smartabgapimanagement.azure-api.net/smartauthenticationapi-uat";
    var endpoint = "$basePath/forgot-password";
    try {
      final response = await dio.post(
        endpoint,
        data: {"UserName": email},
        options: Options(
          headers: {
            'x-cid': 'aliv',
            'Ocp-Apim-Subscription-Key': '8a6c156920a54a03b165a50358622df9',
          },
        ),
      );
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } on DioException catch (dioError) {
      if (dioError.response != null) {
        Get.snackbar('Error',
            dioError.response!.data['message'] ?? 'Unknown error occurred');
      } else {
        Get.snackbar('Error', 'Check Your Internet Connection');
      }
      return false;
    } catch (e) {
      Get.snackbar('Error', e.toString());
      return false;
    }
  }

  Future<bool> confirmPasswod(
    String otp,
    String password,
    String confirmPassword,
    String email,
  ) async {
    String basePath =
        "https://smartabgapimanagement.azure-api.net/smartauthenticationapi-uat";
    var endpoint = "$basePath/forgot-password/confirm";
    try {
      final response = await dio.post(
        endpoint,
        data: {
          "Token": otp,
          "password": password,
          "confirmPassword": confirmPassword,
          "UserId": email,
        },
        options: Options(
          headers: {
            'x-cid': 'aliv',
            'Ocp-Apim-Subscription-Key': '8a6c156920a54a03b165a50358622df9',
          },
        ),
      );
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } on DioException catch (dioError) {
      if (dioError.response != null) {
        Get.snackbar('Error',
            dioError.response!.data['message'] ?? 'Unknown error occurred');
      } else {
        Get.snackbar('Error', 'Check Your Internet Connection');
      }
      return false;
    } catch (e) {
      Get.snackbar('Error', e.toString());
      return false;
    }
  }

  Future<bool> signInWithGooglePostData(
    var token,
    String google,
    var id,
  ) async {
    String basePath =
        "https://smartabgapimanagement.azure-api.net/smartauthenticationapi-uat";
    var endpoint = "$basePath/external";
    try {
      final response = await dio.post(
        endpoint,
        data: {"token": token, "type": google, "Id": id},
        options: Options(
          headers: {
            'x-cid': 'aliv',
            'Ocp-Apim-Subscription-Key': '8a6c156920a54a03b165a50358622df9',
          },
        ),
      );
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } on DioException catch (dioError) {
      if (dioError.response != null) {
        //   Get.snackbar('Error',
        //       dioError.response!.data['message'] ?? 'Unknown error occurred');
        // } else {
        // Get.snackbar('Error', 'Check Your Internet Connection');
      }
      return false;
    } catch (e) {
      //Get.snackbar('Error', e.toString());
      return false;
    }
  }

  Future<bool> getKycId(String token) async {
    String basePath =
        "https://smartabgapimanagement.azure-api.net/smartuserprofileapi-uat";
    var endpoint = "$basePath/kyc";
    try {
      final response = await dio.get(
        endpoint,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'x-cid': 'aliv',
            'Ocp-Apim-Subscription-Key': subscriptionkey,
          },
        ),
      );
      if (response.statusCode == 200) {
        SharedPreferences prefs = await SharedPreferences.getInstance();

        prefs.setString('kycSid', response.data['kycSid']);
        return true;
      } else {
        return false;
      }
    } on DioException catch (dioError) {
      if (dioError.response != null) {
        return false;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
