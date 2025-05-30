import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/model/account_details_model.dart';
import 'package:fmlfantasy/ui/components/home_appbar.dart';
import 'package:fmlfantasy/ui/views/statement/controller/statement_controller.dart';
import 'package:fmlfantasy/ui/views/statement/widgets/chart.dart';
import 'package:fmlfantasy/ui/views/statement/widgets/statement_tab.dart';
import 'package:fmlfantasy/ui/views/statement/widgets/transaction.dart';

class StatementView extends GetView<StatementController> {
  const StatementView({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(StatementController());
    return Scaffold(
      appBar: HomeAppBar(title: 'Statement'.tr),
      body: ListView(
        controller: controller.scrollController,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 10.h, left: 15.w, right: 15.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                    decoration: BoxDecoration(
                      color: AppColors.secondary,
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                    child: Text('Go Back',
                        style: globalTextStyle2(
                            fontSize: 12.sp,
                            color: AppColors.backgroud,
                            fontWeight: FontWeight.w700)),
                  ),
                ),
                Text('Statement'.tr,
                    style: globalTextStyle(
                        fontSize: 20.sp, fontWeight: FontWeight.w700)),
              ],
            ),
          ),
          verticalSpace(10.h),
          const Divider(
            color: AppColors.secondary,
            thickness: 1.0,
          ),
          verticalSpace(15.h),
          Obx(() {
            AccountDetailsModel data = controller.accountDetailsList.first;
            return Padding(
              padding: EdgeInsets.only(left: 30.w, right: 15.w),
              child: Row(
                children: [
                  Obx(
                    () => CircleAvatar(
                        radius: 40.r,
                        backgroundColor: AppColors.grey,
                        backgroundImage: NetworkImage(data.imageUrl!.value)),
                  ),
                  horizontalSpace(30.w),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${data.userName}',
                          style: globalTextStyle(
                              fontSize: 16.sp,
                              color: AppColors.secondary,
                              fontWeight: FontWeight.w700),
                        ),
                        Text(
                          '\$199',
                          style: globalTextStyle(
                              fontSize: 20.sp,
                              color: AppColors.white,
                              fontWeight: FontWeight.w700),
                        ),
                      ]),
                ],
              ),
            );
          }),
          verticalSpace(10.h),
          const Divider(
            color: AppColors.secondary,
            thickness: 1.0,
          ),
          verticalSpace(10.h),
          Center(
            child: Text(
              'STATEMENTS OF PERFORMANCES'.tr,
              style:
                  globalTextStyle(fontSize: 18.sp, fontWeight: FontWeight.w700),
            ),
          ),
          verticalSpace(10.h),
          const StatementTab(),
          verticalSpace(10.h),
          const StatementChart(),
          verticalSpace(10.h),
          const TransactionView(),
        ],
      ),
    );
  }
}
