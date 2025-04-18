import 'package:fmlfantasy/app/app_colors/app_colors.dart';
import 'package:fmlfantasy/model/select_player_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class SelectionDots extends StatelessWidget {
  final int totalDots;
  final RxList<Players> selectedIndices;

  const SelectionDots(
      {super.key, required this.totalDots, required this.selectedIndices});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(totalDots, (index) {
          bool isSelected = index < selectedIndices.length;
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 2.0),
            width: 20.w,
            height: 5.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.r),
              color: isSelected
                  ? AppColors.primary
                  : AppColors.grey, // Change color as needed
            ),
          );
        }),
      );
    });
  }
}
