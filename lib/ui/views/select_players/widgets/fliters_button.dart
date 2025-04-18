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
                  fontSize: maxWidth > 600 ? 12.sp : 21.sp,
                  fontWeight: FontWeight.w600),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                controller.toggleVisibility();
              },
              child: Obx(
                () => Container(
                    height: AppSizing.isMobile(context) ? 36.h : 27.h,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: controller.isVisible.value
                            ? AppColors.dark
                            : AppColors.white,
                        shape: BoxShape.circle),
                    child: Center(
                        child: SvgPicture.asset(
                      AppImages.selectPlayerMenu,
                      // ignore: deprecated_member_use
                      color: controller.isVisible.value
                          ? AppColors.white
                          : AppColors.dark,
                      width: AppSizing.isMobile(context) ? 16.dg : 12.sp,
                      height: AppSizing.isMobile(context) ? 16.dg : 12.sp,
                    ))),
              ),
            ),
            horizontalSpace(5.w),
            GestureDetector(
              onTap: () {
                controller.searchVisible.value =
                    !controller.searchVisible.value;
                controller.isSearch.value = !controller.isSearch.value;
              },
              child: Obx(
                () => Container(
                    height: AppSizing.isMobile(context) ? 36.h : 27.h,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: controller.searchVisible.value
                            ? AppColors.dark
                            : AppColors.white,
                        shape: BoxShape.circle),
                    child: Center(
                        child: SvgPicture.asset(
                      AppImages.search,
                      width: 16.dg,
                      height: 16.dg,
                      // ignore: deprecated_member_use
                      color: controller.searchVisible.value
                          ? AppColors.white
                          : AppColors.dark,
                    ))),
              ),
            ),
          ],
        ),
      );
    });
  }
}
