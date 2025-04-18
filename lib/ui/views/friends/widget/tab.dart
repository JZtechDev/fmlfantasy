import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/ui/helpers/commons.dart';
import 'package:fmlfantasy/ui/views/friends/controller/friends_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../app/app_colors/app_colors.dart';

class FriendsTab extends GetView<FriendsController> {
  const FriendsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 5.w, right: 5.w, top: 5, bottom: 5),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(5.r),
      ),
      child: GetBuilder<FriendsController>(
        builder: (friends) => Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: AppColors.grey,
            borderRadius: BorderRadius.circular(2.5.r),
          ),
          child: Row(children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  friends.isContactSet = true;
                },
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(
                      left: 10.w, right: 10.w, top: 5, bottom: 5),
                  decoration: BoxDecoration(
                    color: friends.isContact ? AppColors.white : AppColors.grey,
                    borderRadius: BorderRadius.circular(2.5.r),
                  ),
                  child: Text(
                    'Contacts'.tr,
                    style: globalTextStyle2(fontSize: 12.sp),
                  ),
                ),
              ),
            ),
            horizontalSpace(10.w),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  friends.isContactSet = false;
                },
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(
                      left: 10.w, right: 10.w, top: 5, bottom: 5),
                  decoration: BoxDecoration(
                    color: friends.isContact ? AppColors.grey : AppColors.white,
                    borderRadius: BorderRadius.circular(2.5.r),
                  ),
                  child: Text(
                    'Groups'.tr,
                    style: globalTextStyle2(fontSize: 12.sp),
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
