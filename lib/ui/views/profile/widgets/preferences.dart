import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/ui/views/profile/controller/profile_controller.dart';

class Preferences extends GetView<ProfileController> {
  const Preferences({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProfileController());
    return Container(
      height: Get.height * 0.2,
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      width: Get.width,
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.all(Radius.circular(5.r)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsetsGeometry.symmetric(
                horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
                color: const Color.fromRGBO(44, 86, 80, 1),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5.r),
                  bottomLeft: Radius.circular(5.r),
                )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset(
                  'assets/new_images/details.png',
                  height: 24,
                  width: 24,
                ),
                // verticalSpace(40.h),
                Image.asset(
                  'assets/new_images/statment.png',
                  height: 24,
                  width: 24,
                )
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.toNamed(AppRoutes.accountDetailsView, arguments: {
                      'details': controller.accountDetailsList,
                    });
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Account Details'.tr,
                          style: globalTextStyle(
                              fontSize: 14.h, fontWeight: FontWeight.w700),
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: Get.width * 0.25,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: AppColors.secondary,
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.r)),
                          ),
                          child: Text(
                            'View/Edit',
                            style: globalTextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w700,
                                color: AppColors.backgroud),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                verticalSpace(10.h),
                const Divider(
                  color: AppColors.white,
                ),
                verticalSpace(10.h),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(AppRoutes.statementView);
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Statement'.tr,
                          style: globalTextStyle(
                              fontSize: 14.h, fontWeight: FontWeight.w700),
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: Get.width * 0.25,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: AppColors.secondary,
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.r)),
                          ),
                          child: Text(
                            'View',
                            style: globalTextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w700,
                                color: AppColors.backgroud),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
