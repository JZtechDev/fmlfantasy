import 'package:flutter/cupertino.dart';
import 'package:fmlfantasy/app/app_images/app_images.dart';
import 'package:fmlfantasy/app/app_sizings.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/ui/views/select_players/controller/select_player_controller.dart';
import 'package:flutter_svg/svg.dart';

class FilterButton extends GetView<SelectPlayerController> {
  const FilterButton({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SelectPlayerController());
    return LayoutBuilder(builder: (context, constraints) {
      double maxWidth = constraints.maxWidth;
      return Padding(
        padding: const EdgeInsets.only(
          left: 10,
          right: 10,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'selectPlayer'.tr,
              style: globalTextStyle(
                  fontSize: maxWidth > 600 ? 12.sp : 20.sp,
                  fontWeight: FontWeight.w800),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                controller.toggleVisibility();
              },
              child: Center(
                  child: Image.asset(
                'assets/new_images/Down.png',
                width: AppSizing.isMobile(context) ? 16.dg : 12.sp,
                height: AppSizing.isMobile(context) ? 16.dg : 12.sp,
              )),
            ),
            horizontalSpace(5.w),
            GestureDetector(
              onTap: () {
                controller.searchVisible.value =
                    !controller.searchVisible.value;
                controller.isSearch.value = !controller.isSearch.value;
              },
              child: Center(
                  child: Icon(
                CupertinoIcons.search,
                color: AppColors.secondary,
                size: 16.dg,
              )),
            ),
          ],
        ),
      );
    });
  }
}
