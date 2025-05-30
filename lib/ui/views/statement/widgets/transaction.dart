import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/model/transaction_model.dart';
import 'package:fmlfantasy/ui/helpers/commons.dart';
import 'package:fmlfantasy/ui/views/statement/controller/statement_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fmlfantasy/ui/views/statement/widgets/transaction_tile.dart';
import 'package:fmlfantasy/ui/views/statement/widgets/transactions_tab.dart';
import 'package:get/get.dart';

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
        const TransactionsTab(),
        verticalSpace(20.h),
        Obx(
          () => ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount:
                controller.selectedData.length < controller.displayedItems.value
                    ? controller.selectedData.length
                    : controller.displayedItems.value,
            itemBuilder: (context, index) {
              TransactionModel data = controller.selectedData[index];
              return TransactionTile(data: data);
            },
          ),
        ),
        verticalSpace(20.h),
      ],
    );
  }
}
