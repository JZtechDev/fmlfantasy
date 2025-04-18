import 'package:fmlfantasy/app/app_colors/app_colors.dart';
import 'package:fmlfantasy/app/app_images/app_images.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/ui/helpers/commons.dart';
import 'package:fmlfantasy/ui/views/team_name/controller/team_name_controller.dart';
import 'package:fmlfantasy/ui/widgets/app_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class TeamNameForm extends GetView<TeamNameController> {
  const TeamNameForm({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TeamNameController());
    return LayoutBuilder(builder: (context, constraints) {
      double maxWidth = constraints.maxWidth;
      return Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  AppImages.teamName,
                  height: maxWidth > 600 ? 63.h : 65.h,
                  width: maxWidth > 600 ? 66.w : 68.w,
                ),
                verticalSpace(10),
                Text(
                  "makeItOfficial".tr,
                  style: globalTextStyle(
                      fontSize: maxWidth > 600 ? 16.sp : 30.sp,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 2),
                Text(
                  "namefantasy".tr,
                  style: globalTextStyle2(
                      color: AppColors.textGray,
                      fontSize: maxWidth > 600 ? 10.sp : 14.sp,
                      fontWeight: FontWeight.w600),
                ),
                verticalSpace(15.h),
                Form(
                  key: controller.formKey,
                  child: Padding(
                    padding: EdgeInsets.only(left: 15.w, right: 15.w),
                    child: AppTextField(
                      labelText: 'Team Name'.tr,
                      controller: controller.teamName,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter Team Name';
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    });
  }
}
