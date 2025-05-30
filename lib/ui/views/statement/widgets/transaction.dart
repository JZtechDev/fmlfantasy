import 'package:fmlfantasy/app/app_colors/app_colors.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/model/transaction_model.dart';
import 'package:fmlfantasy/ui/helpers/commons.dart';
import 'package:fmlfantasy/ui/views/statement/controller/statement_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fmlfantasy/ui/views/statement/widgets/transactions_tab.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TransactionView extends GetView<StatementController> {
  const TransactionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('TRANSACTIONS'.tr,
            style:
                globalTextStyle(fontSize: 18.sp, fontWeight: FontWeight.w700)),
        verticalSpace(10.h),
        TransactionsTab(),
        verticalSpace(20.h),
        Obx(
          () => ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: controller.selectedData.length,
            itemBuilder: (context, index) {
              TransactionModel data = controller.selectedData[index];
              return Container(
                clipBehavior: Clip.hardEdge,
                margin: EdgeInsets.only(left: 15.w, right: 15.w, bottom: 10.h),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(243, 243, 243, 1),
                  borderRadius: BorderRadius.circular(5.r),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      left: Get.width * 0.15,
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 10.w, right: 10.w, top: 10.h, bottom: 10.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  'assets/new_images/trophy.png',
                                  height: 18,
                                  width: 18,
                                ),
                                horizontalSpace(5.w),
                                SizedBox(
                                  width: Get.width * 0.8,
                                  child: Text(data.tournamentId ?? '',
                                      textAlign: TextAlign.start,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: globalTextStyle(
                                          color: AppColors.dark,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w600)),
                                ),
                              ],
                            ),
                            verticalSpace(5.h),
                            SizedBox(
                              width: Get.width,
                              child: const Divider(
                                color: AppColors.dark,
                                thickness: 1.0,
                              ),
                            ),
                            verticalSpace(5.h),
                            Row(
                              children: [
                                Image.asset(
                                  'assets/new_images/calender.png',
                                  height: 18,
                                  width: 18,
                                  color: AppColors.dark,
                                ),
                                horizontalSpace(5.w),
                                SizedBox(
                                  width: Get.width * 0.8,
                                  child: Text(
                                      '${DateFormat.y().format(DateTime.parse(data.transactionTime ?? ''))} ${DateFormat('h:mm a').format(DateTime.parse(data.transactionTime ?? '').toLocal())}',
                                      textAlign: TextAlign.start,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: globalTextStyle(
                                          color: AppColors.dark,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w600)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        padding: EdgeInsets.only(
                            left: 10.w, right: 10.w, top: 5.h, bottom: 5.h),
                        height: Get.height * 0.1,
                        width: Get.width * 0.22,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                            color: const Color.fromRGBO(77, 134, 126, 1)),
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/new_images/dollar.png',
                              height: 18,
                              width: 18,
                            ),
                            verticalSpace(5.h),
                            Text(
                              'Entry fee',
                              style: globalTextStyle(
                                  fontSize: 12.sp, fontWeight: FontWeight.w600),
                            ),
                            Text(
                              '\$${data.amount!.toStringAsFixed(0)}',
                              style: globalTextStyle2(
                                  fontSize: 16.sp,
                                  color: AppColors.white,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                    ),
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
