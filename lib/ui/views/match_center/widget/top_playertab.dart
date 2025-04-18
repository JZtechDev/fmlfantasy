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
        final maxWidth = constraints.maxWidth;
        return Column(
          children: [
            Container(
              width: maxWidth > 350 ? 170.w : 209.w,
              height: 49.h,
              decoration: BoxDecoration(
                color: AppColors.white,
                border: Border.all(
                  color: AppColors.white,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(5.r),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Obx(
                      () => GestureDetector(
                        onTap: () {
                          //controller.isStats.value = true;
                          controller.isStatsList[index].value = true;
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          alignment: Alignment.center,
                          height: 39.h,
                          width: maxWidth > 350 ? 75.w : 97.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.r),
                            color: controller.isStatsList[index].value
                                ? AppColors.primary
                                : AppColors.white,
                          ),
                          child: AnimatedDefaultTextStyle(
                            duration: const Duration(milliseconds: 300),
                            style: globalTextStyle(
                              fontSize:
                                  AppSizing.isMobile(context) ? 12.sp : 8.sp,
                              color: AppColors.dark,
                            ),
                            child: Text(
                              'statistics'.tr,
                              style: globalTextStyle(
                                  color: controller.isStatsList[index].value
                                      ? AppColors.white
                                      : AppColors.dark,
                                  fontSize: AppSizing.isMobile(context)
                                      ? 12.sp
                                      : 8.sp,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Obx(
                      () => GestureDetector(
                        onTap: () {
                          controller.isStatsList[index].value = false;
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          alignment: Alignment.center,
                          height: 39.h,
                          width: maxWidth > 350 ? 75.w : 97.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.r),
                            color: controller.isStatsList[index].value
                                ? AppColors.white
                                : AppColors.primary,
                          ),
                          child: AnimatedDefaultTextStyle(
                            duration: const Duration(milliseconds: 300),
                            style: globalTextStyle(
                              fontSize:
                                  AppSizing.isMobile(context) ? 12.sp : 8.sp,
                              color: AppColors.dark,
                            ),
                            child: Text(
                              'Fantasy Points'.tr,
                              style: globalTextStyle(
                                  color: controller.isStatsList[index].value
                                      ? AppColors.dark
                                      : AppColors.white,
                                  fontSize: AppSizing.isMobile(context)
                                      ? 12.sp
                                      : 8.sp,
                                  fontWeight: FontWeight.w600),
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
