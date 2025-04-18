import 'package:fmlfantasy/app/app_colors/app_colors.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/ui/helpers/commons.dart';
import 'package:fmlfantasy/ui/helpers/picture_shimmer.dart';
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
      children: [
        Obx(
          () {
            if (controller.accountDetailsList.isEmpty) {
              return Padding(
                padding: EdgeInsets.only(top: 60.h),
                child: SizedBox(height: 80.h, child: const AvatarShimmer()),
              );
            }
            final data = controller.accountDetailsList.first;
            return Column(
              children: [
                verticalSpace(60.h),
                Obx(
                  () => CircleAvatar(
                      radius: 40.r,
                      backgroundColor: AppColors.white,
                      backgroundImage: NetworkImage(data.imageUrl!.value)),
                ),
                verticalSpace(10.h),
                Text(
                  data.userName ?? '',
                  style: globalTextStyle(
                      fontSize: 16.sp, fontWeight: FontWeight.w600),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.price_change),
                    horizontalSpace(5.w),
                    Text(
                      '235',
                      style: globalTextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textGray),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
