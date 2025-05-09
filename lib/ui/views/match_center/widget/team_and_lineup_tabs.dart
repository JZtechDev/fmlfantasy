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
          () => Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    controller.playersTabIsAway.value = false;
                  },
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 20),
                    decoration: BoxDecoration(
                      color: controller.playersTabIsAway.value
                          ? AppColors.backgroud
                          : AppColors.secondary,
                      borderRadius: BorderRadius.circular(5.r),
                      border: Border.all(
                        color: controller.playersTabIsAway.value
                            ? AppColors.secondary
                            : AppColors.backgroud,
                        width: 1,
                      ),
                    ),
                    child: SizedBox(
                      width: Get.width * 0.3,
                      child: Text(
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: globalTextStyle2(
                            fontSize:
                                AppSizing.isMobile(context) ? 12.sp : 10.sp,
                            color: controller.playersTabIsAway.value == false
                                ? AppColors.darkGreen
                                : AppColors.secondary,
                          ),
                          data.teamAName ?? '-'),
                    ),
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
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 20),
                    decoration: BoxDecoration(
                      color: controller.playersTabIsAway.value
                          ? AppColors.secondary
                          : AppColors.backgroud,
                      borderRadius: BorderRadius.circular(5.r),
                      border: Border.all(
                        color: controller.playersTabIsAway.value
                            ? AppColors.backgroud
                            : AppColors.secondary,
                        width: 1,
                      ),
                    ),
                    child: SizedBox(
                      width: Get.width * 0.3,
                      child: Text(
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        data.teamBName ?? '-',
                        style: globalTextStyle2(
                          fontSize: AppSizing.isMobile(context) ? 12.sp : 10.sp,
                          color: controller.playersTabIsAway.value == true
                              ? AppColors.darkGreen
                              : AppColors.secondary,
                        ),
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
          () => Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    controller.isLineup.value = true;
                  },
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 20),
                    decoration: BoxDecoration(
                      color: controller.isLineup.value
                          ? const Color.fromRGBO(255, 240, 130, 1)
                          : AppColors.backgroud,
                      borderRadius: BorderRadius.circular(5.r),
                      border: Border.all(
                        color: controller.isLineup.value
                            ? AppColors.backgroud
                            : const Color.fromRGBO(255, 240, 130, 1),
                        width: 1,
                      ),
                    ),
                    child: Text(
                        style: globalTextStyle2(
                            fontSize:
                                AppSizing.isMobile(context) ? 12.sp : 10.sp,
                            color: controller.isLineup.value
                                ? AppColors.darkGreen
                                : const Color.fromRGBO(255, 240, 130, 1)),
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
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 20),
                    decoration: BoxDecoration(
                      color: controller.isLineup.value
                          ? AppColors.backgroud
                          : const Color.fromRGBO(255, 240, 130, 1),
                      borderRadius: BorderRadius.circular(5.r),
                      border: Border.all(
                        color: controller.isLineup.value
                            ? const Color.fromRGBO(255, 240, 130, 1)
                            : AppColors.backgroud,
                        width: 1,
                      ),
                    ),
                    child: Text(
                      'Formation'.tr,
                      style: globalTextStyle2(
                        fontSize: AppSizing.isMobile(context) ? 12.sp : 10.sp,
                        color: controller.isLineup.value
                            ? const Color.fromRGBO(255, 240, 130, 1)
                            : AppColors.darkGreen,
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
