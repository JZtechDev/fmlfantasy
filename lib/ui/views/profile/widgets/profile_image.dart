import 'package:fmlfantasy/app/app_colors/app_colors.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/ui/helpers/commons.dart';
import 'package:fmlfantasy/ui/views/profile/controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProfileImage extends GetView<ProfileController> {
  const ProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProfileController());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Obx(
          () {
            if (controller.accountDetailsList.isEmpty) {
              return Container(
                height: 100,
              );
            }
            final data = controller.accountDetailsList.first;
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 50.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  data.imageUrl == null || data.imageUrl == ''
                      ? Container()
                      : Obx(
                          () => CircleAvatar(
                              radius: 50.r,
                              backgroundColor: AppColors.white,
                              backgroundImage:
                                  NetworkImage(data.imageUrl!.value)),
                        ),
                  horizontalSpace(30.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('My Account',
                          style: globalTextStyle(
                              fontSize: 18.sp, fontWeight: FontWeight.w700)),
                      Text(
                        data.userName!.capitalizeFirst ?? '',
                        style: globalTextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                            color: AppColors.secondary),
                      ),
                      Text(
                        '\$199',
                        style: globalTextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w700,
                            color: AppColors.white),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
