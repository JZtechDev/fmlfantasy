import 'package:fmlfantasy/app/app_colors/app_colors.dart';
import 'package:fmlfantasy/ui/helpers/commons.dart';
import 'package:fmlfantasy/ui/views/bull_player/controller/bull_player_controller.dart';
import 'package:fmlfantasy/ui/views/bull_player/widget/team_preview_screen.dart';
import 'package:fmlfantasy/ui/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BotttomButtonBullPlayer extends GetView<BullPlayerController> {
  const BotttomButtonBullPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(BullPlayerController());
    return LayoutBuilder(builder: (context, constraints) {
      double buttonHeight = constraints.maxWidth > 600 ? 10.h : 15.h;
      return Container(
        decoration: const BoxDecoration(
          color: AppColors.white,
          border: Border(
            top: BorderSide(
              color: AppColors.borderColor,
              width: 1,
            ),
          ),
        ),
        child: SizedBox(
          height: 65.h,
          width: Get.width,
          child: Padding(
            padding:
                EdgeInsets.only(left: 15.w, right: 15.w, top: buttonHeight),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: PrimaryButton(
                        padding: 0,
                        buttonText: 'continue'.tr,
                        isEnabled: true,
                        onPressed: () {
                          controller.navigate();
                        },
                        iconColor: AppColors.white,
                        iconPath: controller.getIconPath(controller.sportName),
                      ),
                    ),
                    horizontalSpace(5.w),
                    Expanded(
                      child: PrimaryButton(
                        padding: 0,
                        buttonText: 'preview'.tr,
                        isEnabled: true,
                        onPressed: () {
                          Get.to(() => const TeamPreviewScreen());
                        },
                        iconColor: AppColors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
