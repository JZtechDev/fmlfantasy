import 'package:fmlfantasy/app/app_colors/app_colors.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/model/transaction_model.dart';
import 'package:fmlfantasy/ui/helpers/commons.dart';
import 'package:fmlfantasy/ui/views/statement/controller/statement_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TransactionView extends GetView<StatementController> {
  const TransactionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpace(10.h),
        Text('Transactions'.tr, style: globalTextStyle(fontSize: 16.sp)),
        verticalSpace(5.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Obx(
              () => GestureDetector(
                onTap: () {
                  controller.loadData('all');
                },
                child: Container(
                  alignment: Alignment.center,
                  width: Get.width * 0.22,
                  padding: EdgeInsets.only(
                      left: 8.w, right: 8.w, top: 8.h, bottom: 8.h),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: AppColors.borderColor),
                      color: controller.selectedButtonIndex.value == 'all'
                          ? AppColors.primary
                          : AppColors.white),
                  child: Text(
                    'All'.tr,
                    style: globalTextStyle(
                        fontSize: 10.sp,
                        color: controller.selectedButtonIndex.value == 'all'
                            ? AppColors.white
                            : AppColors.dark),
                  ),
                ),
              ),
            ),
            horizontalSpace(2.w),
            Obx(
              () => GestureDetector(
                onTap: () {
                  controller.loadData('0');
                },
                child: Container(
                  alignment: Alignment.center,
                  width: Get.width * 0.22,
                  padding: EdgeInsets.only(
                      left: 8.w, right: 8.w, top: 8.h, bottom: 8.h),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: AppColors.borderColor),
                      color: controller.selectedButtonIndex.value == '0'
                          ? AppColors.primary
                          : AppColors.white),
                  child: Text(
                    'Entry Paid'.tr,
                    style: globalTextStyle(
                        fontSize: 10.sp,
                        color: controller.selectedButtonIndex.value == '0'
                            ? AppColors.white
                            : AppColors.dark),
                  ),
                ),
              ),
            ),
            horizontalSpace(2.w),
            Obx(
              () => GestureDetector(
                onTap: () {
                  controller.loadData('4');
                },
                child: Container(
                  alignment: Alignment.center,
                  width: Get.width * 0.22,
                  padding: EdgeInsets.only(
                      left: 8.w, right: 8.w, top: 8.h, bottom: 8.h),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: AppColors.borderColor),
                      color: controller.selectedButtonIndex.value == '4'
                          ? AppColors.primary
                          : AppColors.white),
                  child: Text(
                    'Prize Money'.tr,
                    style: globalTextStyle(
                        fontSize: 10.sp,
                        color: controller.selectedButtonIndex.value == '4'
                            ? AppColors.white
                            : AppColors.dark),
                  ),
                ),
              ),
            ),
            horizontalSpace(2.w),
            Obx(
              () => GestureDetector(
                onTap: () {
                  controller.loadData('2');
                },
                child: Container(
                  width: Get.width * 0.22,
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(
                      left: 8.w, right: 8.w, top: 8.h, bottom: 8.h),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: AppColors.borderColor),
                      color: controller.selectedButtonIndex.value == '2'
                          ? AppColors.primary
                          : AppColors.white),
                  child: Text(
                    'Deposit'.tr,
                    style: globalTextStyle(
                        fontSize: 10.sp,
                        color: controller.selectedButtonIndex.value == '2'
                            ? AppColors.white
                            : AppColors.dark),
                  ),
                ),
              ),
            ),
          ],
        ),
        verticalSpace(20.h),
        Obx(
          () => ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: controller.selectedData.length,
            itemBuilder: (context, index) {
              TransactionModel data = controller.selectedData[index];
              return Container(
                color: AppColors.white,
                padding: EdgeInsets.only(
                    left: 10.w, right: 10.w, top: 5.h, bottom: 5.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.description ?? '',
                      style: globalTextStyle(fontSize: 12.sp),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          '\$${data.amount.toString()}',
                          style: globalTextStyle2(
                              fontSize: 12.sp, color: AppColors.textGray),
                        ),
                        horizontalSpace(5.w),
                        Expanded(child: Container()),
                        Text(
                          '${DateFormat.y().format(DateTime.parse(data.transactionTime ?? ''))} ${DateFormat('h:mm a').format(DateTime.parse(data.transactionTime ?? '').toLocal())}',
                          style: globalTextStyle2(
                              fontSize: 12.sp, color: AppColors.textGray),
                        ),
                      ],
                    ),
                    Text(
                      data.transactionType ?? '',
                      style: globalTextStyle2(
                          fontSize: 12.sp,
                          color: AppColors.primary,
                          fontWeight: FontWeight.w600),
                    ),
                    verticalSpace(2.h),
                    Divider(
                      thickness: 2,
                      color: AppColors.borderColor,
                      height: 2.h,
                    ),
                    verticalSpace(10.h),
                  ],
                ),
              );
            },
          ),
        ),
        verticalSpace(20.h),
      ],
    );
  }
}
