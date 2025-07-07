import 'package:fmlfantasy/app/app_images/app_images.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/ui/views/kyc/controller/kyc_controller.dart';
import 'package:fmlfantasy/ui/widgets/primary_button.dart';

class KYCView extends StatelessWidget {
  const KYCView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(KycController());
    return GetBuilder<KycController>(builder: (controller) {
      return Scaffold(
          backgroundColor: Color.fromRGBO(44, 86, 80, 1),
          body: Padding(
            padding: const EdgeInsets.only(
                top: 100, left: 20, right: 20, bottom: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Image.asset(
                    AppImages.logo,
                  ),
                ),
                Text('Welcome To FMLFantasy'.tr,
                    style: globalTextStyle(
                        fontSize: 32.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.dark)),
                const Spacer(),
                PrimaryButton(
                    buttonText: 'Browse Tournaments',
                    onPressed: () {
                      Get.offAllNamed(AppRoutes.dashboardView);
                    },
                    isEnabled: true),
                verticalSpace(30),
                PrimaryButton(
                    backgroundColor: Color.fromRGBO(44, 86, 80, 1),
                    borderColor: AppColors.secondary,
                    textColor: AppColors.secondary,
                    buttonText: 'Launch Verification',
                    onPressed: () {
                      controller.launchSDK();
                    },
                    isEnabled: true),
              ],
            ),
          ));
    });
  }
}
