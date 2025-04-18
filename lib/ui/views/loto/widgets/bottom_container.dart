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
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          color: AppColors.white,
          child: SizedBox(
            height: maxWidth > 600 ? 110.h : 90.h,
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
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.dark),
                              ),
                              Text(
                                " \$${controller.drawFees.value.toString()}",
                                style: globalTextStyle(
                                    fontSize: AppSizing.isMobile(context)
                                        ? 14.sp
                                        : 12.sp,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.dark),
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.to(() => const PrizeDistribution());
                            },
                            child: Container(
                              padding: EdgeInsets.only(
                                  left: 15.h,
                                  top: 10.h,
                                  bottom: 10.h,
                                  right: 15.h),
                              decoration: BoxDecoration(
                                color: AppColors.grey,
                                borderRadius: BorderRadius.circular(5.r),
                              ),
                              child: Row(
                                children: [
                                  Image.asset(
                                    AppImages.questionIcon,
                                    height: 15.h,
                                    width: 15.h,
                                  ),
                                  horizontalSpace(5.w),
                                  Text(
                                    'prizeDistribution'.tr,
                                    style: globalTextStyle2(
                                        fontSize: AppSizing.isMobile(context)
                                            ? 12.sp
                                            : 10.sp),
                                  ),
                                ],
                              ),
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
