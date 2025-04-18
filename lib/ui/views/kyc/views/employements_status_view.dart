import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/ui/views/kyc/controller/kyc_controller.dart';
import 'package:fmlfantasy/ui/widgets/primary_button.dart';
import 'package:fmlfantasy/ui/widgets/radiotile.dart';
import 'package:flutter/cupertino.dart';

class EmployementsStatusView extends StatelessWidget {
  const EmployementsStatusView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(KycController());
    return Scaffold(
      backgroundColor: AppColors.grey,
      body: GetBuilder<KycController>(builder: (controller) {
        return Padding(
          padding:
              const EdgeInsets.only(top: 90, left: 20, right: 20, bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: const Icon(CupertinoIcons.arrow_left)),
              verticalSpace(10),
              Text('What’s your\nemployment status?'.tr,
                  style: globalTextStyle(fontSize: 26.sp)),
              verticalSpace(20),
              CustomRadioButton(
                  color: AppColors.white,
                  value: 'Employee',
                  label: 'Employee',
                  groupValue: controller.emplyementStatus,
                  onChanged: (value) {
                    controller.emplyementStatus = value;
                  }),
              verticalSpace(10),
              CustomRadioButton(
                  color: AppColors.white,
                  value: 'Self Employed',
                  label: 'Self Employed',
                  groupValue: controller.emplyementStatus,
                  onChanged: (value) {
                    controller.emplyementStatus = value;
                  }),
              verticalSpace(10),
              CustomRadioButton(
                  color: AppColors.white,
                  value: 'Unemployed',
                  label: 'Unemployed',
                  groupValue: controller.emplyementStatus,
                  onChanged: (value) {
                    controller.emplyementStatus = value;
                  }),
              verticalSpace(10),
              CustomRadioButton(
                  color: AppColors.white,
                  value: 'Retired',
                  label: 'Retired',
                  groupValue: controller.emplyementStatus,
                  onChanged: (value) {
                    controller.emplyementStatus = value;
                  }),
              verticalSpace(10),
              CustomRadioButton(
                  color: AppColors.white,
                  value: 'Student',
                  label: 'Student',
                  groupValue: controller.emplyementStatus,
                  onChanged: (value) {
                    controller.emplyementStatus = value;
                  }),
              verticalSpace(10),
              CustomRadioButton(
                  color: AppColors.white,
                  value: 'Housewife/-man',
                  label: 'Housewife/-man',
                  groupValue: controller.emplyementStatus,
                  onChanged: (value) {
                    controller.emplyementStatus = value;
                  }),
              verticalSpace(10),
              CustomRadioButton(
                  color: AppColors.white,
                  value: 'No profession (affluent)',
                  label: 'No profession (affluent)',
                  groupValue: controller.emplyementStatus,
                  onChanged: (value) {
                    controller.emplyementStatus = value;
                  }),
              const Spacer(),
              PrimaryButton(
                  buttonText: 'Submit', onPressed: () {}, isEnabled: true)
            ],
          ),
        );
      }),
    );
  }
}
