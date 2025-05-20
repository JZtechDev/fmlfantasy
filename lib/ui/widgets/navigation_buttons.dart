import 'package:fmlfantasy/app/app_sizings.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/ui/components/trapezoid.dart';

class NavigationButtons extends StatelessWidget {
  const NavigationButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.transparent,
      expandedHeight: 20.h,
      collapsedHeight: 20.h,
      automaticallyImplyLeading: false,
      elevation: 0,
      pinned: true,
      toolbarHeight: 20.h,
      flexibleSpace: Padding(
        padding: EdgeInsets.only(left: 30.w, right: 30.w),
        child: ClipPath(
          clipper: TrapezoidClipper(),
          child: Container(
            width: Get.width * 0.2,
            height: 20.h,
            color: AppColors.secondary,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Row(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.primaryDark),
                            color: AppColors.secondary,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(FlutterRemix.arrow_left_s_line,
                              color: AppColors.primaryDark,
                              size:
                                  AppSizing.isMobile(context) ? 13.sp : 10.sp),
                        ),
                        horizontalSpace(5.w),
                        Text(
                          'Previous',
                          style: globalTextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w700,
                              color: AppColors.darkGreen),
                        ),
                      ],
                    ),
                  ),
                  horizontalSpace(Get.width * 0.15),
                  GestureDetector(
                    onTap: () {
                      Get.offAllNamed(AppRoutes.dashboardView);
                    },
                    child: Row(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.primaryDark),
                            color: AppColors.secondary,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(FlutterRemix.arrow_left_s_line,
                              color: AppColors.primaryDark,
                              size:
                                  AppSizing.isMobile(context) ? 13.sp : 10.sp),
                        ),
                        horizontalSpace(5.w),
                        Text(
                          'Dashboard',
                          style: globalTextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 12.sp,
                              color: AppColors.darkGreen),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
