import 'package:fmlfantasy/app/app_colors/app_colors.dart';
import 'package:fmlfantasy/ui/views/bull_player/controller/bull_player_controller.dart';
import 'package:fmlfantasy/ui/widgets/button_with_arrow.dart';
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
          color: AppColors.backgroud,
          border: Border(
            top: BorderSide(
              color: AppColors.backgroud,
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
                      child: ButtonWithArrow(
                        padding: 0,
                        buttonText: 'CONTINUE'.tr,
                        isEnabled: true,
                        onPressed: () {
                          controller.navigate();
                        },
                        iconColor: AppColors.white,
                        iconPath: controller.getIconPath(controller.sportName),
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
