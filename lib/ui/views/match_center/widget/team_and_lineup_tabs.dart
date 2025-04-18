import 'package:fmlfantasy/app/app_sizings.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/model/match_center_inner.dart';
import 'package:fmlfantasy/ui/views/match_center/controller/match_center_inner_controller.dart';

class TeamAndLineupTabs extends GetView<MatchCenterInner> {
  final InnerMatchCenterModel data;
  const TeamAndLineupTabs({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    Get.put(MatchCenterInner());
    return Column(
      children: [
        Obx(
          () => Container(
            margin: EdgeInsets.symmetric(horizontal: 10.w),
            padding: const EdgeInsets.all(2.5),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(5.r),
            ),
            child: Row(children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    controller.playersTabIsAway.value = false;
                  },
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: controller.playersTabIsAway.value
                          ? AppColors.grey
                          : AppColors.primary,
                      borderRadius: BorderRadius.circular(2.5.r),
                    ),
                    child: Text(
                        style: globalTextStyle2(
                          fontSize: AppSizing.isMobile(context) ? 12.sp : 10.sp,
                          color: controller.playersTabIsAway.value == false
                              ? AppColors.white
                              : AppColors.navyBlue,
                        ),
                        data.teamAName ?? '-'),
                  ),
                ),
              ),
              horizontalSpace(5.w),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    controller.playersTabIsAway.value = true;
                  },
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: controller.playersTabIsAway.value
                          ? AppColors.primary
                          : AppColors.grey,
                      borderRadius: BorderRadius.circular(2.5.r),
                    ),
                    child: Text(
                      data.teamBName ?? '-',
                      style: globalTextStyle2(
                        fontSize: AppSizing.isMobile(context) ? 12.sp : 10.sp,
                        color: controller.playersTabIsAway.value == true
                            ? AppColors.white
                            : AppColors.navyBlue,
                      ),
                    ),
                  ),
                ),
              )
            ]),
          ),
        ),
        verticalSpace(5.h),
        Obx(
          () => Container(
            margin: EdgeInsets.symmetric(horizontal: 40.w),
            padding: const EdgeInsets.all(2.5),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(5.r),
            ),
            child: Row(children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    controller.isLineup.value = true;
                  },
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: controller.isLineup.value
                          ? AppColors.primary
                          : AppColors.grey,
                      borderRadius: BorderRadius.circular(2.5.r),
                    ),
                    child: Text(
                        style: globalTextStyle2(
                          fontSize: AppSizing.isMobile(context) ? 12.sp : 10.sp,
                          color: controller.isLineup.value
                              ? AppColors.white
                              : AppColors.navyBlue,
                        ),
                        'Lineup'.tr),
                  ),
                ),
              ),
              horizontalSpace(5.w),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    controller.isLineup.value = false;
                  },
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: controller.isLineup.value
                          ? AppColors.grey
                          : AppColors.primary,
                      borderRadius: BorderRadius.circular(2.5.r),
                    ),
                    child: Text(
                      'Formation'.tr,
                      style: globalTextStyle2(
                        fontSize: AppSizing.isMobile(context) ? 12.sp : 10.sp,
                        color: controller.isLineup.value
                            ? AppColors.dark
                            : AppColors.white,
                      ),
                    ),
                  ),
                ),
              )
            ]),
          ),
        ),
      ],
    );
  }
}
