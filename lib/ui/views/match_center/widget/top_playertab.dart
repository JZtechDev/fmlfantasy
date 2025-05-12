import 'package:fmlfantasy/app/app_sizings.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/ui/views/match_center/controller/match_center_inner_controller.dart';

class ToggleCarouselSliderContainer extends GetView<MatchCenterInner> {
  final int index;
  const ToggleCarouselSliderContainer({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    Get.put(MatchCenterInner());
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          children: [
            Container(
              margin: EdgeInsets.only(left: 5.w, right: 5.w),
              height: 49.h,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(44, 86, 80, 1),
                border: Border.all(
                  color: const Color.fromRGBO(44, 86, 80, 1),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(5.r),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Obx(
                        () => GestureDetector(
                          onTap: () {
                            //controller.isStats.value = true;
                            controller.isStatsList[index].value = true;
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            alignment: Alignment.center,
                            height: 39.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.r),
                              color: controller.isStatsList[index].value
                                  ? AppColors.secondary
                                  : const Color.fromRGBO(44, 86, 80, 1),
                              border: Border.all(
                                color: controller.isStatsList[index].value
                                    ? const Color.fromRGBO(44, 86, 80, 1)
                                    : AppColors.secondary,
                                width: 1,
                              ),
                            ),
                            child: AnimatedDefaultTextStyle(
                              duration: const Duration(milliseconds: 300),
                              style: globalTextStyle(
                                fontSize:
                                    AppSizing.isMobile(context) ? 12.sp : 8.sp,
                                color: AppColors.dark,
                              ),
                              child: Text(
                                'STATISTICS'.tr,
                                style: globalTextStyle(
                                    color: controller.isStatsList[index].value
                                        ? AppColors.darkGreen
                                        : AppColors.secondary,
                                    fontSize: AppSizing.isMobile(context)
                                        ? 12.sp
                                        : 8.sp,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    horizontalSpace(5.w),
                    Expanded(
                      child: Obx(
                        () => GestureDetector(
                          onTap: () {
                            controller.isStatsList[index].value = false;
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            alignment: Alignment.center,
                            height: 39.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.r),
                              color: controller.isStatsList[index].value
                                  ? const Color.fromRGBO(44, 86, 80, 1)
                                  : AppColors.secondary,
                              border: Border.all(
                                color: controller.isStatsList[index].value
                                    ? AppColors.secondary
                                    : const Color.fromRGBO(44, 86, 80, 1),
                                width: 1,
                              ),
                            ),
                            child: AnimatedDefaultTextStyle(
                              duration: const Duration(milliseconds: 300),
                              style: globalTextStyle(
                                fontSize:
                                    AppSizing.isMobile(context) ? 12.sp : 8.sp,
                                color: AppColors.dark,
                              ),
                              child: Text(
                                ' POINTS'.tr,
                                style: globalTextStyle(
                                    color: controller.isStatsList[index].value
                                        ? AppColors.secondary
                                        : AppColors.darkGreen,
                                    fontSize: AppSizing.isMobile(context)
                                        ? 12.sp
                                        : 8.sp,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
