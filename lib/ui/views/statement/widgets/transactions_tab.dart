import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/ui/views/statement/controller/statement_controller.dart';

import '../../../../core/imports/imports.dart';

class TransactionsTab extends StatelessWidget {
  const TransactionsTab({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(StatementController());
    return GetBuilder<StatementController>(builder: (controller) {
      return Padding(
        padding: EdgeInsetsGeometry.only(left: 15.w, right: 15.w),
        child: Container(
          padding: const EdgeInsetsGeometry.all(10),
          decoration: BoxDecoration(
              color: const Color.fromRGBO(101, 184, 172, 1),
              borderRadius: BorderRadius.circular(5.r)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  controller.loadData('all');
                },
                child: Container(
                  alignment: Alignment.center,
                  width: Get.width * 0.18,
                  padding: EdgeInsets.only(
                      left: 8.w, right: 8.w, top: 10.h, bottom: 10.h),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.r),
                      color: controller.selectedButtonIndex == 'all'
                          ? AppColors.secondary
                          : AppColors.primary),
                  child: Text(
                    'All'.tr,
                    style: globalTextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 10.sp,
                        color: controller.selectedButtonIndex == 'all'
                            ? AppColors.backgroud
                            : AppColors.white),
                  ),
                ),
              ),
              horizontalSpace(2.w),
              GestureDetector(
                onTap: () {
                  controller.loadData('0');
                },
                child: Container(
                  alignment: Alignment.center,
                  width: Get.width * 0.22,
                  padding: EdgeInsets.only(
                      left: 8.w, right: 8.w, top: 10.h, bottom: 10.h),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: controller.selectedButtonIndex == '0'
                          ? AppColors.secondary
                          : AppColors.primary),
                  child: Text(
                    'Entry Paid'.tr,
                    style: globalTextStyle(
                        fontSize: 10.sp,
                        color: controller.selectedButtonIndex == '0'
                            ? AppColors.backgroud
                            : AppColors.white),
                  ),
                ),
              ),
              horizontalSpace(2.w),
              GestureDetector(
                onTap: () {
                  controller.loadData('4');
                },
                child: Container(
                  alignment: Alignment.center,
                  width: Get.width * 0.22,
                  padding: EdgeInsets.only(
                      left: 8.w, right: 8.w, top: 10.h, bottom: 10.h),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.r),
                      color: controller.selectedButtonIndex == '4'
                          ? AppColors.secondary
                          : AppColors.primary),
                  child: Text(
                    'Prize Money'.tr,
                    style: globalTextStyle(
                        fontSize: 10.sp,
                        color: controller.selectedButtonIndex == '4'
                            ? AppColors.backgroud
                            : AppColors.white),
                  ),
                ),
              ),
              horizontalSpace(2.w),
              GestureDetector(
                onTap: () {
                  controller.loadData('2');
                },
                child: Container(
                  width: Get.width * 0.22,
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(
                      left: 8.w, right: 8.w, top: 10.h, bottom: 10.h),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.r),
                      color: controller.selectedButtonIndex == '2'
                          ? AppColors.secondary
                          : AppColors.primary),
                  child: Text(
                    'Deposit'.tr,
                    style: globalTextStyle(
                        fontSize: 10.sp,
                        color: controller.selectedButtonIndex == '2'
                            ? AppColors.backgroud
                            : AppColors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
