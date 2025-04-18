import 'package:fmlfantasy/app/app_colors/app_colors.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/ui/helpers/commons.dart';
import 'package:fmlfantasy/ui/views/select_players/controller/select_player_controller.dart';
import 'package:fmlfantasy/ui/views/select_players/widgets/fliters_button.dart';
import 'package:fmlfantasy/ui/views/select_players/widgets/positions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class SelectPlayerSkeleton extends GetView<SelectPlayerController> {
  const SelectPlayerSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SelectPlayerController());
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[200]!,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
                child: Column(
              children: [
                Padding(
                    padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 20),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                SizedBox(
                                  height: 35.h,
                                  width: 99.w,
                                  child: Center(
                                    child: Text(
                                      "Home Team",
                                      style: globalTextStyle(
                                        fontSize: 14.75.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(width: 8.w),
                            Container(
                              height: 40.h,
                              width: 40.w,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.grey),
                            ),
                            SizedBox(width: 29.w),
                            Container(
                              height: 40.h,
                              width: 40.w,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.grey),
                            ),
                            SizedBox(width: 8.w),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 35.h,
                                  width: 80.w,
                                  child: Center(
                                    child: Text(
                                      textAlign: TextAlign.left,
                                      'Away Team',
                                      style: globalTextStyle(
                                        fontSize: 14.75.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 10.h),
                      ],
                    )),
                Padding(
                  padding: EdgeInsets.only(left: 10.w, right: 10.w),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 31.h,
                          width: 174.w,
                          decoration: BoxDecoration(
                            color: AppColors.grey,
                            border: Border.all(color: AppColors.grey),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: 10.w, right: 10.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('0',
                                    style: globalTextStyle(
                                        fontSize: 14.75.sp,
                                        fontWeight: FontWeight.w600)),
                                Text('Player Selected',
                                    style: globalTextStyle(
                                        fontSize: 10.sp,
                                        color: AppColors.dark,
                                        fontWeight: FontWeight.w500)),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Expanded(
                        child: Container(
                          height: 31.h,
                          width: 174.w,
                          decoration: BoxDecoration(
                            color: AppColors.grey,
                            border: Border.all(color: AppColors.grey),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: 10.w, right: 10.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('0',
                                    style: globalTextStyle(
                                        fontSize: 14.75.sp,
                                        fontWeight: FontWeight.w600)),
                                Text('Player Selected',
                                    style: globalTextStyle(
                                        fontSize: 10.sp,
                                        color: AppColors.dark,
                                        fontWeight: FontWeight.w500)),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.h),
                const Positions(),
              ],
            )),
            SizedBox(height: 10.h),
            const FilterButton(),
            SizedBox(
              height: 8.h,
            ),
            LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
              double width = constraints.maxWidth;
              return GridView.builder(
                  itemCount: width > 600 ? 6 : 4,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: width > 600 ? 3 : 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.only(left: 10.w, top: 10.h),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Stack(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Home',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              verticalSpace(15.h),
                              const Text('12'),
                              Text(
                                'Points',
                                style: globalTextStyle(
                                  fontSize: width > 600 ? 8.sp : 12.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.white,
                                ),
                              ),
                              verticalSpace(20.h),
                              Container(
                                height: 20.h,
                                width: 40.w,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.r),
                                    color: AppColors.grey),
                              )
                            ],
                          ),
                          Positioned(
                              right: 20,
                              child: Container(
                                alignment: Alignment.center,
                                width: 50,
                                height: 30,
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.r),
                                  color: AppColors.navyBlue,
                                ),
                              )),
                          Align(
                            alignment: Alignment
                                .bottomRight, // Adjust the alignment values as needed
                            child: Image.asset(
                              'assets/images/away.png',
                            ),
                          ),
                        ],
                      ),
                    );
                  });
            }),
          ],
        ),
      ),
    );
  }
}
