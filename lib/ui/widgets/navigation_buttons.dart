import 'package:fmlfantasy/app/app_sizings.dart';

import 'package:fmlfantasy/app/textstyles/textstyle.dart';

import 'package:fmlfantasy/core/imports/imports.dart';

import 'package:fmlfantasy/ui/components/trapezoid.dart';

class NavigationButtons extends StatelessWidget {
  final Color color;

  const NavigationButtons({super.key, this.color = Colors.transparent});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      surfaceTintColor: Colors.transparent,
      backgroundColor: color,
      expandedHeight: 30.h,
      collapsedHeight: 30.h,
      automaticallyImplyLeading: false,
      elevation: 0,
      pinned: true,
      toolbarHeight: 20.h,
      flexibleSpace: Padding(
        padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 5.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipPath(
              clipper: TrapezoidClipper(),
              child: Container(
                alignment: Alignment.center,
                width: Get.width * 0.35,
                height: 20.h,
                color: AppColors.secondary,
                child: Center(
                  child: GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Padding(
                      padding: EdgeInsets.only(right: 10.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
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
                                size: AppSizing.isMobile(context)
                                    ? 13.sp
                                    : 10.sp),
                          ),
                          horizontalSpace(5.w),
                          Text(
                            'PREVIOUS',
                            style: globalTextStyle(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w800,
                                color: AppColors.darkGreen),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            horizontalSpace(5.w),
            ClipPath(
              clipper: TrapezoidClipperLeft(),
              child: Container(
                padding: EdgeInsets.only(left: 10.w),
                alignment: Alignment.center,
                width: Get.width * 0.35,
                height: 20.h,
                color: AppColors.secondary,
                child: Center(
                  child: GestureDetector(
                    onTap: () {
                      Get.offAllNamed(AppRoutes.dashboardView);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
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
                          'DASHBOARD',
                          style: globalTextStyle(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w800,
                              color: AppColors.darkGreen),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
