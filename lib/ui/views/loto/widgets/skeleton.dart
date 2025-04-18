import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/ui/components/skeleton.dart';

class LotoSkeleton extends StatelessWidget {
  const LotoSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeleton(
        child: Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          padding:
              EdgeInsets.only(left: 10.w, top: 10.h, bottom: 5.h, right: 10.w),
          decoration: const BoxDecoration(
            color: Colors.transparent,
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10.w, right: 10.w, bottom: 10.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          SizedBox(
                            width: Get.width * 0.25,
                            child: Text(
                              'Home Team'.split(' ').join('\n'),
                              style: globalTextStyle(fontSize: 14.sp),
                            ),
                          ),
                          horizontalSpace(10.w),
                          Container(
                            width: 45.w,
                            height: 45.h,
                            decoration: const BoxDecoration(
                              color: AppColors.grey,
                              shape: BoxShape.circle,
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Container(
                            width: 45.w,
                            height: 45.h,
                            decoration: const BoxDecoration(
                              color: AppColors.grey,
                              shape: BoxShape.circle,
                            ),
                          ),
                          horizontalSpace(10.w),
                          SizedBox(
                            width: Get.width * 0.25,
                            child: Text(
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              'Away Team'.split(' ').join('\n'),
                              style: globalTextStyle(fontSize: 14.sp),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 70.h,
                      margin: EdgeInsets.only(right: 5.w),
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColors.borderColor),
                          borderRadius: BorderRadius.circular(5.r),
                          color: Colors.transparent),
                      child: Container(
                        padding: EdgeInsets.only(
                            top: 8.h, bottom: 8.h, left: 10.w, right: 10.w),
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.borderColor),
                          borderRadius: BorderRadius.circular(2.5.r),
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 70.h,
                      margin: EdgeInsets.only(right: 5.w),
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColors.borderColor),
                          borderRadius: BorderRadius.circular(5.r),
                          color: Colors.transparent),
                      child: Container(
                        padding: EdgeInsets.only(
                            top: 8.h, bottom: 8.h, left: 10.w, right: 10.w),
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.borderColor),
                          borderRadius: BorderRadius.circular(2.5.r),
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 70.h,
                      margin: EdgeInsets.only(right: 5.w),
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColors.borderColor),
                          borderRadius: BorderRadius.circular(5.r),
                          color: Colors.transparent),
                      child: Container(
                        padding: EdgeInsets.only(
                            top: 8.h, bottom: 8.h, left: 10.w, right: 10.w),
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.borderColor),
                          borderRadius: BorderRadius.circular(2.5.r),
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        verticalSpace(20.h),
        Container(
          padding: const EdgeInsets.all(10),
          margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.r),
            color: Colors.transparent,
            border: Border.all(color: AppColors.borderColor, width: 1),
          ),
          child: Column(
            children: [
              Container(
                height: 60.h,
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.r),
                  color: Colors.transparent,
                ),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.r),
                    color: AppColors.white,
                  ),
                ),
              ),
              verticalSpace(10.h),
              Row(
                children: [
                  Expanded(
                      child: Container(
                    height: 100.h,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.r),
                      color: Colors.transparent,
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.r),
                        color: AppColors.white,
                      ),
                    ),
                  )),
                  horizontalSpace(10),
                  Expanded(
                      child: Container(
                    height: 100.h,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.r),
                      color: Colors.transparent,
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.r),
                        color: AppColors.white,
                      ),
                    ),
                  ))
                ],
              ),
              verticalSpace(10),
              Row(
                children: [
                  Expanded(
                      child: Container(
                    height: 100.h,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.r),
                      color: Colors.transparent,
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.r),
                        color: AppColors.white,
                      ),
                    ),
                  )),
                  horizontalSpace(10),
                  Expanded(
                      child: Container(
                    height: 100.h,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.r),
                      color: Colors.transparent,
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.r),
                        color: AppColors.white,
                      ),
                    ),
                  ))
                ],
              )
            ],
          ),
        )
      ],
    ));
  }
}
