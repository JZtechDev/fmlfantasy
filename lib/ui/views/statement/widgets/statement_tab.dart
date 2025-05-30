import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/ui/views/statement/controller/statement_controller.dart';

class StatementTab extends StatelessWidget {
  const StatementTab({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(StatementController());
    return GetBuilder<StatementController>(builder: (controller) {
      return Container(
        margin: EdgeInsets.only(left: 15.w, right: 15.w),
        padding: EdgeInsets.only(left: 5.w, right: 5.w, bottom: 5.h, top: 5.h),
        decoration: BoxDecoration(
          color: const Color.fromRGBO(101, 184, 172, 1),
          borderRadius: BorderRadius.circular(5.r),
        ),
        child: Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  controller.filterGraphDateValue('1Day');
                },
                child: Container(
                  padding: EdgeInsets.only(
                      left: 8.w, right: 8.w, bottom: 8.h, top: 8.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.r),
                    color: controller.selectedFilter == '1Day'
                        ? AppColors.secondary
                        : AppColors.primary,
                  ),
                  child: Text(
                    'Day',
                    style: globalTextStyle2(
                      fontWeight: FontWeight.w700,
                      fontSize: 12.sp,
                      color: controller.selectedFilter == '1Day'
                          ? AppColors.backgroud
                          : AppColors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            horizontalSpace(5.w),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  controller.filterGraphDateValue('7Days');
                },
                child: Container(
                  padding: EdgeInsets.only(
                      left: 8.w, right: 8.w, bottom: 8.h, top: 8.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.r),
                    color: controller.selectedFilter == '7Days'
                        ? AppColors.secondary
                        : AppColors.primary,
                  ),
                  child: Text(
                    'Week',
                    style: globalTextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 12.sp,
                      color: controller.selectedFilter == '7Days'
                          ? AppColors.backgroud
                          : AppColors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            horizontalSpace(5.w),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  controller.filterGraphDateValue('1Month');
                },
                child: Container(
                  padding: EdgeInsets.only(
                      left: 8.w, right: 8.w, bottom: 8.h, top: 8.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.r),
                    color: controller.selectedFilter == '1Month'
                        ? AppColors.secondary
                        : AppColors.primary,
                  ),
                  child: Text(
                    'Month',
                    style: globalTextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 12.sp,
                      color: controller.selectedFilter == '1Month'
                          ? AppColors.backgroud
                          : AppColors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            horizontalSpace(5.w),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  controller.filterGraphDateValue('3Months');
                },
                child: Container(
                  padding: EdgeInsets.only(
                      left: 8.w, right: 8.w, bottom: 8.h, top: 8.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.r),
                    color: controller.selectedFilter == '3Months'
                        ? AppColors.secondary
                        : AppColors.primary,
                  ),
                  child: Text(
                    'Quater',
                    style: globalTextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 12.sp,
                      color: controller.selectedFilter == '3Months'
                          ? AppColors.backgroud
                          : AppColors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            horizontalSpace(5.w),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  controller.filterGraphDateValue('1Year');
                },
                child: Container(
                  padding: EdgeInsets.only(
                      left: 8.w, right: 8.w, bottom: 8.h, top: 8.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.r),
                    color: controller.selectedFilter == '1Year'
                        ? AppColors.secondary
                        : AppColors.primary,
                  ),
                  child: Text(
                    'Year',
                    style: globalTextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 12.sp,
                      color: controller.selectedFilter == '1Year'
                          ? AppColors.backgroud
                          : AppColors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            horizontalSpace(5.w),
          ],
        ),
      );
    });
  }
}
