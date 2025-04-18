import 'package:fmlfantasy/app/app_images/app_images.dart';
import 'package:fmlfantasy/app/app_sizings.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/ui/views/new_auth/controller/login_controller.dart';
import 'package:fmlfantasy/ui/widgets/app_textfield.dart';
import 'package:fmlfantasy/ui/widgets/primary_button.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          alignment: Alignment.center,
          children: [
            Positioned.fill(
                child: Opacity(
                    opacity: 0.5,
                    child: Image.asset('assets/new_images/login-bg.png'))),
            SingleChildScrollView(
              physics: const ScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 100, left: 20, right: 20, bottom: 50),
                child: GetBuilder<LoginController>(builder: (controller) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(AppImages.logo, width: 150.w),
                      verticalSpace(20.h),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: Get.width * 0.1),
                        child: Text(
                          'Fantasy Gaming right here in the Turks and Caicos Islands, the thrill is at your fingertips! NO  passport required.'
                              .tr,
                          style: globalTextStyle(
                              fontSize:
                                  AppSizing.isMobile(context) ? 18.sp : 16.sp,
                              color: AppColors.white,
                              fontWeight: FontWeight.w800),
                        ),
                      ),
                      verticalSpace(35.h),
                      Text('SIGN UP NOW'.tr,
                          style: globalTextStyle(
                              fontSize:
                                  AppSizing.isMobile(context) ? 16.sp : 14.sp,
                              color: AppColors.white,
                              fontWeight: FontWeight.w800)),

                      verticalSpace(24),
                      AppTextField(
                          labelText: 'Full Name'.tr, obscureText: false),
                      verticalSpace(20),
                      AppTextField(
                          labelText: 'Date of Birth'.tr, obscureText: false),
                      verticalSpace(20),
                      AppTextField(labelText: 'Email'.tr, obscureText: false),
                      verticalSpace(20),
                      AppTextField(labelText: 'Password'.tr, obscureText: true),
                      verticalSpace(20),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              controller.isAgreed = !controller.isAgreed;
                            },
                            child: Container(
                                height: 20.h,
                                width: 20.w,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: AppColors.borderColor),
                                    borderRadius: BorderRadius.circular(2.5.r)),
                                child: controller.isAgreed
                                    ? const Icon(
                                        Icons.check,
                                        size: 20,
                                        color: AppColors.white,
                                      )
                                    : Container()),
                          ),
                          horizontalSpace(10.w),
                          Expanded(
                            child: Text(
                                'I CONFIRM THAT I AM 18+ AND \n AGREE TO  THE TERMS'
                                    .tr,
                                style: globalTextStyle(
                                    fontSize: AppSizing.isMobile(context)
                                        ? 12.sp
                                        : 12.sp,
                                    color: AppColors.white,
                                    fontWeight: FontWeight.w600)),
                          ),
                          horizontalSpace(10.w),
                          Image.asset('assets/new_images/18+.png', height: 30.h)
                        ],
                      ),
                      verticalSpace(20.h),
                      PrimaryButton(
                          buttonText: 'SIGN UP'.tr,
                          onPressed: () {},
                          isEnabled: true),

                      verticalSpace(30),
                      Text('ALREADY A MEMBER?'.tr,
                          style: globalTextStyle(
                            fontSize: 12,
                            color: AppColors.white,
                          )),
                      verticalSpace(10),
                      PrimaryButton(
                          textColor: AppColors.white,
                          backgroundColor: Colors.transparent,
                          buttonText: 'LOGIN'.tr,
                          onPressed: () {
                            Get.toNamed(AppRoutes.dashboardView);
                          },
                          isEnabled: true),
                      verticalSpace(20),
                      Text('TERMS AND CONDITIONS .  PRIVACY POLICY'.tr,
                          style: globalTextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppColors.white)),
                      // const Spacer(),
                      // PrimaryButton(
                      //     buttonText: 'Open An Account'.tr,
                      //     onPressed: () {
                      //       Get.to(() => const BasicInfoView());
                      //     },
                      //     isEnabled: true),
                      // verticalSpace(20.h),
                      // PrimaryButton(
                      //     backgroundColor: AppColors.secondary,
                      //     buttonText: 'Already a customer? Login'.tr,
                      //     onPressed: () {
                      //       Get.toNamed(AppRoutes.dashboardView);
                      //     },
                      //     isEnabled: true)
                    ],
                  );
                }),
              ),
            ),
          ],
        ));
  }
}
