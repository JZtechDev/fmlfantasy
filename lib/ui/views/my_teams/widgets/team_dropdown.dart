import 'package:fmlfantasy/app/app_sizings.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/ui/views/my_teams/controller/my_teams_controller.dart';

class TeamsDropdown extends GetView<MyTeamsController> {
  const TeamsDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MyTeamsController());
    return Padding(
      padding: EdgeInsets.only(left: 10.w, right: 10),
      child: Obx(
        () => Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
          decoration: BoxDecoration(
            color: AppColors.white,
            border: Border.all(color: AppColors.borderColor),
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
                        ? AppColors.grey
                        : AppColors.white,
                    borderRadius: BorderRadius.circular(2.5.r),
                  ),
                  child: Text(
                    'allTeams'.tr,
                    style: globalTextStyle(
                      fontSize: AppSizing.isMobile(context) ? 12.sp : 10.sp,
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
                        ? AppColors.grey
                        : AppColors.white,
                    borderRadius: BorderRadius.circular(2.5.r),
                  ),
                  child: Text(
                    'closed'.tr,
                    style: globalTextStyle(
                      fontSize: AppSizing.isMobile(context) ? 12.sp : 10.sp,
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
                        ? AppColors.grey
                        : AppColors.white,
                    borderRadius: BorderRadius.circular(2.5.r),
                  ),
                  child: Text(
                    'upcoming'.tr,
                    style: globalTextStyle(
                      fontSize: AppSizing.isMobile(context) ? 12.sp : 10.sp,
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
