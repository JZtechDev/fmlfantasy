import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/ui/views/create_contest/controller/create_contests_controller.dart';
import 'package:fmlfantasy/ui/widgets/app_textfield.dart';
import 'package:fmlfantasy/ui/widgets/radiotile.dart';
import 'package:flutter/services.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';

class ContestSettings extends GetView<CreateContestsController> {
  const ContestSettings({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKey,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpace(10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'entryFee'.tr,
                style: globalTextStyle2(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textGray),
              ),
              horizontalSpace(60.w),
              Row(
                children: [
                  Text(
                    'fees'.tr,
                    style: globalTextStyle2(
                        fontSize: 12.sp, fontWeight: FontWeight.w500),
                  ),
                  horizontalSpace(5.w),
                  AdvancedSwitch(
                    height: 25.h,
                    initialValue: controller.isSwitched.value,
                    onChanged: (value) {
                      controller.toggleSwitch(value);
                    },
                    activeColor: AppColors.primary,
                    inactiveColor: AppColors.borderColor,
                    borderRadius: BorderRadius.circular(60.r),
                    enabled: true,
                  ),
                  horizontalSpace(5.w),
                  Text(
                    'paid'.tr,
                    style: globalTextStyle2(
                        fontSize: 12.sp, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ],
          ),
          verticalSpace(20.h),
          Text(
            'enterPaymentMethod'.tr,
            style: globalTextStyle2(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.textGray),
          ),
          verticalSpace(10.h),
          Obx(() {
            if (controller.entryFeeController.text.isEmpty) {
              controller.entryFeeController = TextEditingController(text: '0');
            }
            return AppTextField(
              inputFormatters: [
                LengthLimitingTextInputFormatter(4),
                FilteringTextInputFormatter.deny(
                  RegExp(r'^0+'),
                ),
              ],
              controller: controller.entryFeeController,
              fillColor: controller.isSwitched.value
                  ? AppColors.white
                  : AppColors.borderColor,
              readOnly: !controller.isSwitched.value,
              labelText: '',
              preText: '\$ ',
              keyboardType: TextInputType.number,
            );
          }),
          verticalSpace(10.h),
          Obx(() => controller.isSwitched.value
              ? Padding(
                  padding: EdgeInsets.only(bottom: 20.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'enterPaymentMethod'.tr,
                        style: globalTextStyle2(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.textGray),
                      ),
                      verticalSpace(10.h),
                      CustomRadioButton(
                        value: 'platform',
                        groupValue: controller.payWith.value,
                        label: 'payontheplatform'.tr,
                        onChanged: (newValue) {
                          controller.payWith.value = newValue;
                        },
                      ),
                      verticalSpace(10.h),
                      CustomRadioButton(
                        value: 'admin',
                        groupValue: controller.payWith.value,
                        label: 'adminwillcollectpayment'.tr,
                        onChanged: (newValue) {
                          controller.payWith.value = newValue;
                        },
                      ),
                    ],
                  ),
                )
              : const SizedBox()),
          Text(
            'enterContestName'.tr,
            style: globalTextStyle2(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.textGray),
          ),
          verticalSpace(10.h),
          AppTextField(
            labelText: 'Contest Name'.tr, // contestName.try
            fillColor: AppColors.white,
            controller: controller.contestNameController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'pleaseentercontestname'.tr;
              } else {
                return null;
              }
            },
          ),
        ],
      ),
    );
  }
}
