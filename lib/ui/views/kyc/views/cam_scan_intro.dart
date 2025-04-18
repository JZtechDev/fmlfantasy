import 'package:fmlfantasy/app/app_images/app_images.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/ui/views/kyc/controller/kyc_controller.dart';
import 'package:fmlfantasy/ui/views/kyc/views/adress_view.dart';
import 'package:fmlfantasy/ui/views/kyc/views/cam_access_view.dart';
import 'package:fmlfantasy/ui/widgets/primary_button.dart';
import 'package:flutter/cupertino.dart';

class CameraScanIntro extends StatelessWidget {
  const CameraScanIntro({super.key});

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
              Text('Scan Document'.tr,
                  style: globalTextStyle(
                      fontSize: 26.sp, fontWeight: FontWeight.w500)),
              Center(
                  child: Image.asset(AppImages.camera,
                      height: 100.h, width: 100.w)),
              verticalSpace(10),
              Text(
                'We need temporary access to your camera to take some pictures of you and your identity document.',
                style: globalTextStyle2(
                    fontSize: 12.sp, color: AppColors.textGray),
              ),
              verticalSpace(30),
              Text('Camera tip:'.tr, style: globalTextStyle(fontSize: 14.sp)),
              verticalSpace(30),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text:
                          'Try placing your document on a contrasting background to ensure your phone camera detects it easily. ',
                      style: globalTextStyle2(
                          fontSize: 12.sp, color: AppColors.textGray),
                    ),
                    TextSpan(
                      text: 'See more tips',
                      style: globalTextStyle2(
                          fontSize: 12.sp,
                          color: AppColors
                              .primary), // Change this to your primary color
                    ),
                  ],
                ),
              ),
              verticalSpace(50),
              PrimaryButton(
                  buttonText: 'Scan Document'.tr,
                  onPressed: () {
                    Get.to(() => const CamAccessView());
                  },
                  isEnabled: true),
              verticalSpace(20),
              controller.image == null
                  ? Container(
                      alignment: Alignment.center,
                      height: 100.h,
                      width: Get.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.r),
                        border: Border.all(color: AppColors.borderColor),
                        color: AppColors.grey,
                      ),
                      child: Text(
                        'No Document Selected',
                        style: globalTextStyle2(
                            fontSize: 12.sp, color: AppColors.textGray),
                      ),
                    )
                  : Center(
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.file(
                            controller.image!,
                            height: 100.h,
                            fit: BoxFit.cover,
                            alignment: Alignment.center,
                          ),
                          Positioned(
                            top: 0,
                            right: 0,
                            child: GestureDetector(
                              onTap: () {
                                controller.clearImage();
                              },
                              child: const Icon(
                                Icons.close,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
              verticalSpace(20),
              PrimaryButton(
                  buttonText: 'Upload Document'.tr,
                  onPressed: () {
                    showCupertinoModalPopup(
                      barrierColor: Colors.black.withValues(alpha: 0.2),
                      context: context,
                      builder: (context) => CupertinoActionSheet(
                        actions: [
                          GetBuilder<KycController>(builder: (controller) {
                            return CupertinoActionSheetAction(
                              child: Text('Photo Gallery',
                                  style: globalTextStyle(
                                      fontSize: 12.sp, color: AppColors.dark)),
                              onPressed: () {
                                // close the options modal
                                Navigator.of(context).pop();
                                // get image from gallery
                                controller.getImageFromGallery();
                              },
                            );
                          }),
                          GetBuilder<KycController>(
                            builder: (controller) => CupertinoActionSheetAction(
                              child: Text('Camera',
                                  style: globalTextStyle(
                                      fontSize: 12.sp, color: AppColors.dark)),
                              onPressed: () {
                                // close the options modal
                                Navigator.of(context).pop();
                                // get image from camera
                                controller.getImageFromCamera();
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  isEnabled: true),
              verticalSpace(10),
              PrimaryButton(
                  buttonText: 'Next',
                  onPressed: () {
                    Get.to(() => const AdressView());
                  },
                  isEnabled: true)
            ],
          );
        }),
      ),
    );
  }
}
