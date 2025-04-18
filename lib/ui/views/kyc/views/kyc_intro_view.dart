import 'package:fmlfantasy/app/app_images/app_images.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/ui/views/kyc/views/cam_scan_intro.dart';
import 'package:fmlfantasy/ui/widgets/primary_button.dart';

class KycIntro extends StatelessWidget {
  const KycIntro({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(top: 90, left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
                textAlign: TextAlign.center,
                'Getting to know you'.tr,
                style: globalTextStyle(
                    fontSize: 26.sp, fontWeight: FontWeight.w500)),
          ),
          verticalSpace(30),
          Center(
            child: Image.asset(
              AppImages.kycIntroImage,
              height: 100.h,
              width: 100,
            ),
          ),
          verticalSpace(30),
          Text(
            'For security reasons and to keep this a safe place to trade, we will now verify your identity. It will take less than 3 minutes.'
                .tr,
            style: globalTextStyle2(fontSize: 12.sp, color: AppColors.textGray),
          ),
          verticalSpace(20),
          Text(
            textAlign: TextAlign.start,
            'Please have your citizen card ready.'.tr,
            style: globalTextStyle2(fontSize: 12.sp, color: AppColors.textGray),
          ),
          verticalSpace(20),
          PrimaryButton(
              buttonText: 'I\'am ready, Let\'s go'.tr,
              onPressed: () {
                Get.to(() => const CameraScanIntro());
              },
              isEnabled: true),
          verticalSpace(10),
          Center(
            child: GestureDetector(
              onTap: () {
                showModalBottomSheet(
                    backgroundColor: AppColors.white,
                    context: Get.context!,
                    builder: (BuildContext context) {
                      return Container(
                        padding: const EdgeInsets.all(20),
                        width: Get.width,
                        child: Column(
                          spacing: 10,
                          children: [
                            Image.asset(
                              AppImages.shield,
                              height: 100,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Text(
                                'Why we ask for identification'.tr,
                                style: globalTextStyle2(fontSize: 18.sp),
                              ),
                            ),
                            verticalSpace(20),
                            Text(
                              'At Fantasy Bulls we are serious about security and legal compliance. That’s how we make this a safe place to trade.'
                                  .tr,
                              style: globalTextStyle(
                                  letterSpacing: 5,
                                  fontSize: 12.sp,
                                  color: AppColors.textGray,
                                  fontWeight: FontWeight.w400),
                            ),
                            verticalSpace(10),
                            Text(
                              'Don\'t worry, the data we collect is processed in an encrypted manner and never sold or shared with third parties for marketing purposes.'
                                  .tr,
                              style: globalTextStyle(
                                  letterSpacing: 5,
                                  fontSize: 12.sp,
                                  color: AppColors.textGray,
                                  fontWeight: FontWeight.w400),
                            ),
                            const Spacer(),
                            PrimaryButton(
                                buttonText: 'Okay',
                                onPressed: () {
                                  Get.back();
                                },
                                isEnabled: true),
                          ],
                        ),
                      );
                    });
              },
              child: Text('Why do we ask this?'.tr,
                  style: globalTextStyle2(
                      fontSize: 14.sp, color: AppColors.primary)),
            ),
          ),
          verticalSpace(10),
          Center(
            child: GestureDetector(
              onTap: () {
                showModalBottomSheet(
                    backgroundColor: AppColors.white,
                    context: Get.context!,
                    builder: (BuildContext context) {
                      return Container(
                        padding: const EdgeInsets.all(20),
                        width: Get.width,
                        child: Column(
                          spacing: 10,
                          children: [
                            Image.asset(
                              AppImages.kycIntroImage,
                              height: 100,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Text(
                                'Can’t find your citizen card?'.tr,
                                style: globalTextStyle2(fontSize: 18.sp),
                              ),
                            ),
                            verticalSpace(20),
                            Text(
                              'Do you maybe have your passport or another government-issued document with a current photo at hand?'
                                  .tr,
                              style: globalTextStyle(
                                  letterSpacing: 5,
                                  fontSize: 12.sp,
                                  color: AppColors.textGray,
                                  fontWeight: FontWeight.w400),
                            ),
                            const Spacer(),
                            PrimaryButton(
                                buttonText: 'Use another document'.tr,
                                onPressed: () {
                                  Get.back();
                                },
                                isEnabled: true),
                            verticalSpace(10),
                            GestureDetector(
                              onTap: () {
                                showModalBottomSheet(
                                    backgroundColor: AppColors.white,
                                    context: Get.context!,
                                    builder: (BuildContext context) {
                                      return Container(
                                        padding: const EdgeInsets.all(20),
                                        width: Get.width,
                                        child: Column(
                                          spacing: 10,
                                          children: [
                                            Image.asset(
                                              AppImages.clock,
                                              height: 100,
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 20),
                                              child: Text(
                                                'Remind me later'.tr,
                                                style: globalTextStyle2(
                                                    fontSize: 18.sp),
                                              ),
                                            ),
                                            verticalSpace(20),
                                            Text(
                                              'We will send you a notification to resume identification later. Meanwhile you can browse our app with limited functionality.'
                                                  .tr,
                                              style: globalTextStyle(
                                                  letterSpacing: 5,
                                                  fontSize: 12.sp,
                                                  color: AppColors.textGray,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            const Spacer(),
                                            PrimaryButton(
                                                buttonText:
                                                    'Try app in demo mode'.tr,
                                                onPressed: () {
                                                  //Get.back();
                                                },
                                                isEnabled: true),
                                            verticalSpace(10),
                                            GestureDetector(
                                              onTap: () {
                                                Get.back();
                                              },
                                              child: Text('Back'.tr,
                                                  style: globalTextStyle2(
                                                      fontSize: 14.sp,
                                                      color:
                                                          AppColors.primary)),
                                            )
                                          ],
                                        ),
                                      );
                                    });
                              },
                              child: Text('Remind me later'.tr,
                                  style: globalTextStyle2(
                                      fontSize: 14.sp,
                                      color: AppColors.primary)),
                            )
                          ],
                        ),
                      );
                    });
              },
              child: Text('Can’t find my citizen card'.tr,
                  style: globalTextStyle2(
                      fontSize: 14.sp, color: AppColors.primary)),
            ),
          ),
        ],
      ),
    ));
  }
}
