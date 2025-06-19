import 'package:fmlfantasy/app/app_images/app_images.dart';
import 'package:fmlfantasy/app/app_sizings.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/ui/views/loto/loto_controller/loto_controller.dart';
import 'package:fmlfantasy/ui/views/loto/widgets/prize_distribution.dart';
import 'package:fmlfantasy/ui/widgets/primary_button.dart';

class BottomContainer extends GetView<LotoController> {
  const BottomContainer({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LotoController());
    return LayoutBuilder(builder: (context, constraints) {
      double maxWidth = constraints.maxWidth;
      return Container(
          padding: const EdgeInsets.only(top: 5, bottom: 5),
          color: AppColors.primary,
          child: SizedBox(
            height: maxWidth > 600 ? 100.h : 80.h,
            width: Get.width,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: Obx(
                      () => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                "totalFees".tr,
                                style: globalTextStyle(
                                    fontSize: AppSizing.isMobile(context)
                                        ? 14.sp
                                        : 12.sp,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.white),
                              ),
                              Text(
                                " \$${controller.drawFees.value.toString()}",
                                style: globalTextStyle(
                                    fontSize: AppSizing.isMobile(context)
                                        ? 16.sp
                                        : 12.sp,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.white),
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.to(() => const PrizeDistribution());
                            },
                            child: Row(
                              children: [
                                Image.asset(
                                  AppImages.questionIcon,
                                  height: 15.h,
                                  width: 15.h,
                                  color: AppColors.white,
                                ),
                                horizontalSpace(5.w),
                                Text(
                                  'prizeDistribution'.tr,
                                  style: globalTextStyle2(
                                      color: AppColors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: AppSizing.isMobile(context)
                                          ? 12.sp
                                          : 10.sp),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  verticalSpace(5.h),
                  PrimaryButton(
                      buttonText: 'continue'.tr,
                      onPressed: () {
                        Get.toNamed(AppRoutes.myDrawsView);
                      },
                      isEnabled: true)
                ]),
          ));
    });
  }
}
