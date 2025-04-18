import 'package:fmlfantasy/app/app_colors/app_colors.dart';
import 'package:fmlfantasy/ui/components/inner_appbar.dart';
import 'package:fmlfantasy/ui/helpers/commons.dart';
import 'package:fmlfantasy/ui/views/profile/controller/profile_controller.dart';
import 'package:fmlfantasy/ui/views/profile/widgets/profile_image.dart';
import 'package:fmlfantasy/ui/views/profile/widgets/profile_tiles.dart';
import 'package:fmlfantasy/ui/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProfileController());
    return Scaffold(
        appBar: const AppBarInner(
          title: 'Profile',
        ),
        backgroundColor: AppColors.grey,
        body: Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Column(
            children: [
              const ProfileImage(),
              verticalSpace(10.h),
              const ProfileTiles(),
              const Spacer(),
              PrimaryButton(
                  buttonText: 'Logout'.tr,
                  onPressed: () => controller.logout(),
                  isEnabled: true),
            ],
          ),
        ));
  }
}
