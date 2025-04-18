import 'package:fmlfantasy/app/app_images/app_images.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/ui/views/authentication/controller/resgister_controller.dart';
import 'package:fmlfantasy/ui/views/authentication/widgtes/auth%20forms/registration_form.dart';
import 'package:fmlfantasy/ui/views/team_name/widgets/team_name_lines.dart';
import 'package:fmlfantasy/ui/widgets/primary_button.dart';
import 'package:flutter_svg/svg.dart';

class SignupDetailsView extends GetView<ResgisterController> {
  const SignupDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ResgisterController());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.white,
      body: LayoutBuilder(builder: (context, constraints) {
        final maxWidth = constraints.maxWidth;
        return Stack(
          children: [
            const LineContainer(),
            Align(
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  verticalSpace(maxWidth > 600 ? 50.h : 100.h),
                  SvgPicture.asset(
                    AppImages.logo,
                    height: maxWidth > 600 ? 65.h : 50.h,
                    width: maxWidth > 600 ? 65.w : 50.w,
                  ),
                  verticalSpace(maxWidth > 600 ? 30.h : 50.h),
                  const RegistrationForm(),
                  verticalSpace(15.h),
                  Padding(
                    padding: EdgeInsets.only(left: 18.w, right: 18.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Obx(
                              () => GestureDetector(
                                onTap: () {
                                  controller.confirmAge.value =
                                      !controller.confirmAge.value;
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.r),
                                    border: Border.all(
                                      color: AppColors.borderColor,
                                      width: 1,
                                    ),
                                    color: controller.confirmAge.value
                                        ? AppColors.primary
                                        : AppColors.white,
                                  ),
                                  child: Center(
                                      child: Icon(
                                    Icons.check,
                                    color: AppColors.white,
                                    size: 15.w,
                                  )),
                                ),
                              ),
                            ),
                            horizontalSpace(10.w),
                            Center(
                              child: Text(
                                'I Confirm I’m Above the age of 18'.tr,
                                style: globalTextStyle(
                                    fontSize: maxWidth > 600 ? 10.sp : 12.sp,
                                    color: AppColors.textGray,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 20.h,
              left: 10.w,
              right: 10.w,
              child: Column(
                children: [
                  PrimaryButton(
                      buttonText: 'Submit Details'.tr,
                      onPressed: () {
                        controller.isCountryValidation.value = true;
                        controller.postData();
                      },
                      isEnabled: true),
                  verticalSpace(10.h),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Facing Issue?'.tr,
                          style: globalTextStyle2(
                              fontSize: 12.sp, color: AppColors.textGray),
                        ),
                        TextSpan(
                          text: ' Contact us'.tr,
                          style: globalTextStyle2(
                              fontSize: 12.sp,
                              color: AppColors.dark,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        );
      }),
    );
  }
}
