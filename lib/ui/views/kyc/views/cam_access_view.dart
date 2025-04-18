import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/ui/views/kyc/controller/kyc_controller.dart';
import 'package:fmlfantasy/ui/widgets/primary_button.dart';
import 'package:flutter/cupertino.dart';

class CamAccessView extends StatelessWidget {
  const CamAccessView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(KycController());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 90, left: 20, right: 20),
        child: GetBuilder<KycController>(builder: (controller) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: const Icon(CupertinoIcons.arrow_left)),
              verticalSpace(10),
              Text('Camera access was denied'.tr,
                  style: globalTextStyle(
                      fontSize: 26.sp, fontWeight: FontWeight.w500)),
              Center(
                  child: Icon(
                CupertinoIcons.exclamationmark_circle,
                size: 70.h,
                color: AppColors.errorRed,
              )),
              verticalSpace(10),
              Text(
                'It seems that you didn’t grant us permission to access camera.\n\nWe need temporary access to your camera to take some pictures of you and your identity document.',
                style: globalTextStyle2(
                    fontSize: 12.sp, color: AppColors.textGray),
              ),
              verticalSpace(50.h),
              PrimaryButton(
                  buttonText: 'Allow access',
                  onPressed: () {
                    controller.getImageFromCamera();
                  },
                  isEnabled: true),
              verticalSpace(10.h),
              Center(
                child: GestureDetector(
                  onTap: () {},
                  child: Text('Try App In Demo Mode'.tr,
                      style: globalTextStyle2(
                          fontSize: 14.sp, color: AppColors.primary)),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
