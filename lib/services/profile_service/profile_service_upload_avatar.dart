import 'dart:developer';

import 'package:fmlfantasy/core/config/global_instances.dart';
import 'package:dio/dio.dart';

class ProfileServiceUploadAvatar {
  static Future<bool> uploadAvatarFile({
    required String imageUrl,
    required String token,
  }) async {
    try {
      FormData formData = FormData.fromMap({
        'AvatarUrl': imageUrl,
      });
      final response = await dio.put(
        'https://smartabgapimanagement.azure-api.net/smartuserprofileapi-uat/profile/update/avatar',
        data: formData,
        options: Options(
          headers: {
            "Content-Type": "multipart/form-data",
            "Authorization": "Bearer $token",
            "X-Cid": "aliv",
            "Ocp-Apim-Subscription-Key": "8a6c156920a54a03b165a50358622df9",
          },
        ),
      );

      if (response.statusCode == 200) {
        log('Services Avatar uploaded successfully');
        return true;
      } else {
        log('Services Failed to upload avatar. Status code: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      log('Catch Service Error uploading avatar: $e');
      return false;
    }
  }
}
