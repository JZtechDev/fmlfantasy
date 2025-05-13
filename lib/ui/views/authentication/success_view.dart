import 'package:fmlfantasy/app/app_images/app_images.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/ui/views/authentication/controller/auth_success_controller.dart';
import 'package:fmlfantasy/ui/views/team_name/widgets/team_name_lines.dart';
import 'package:fmlfantasy/ui/widgets/primary_button.dart';
import 'package:flutter_svg/svg.dart';

class SuccessView extends GetView<AuthSuccessController> {
  const SuccessView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AuthSuccessController());
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Stack(
        children: [
          const LineContainer(),
          Align(
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                verticalSpace(100.h),
                SvgPicture.asset(
                  AppImages.logo,
                  height: 50.h,
                  width: 50.w,
                ),
                verticalSpace(130.h),
                Container(
                  alignment: Alignment.center,
                  width: 80.w,
                  height: 80.h,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.primary.withValues(alpha: 0.2)),
                  child: Image.asset(AppImages.tick),
                ),
                verticalSpace(20.h),
                Text(
                  'Success'.tr,
                  style: globalTextStyle(
                      fontSize: 28.sp, fontWeight: FontWeight.w600),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 50.h, right: 50.h),
                  child: Text(
                    'Welcome to AlivSports! Browse Tournaments in Match Center or Invite Friends to Participate in Private Tournaments.'
                        .tr,
                    style: globalTextStyle2(
                        fontSize: 12.sp, color: AppColors.textGray),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
              bottom: 40.h,
              left: 20.h,
              right: 20.h,
              child: PrimaryButton(
                  buttonText: 'Continue to dashboard'.tr,
                  onPressed: () {
                    controller.redirectToHome();
                  },
                  isEnabled: true))
        ],
      ),
    );
  }
}
