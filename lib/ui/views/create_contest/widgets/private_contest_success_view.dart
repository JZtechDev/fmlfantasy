import 'package:fmlfantasy/app/app_images/app_images.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/ui/components/inner_appbar.dart';
import 'package:fmlfantasy/ui/views/create_contest/controller/create_contests_controller.dart';
import 'package:fmlfantasy/ui/widgets/primary_button.dart';
import 'package:clipboard/clipboard.dart';

class PrivateContestSuccessView extends GetView<CreateContestsController> {
  const PrivateContestSuccessView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey,
      resizeToAvoidBottomInset: false,
      appBar: const AppBarInner(title: 'Success'),
      body: Padding(
        padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 60.h),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(25),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.primary.withOpacity(0.2)),
                  child: Image.asset(
                    AppImages.tick,
                  ),
                ),
                verticalSpace(20.h),
                Center(
                  child: Text(
                    'success'.tr,
                    style: globalTextStyle(
                        fontSize: 24.sp, fontWeight: FontWeight.w600),
                  ),
                ),
                verticalSpace(5.h),
                Center(
                  child: Text(
                    'Lorem ipsum dolor sit amet consectetur.\nTempus sit diam cum integer accumsan\neleifend pharetra mi.',
                    style: globalTextStyle2(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textGray),
                    textAlign: TextAlign.center,
                  ),
                ),
                verticalSpace(50.h),
                Text(
                  'copyInviteLink'.tr,
                  style: globalTextStyle(
                      fontSize: 12.sp,
                      color: AppColors.dark,
                      fontWeight: FontWeight.w600),
                ),
                verticalSpace(5.h),
                Row(
                  children: [
                    Expanded(
                        child: Container(
                      height: 45.h,
                      padding: const EdgeInsets.all(10),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: AppColors.white),
                      child: Text(
                        controller.uri,
                        style: globalTextStyle2(
                            color: AppColors.dark,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    )),
                    horizontalSpace(5.w),
                    SizedBox(
                        width: 90.w,
                        child: PrimaryButton(
                          buttonText: 'copy'.tr,
                          onPressed: () {
                            FlutterClipboard.copy(controller.uri);
                          },
                          isEnabled: true,
                          backgroundColor: AppColors.navyBlue,
                        ))
                  ],
                )
              ],
            ),
            // Positioned(
            //   bottom: 60.h,
            //   left: 0.w,
            //   right: 0.w,
            //   child: PrimaryButton(
            //       buttonText: 'Create Team'.tr,
            //       onPressed: () {
            //         Get.toNamed(AppRoutes.selectPlayers, arguments: {
            //           'matchID': controller.matchId,
            //           'sport': selectedSPort.value,
            //           'tournamentId': controller.tournamentCode,
            //           'joinCode': controller.joinCodeId
            //         });
            //       },
            //       isEnabled: true),
            // ),
            Positioned(
              bottom: 15.h,
              left: 0.w,
              right: 0.w,
              child: PrimaryButton(
                  buttonText: 'returntoDashboard'.tr,
                  onPressed: () {
                    controller.navigateToHome();
                  },
                  isEnabled: true),
            )
          ],
        ),
      ),
    );
  }
}
