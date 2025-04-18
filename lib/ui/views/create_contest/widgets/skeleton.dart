import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/ui/components/skeleton.dart';

class PrivateTournamentSkeleton extends StatelessWidget {
  const PrivateTournamentSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeleton(
        child: ListView.builder(
      shrinkWrap: true,
      itemCount: 10,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.borderColor),
              borderRadius: BorderRadius.circular(5.r),
            ),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(20),
                        height: 20.h,
                        width: 100.w,
                        decoration: BoxDecoration(
                          color: AppColors.dark,
                          borderRadius: BorderRadius.circular(5.r),
                        ),
                      ),
                      horizontalSpace(10.w),
                      Row(
                        children: [
                          Container(
                            height: 40.h,
                            width: 40.w,
                            decoration: BoxDecoration(
                              color: AppColors.dark,
                              borderRadius: BorderRadius.circular(5.r),
                            ),
                          ),
                          horizontalSpace(10.w),
                          Container(
                            height: 40.h,
                            width: 40.w,
                            decoration: BoxDecoration(
                              color: AppColors.dark,
                              borderRadius: BorderRadius.circular(5.r),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  verticalSpace(20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            'Home Team',
                            style: globalTextStyle2(fontSize: 12.sp),
                          ),
                          Text(
                            'Home Team',
                            style: globalTextStyle2(fontSize: 12.sp),
                          ),
                        ],
                      ),
                    ],
                  ),
                  verticalSpace(10.h),
                ]),
          ),
        );
      },
    ));
  }
}
