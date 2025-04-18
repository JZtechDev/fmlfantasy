import 'package:fmlfantasy/app/app_images/app_images.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/ui/components/skeleton.dart';
import 'package:flutter_svg/svg.dart';

class DrawsTeamsSkeleton extends StatelessWidget {
  const DrawsTeamsSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeleton(
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 5,
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, int index) {
          return Container(
              padding: EdgeInsets.only(
                  left: 10.w, right: 10.w, top: 5.h, bottom: 5.h),
              margin: EdgeInsets.only(bottom: 10.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.r),
                border: Border.all(color: AppColors.borderColor),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'NBA',
                        style: globalTextStyle2(
                            fontSize: 12.sp, color: AppColors.textGray),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            left: 10.w, right: 15.w, top: 5.h, bottom: 5.h),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.r),
                          color: Colors.green,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SvgPicture.asset(
                              AppImages.clockIcon,
                              // ignore: deprecated_member_use
                              color: AppColors.dark,
                              width: 15.w,
                              height: 15.h,
                            ),
                            horizontalSpace(10.w),
                            Text(
                              '2:30 PM',
                              style: globalTextStyle(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.dark,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  verticalSpace(10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              constraints: BoxConstraints(
                                maxHeight: 27.h,
                                maxWidth: 35.w,
                              ),
                              color: AppColors.grey,
                            ),
                            verticalSpace(10.h),
                            Text(
                              textAlign: TextAlign.center,
                              'Home',
                              style: globalTextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              'vs',
                              style: globalTextStyle2(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w700,
                                color: AppColors.textGray,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              constraints: BoxConstraints(
                                maxHeight: 27.h,
                                maxWidth: 35.w,
                              ),
                              color: AppColors.grey,
                            ),
                            verticalSpace(10.h),
                            Text(
                              textAlign: TextAlign.center,
                              'Away',
                              style: globalTextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ));
        },
      ),
    );
  }
}
