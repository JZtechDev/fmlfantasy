import 'package:fmlfantasy/app/app_colors/app_colors.dart';
import 'package:fmlfantasy/app/app_sizings.dart';
import 'package:fmlfantasy/ui/helpers/commons.dart';
import 'package:fmlfantasy/ui/views/select_players/controller/select_player_controller.dart';
import 'package:fmlfantasy/ui/views/select_players/widgets/selected_players.dart';
import 'package:fmlfantasy/ui/widgets/button_with_arrow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BottomButtonSelectPlayer extends GetView<SelectPlayerController> {
  const BottomButtonSelectPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SelectPlayerController());
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        color: AppColors.backgroud,
        child: SizedBox(
          height: AppSizing.isMobile(context) ? 100.h : 100.h,
          width: Get.width,
          child: Padding(
            padding: EdgeInsets.only(left: 5.w, right: 5.w, top: 10.h),
            child: Column(
              children: [
                const SelectedPlayer(),
                verticalSpace(5.h),
                ButtonWithArrow(
                  isEnabled: true,
                  buttonText: 'CONTINUE'.tr,
                  onPressed: () {
                    controller.navigateToNextPage();
                  },
                  iconPath: controller.getIconPath(controller.sportName),
                  iconColor: AppColors.white,
                  iconHeight: 15.w,
                  iconWidth: 15.w,
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
