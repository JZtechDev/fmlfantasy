import 'package:fmlfantasy/app/app_sizings.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/ui/views/my_teams/controller/my_teams_controller.dart';

class TeamsTabs extends GetView<MyTeamsController> {
  const TeamsTabs({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MyTeamsController());
    return Padding(
      padding: EdgeInsets.only(left: 10.w, right: 10),
      child: Obx(
        () => Container(
          padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 7.h),
          decoration: BoxDecoration(
            color: const Color.fromRGBO(101, 184, 172, 1),
            borderRadius: BorderRadius.circular(5.r),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                  child: GestureDetector(
                onTap: () {
                  controller.showAll.value = 'all';
                },
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(
                      top: 5.h, bottom: 5.h, left: 10.w, right: 10.w),
                  decoration: BoxDecoration(
                    color: controller.showAll.value == 'all'
                        ? AppColors.primary
                        : null,
                    borderRadius: BorderRadius.circular(5.r),
                    border: Border.all(
                        color: controller.showAll.value == 'all'
                            ? Colors.transparent
                            : AppColors.primary,
                        width: 1.5),
                  ),
                  child: Text(
                    'allTeams'.tr,
                    style: globalTextStyle(
                      fontSize: AppSizing.isMobile(context) ? 12.sp : 10.sp,
                      color: controller.showAll.value == 'all'
                          ? AppColors.white
                          : AppColors.primary,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              )),
              horizontalSpace(10.w),
              Expanded(
                  child: GestureDetector(
                onTap: () {
                  controller.showAll.value = 'closed';
                },
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(
                      top: 5.h, bottom: 5.h, left: 10.w, right: 10.w),
                  decoration: BoxDecoration(
                    color: controller.showAll.value == 'closed'
                        ? AppColors.primary
                        : null,
                    borderRadius: BorderRadius.circular(5.r),
                    border: Border.all(
                        color: controller.showAll.value == 'closed'
                            ? Colors.transparent
                            : AppColors.primary,
                        width: 1.5),
                  ),
                  child: Text(
                    'closed'.tr,
                    style: globalTextStyle(
                      fontSize: AppSizing.isMobile(context) ? 12.sp : 10.sp,
                      color: controller.showAll.value == 'closed'
                          ? AppColors.white
                          : AppColors.primary,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              )),
              horizontalSpace(10.w),
              Expanded(
                  child: GestureDetector(
                onTap: () {
                  controller.showAll.value = 'upcoming';
                },
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(
                      top: 5.h, bottom: 5.h, left: 10.w, right: 10.w),
                  decoration: BoxDecoration(
                    color: controller.showAll.value == 'upcoming'
                        ? AppColors.primary
                        : null,
                    borderRadius: BorderRadius.circular(5.r),
                    border: Border.all(
                        color: controller.showAll.value == 'upcoming'
                            ? Colors.transparent
                            : AppColors.primary,
                        width: 1.5),
                  ),
                  child: Text(
                    'upcoming'.tr,
                    style: globalTextStyle(
                      fontSize: AppSizing.isMobile(context) ? 12.sp : 10.sp,
                      color: controller.showAll.value == 'upcoming'
                          ? AppColors.white
                          : AppColors.primary,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
