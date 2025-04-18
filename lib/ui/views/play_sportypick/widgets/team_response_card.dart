import 'dart:math';
import 'package:fmlfantasy/app/app_images/app_images.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/model/my_draws_model.dart';
import 'package:fmlfantasy/ui/helpers/local_time.dart';
import 'package:fmlfantasy/ui/helpers/replace_svg_with_png.dart';
import 'package:fmlfantasy/ui/views/play_sportypick/controller/play_sportypick_responses_controller.dart';
import 'package:flutter_svg/svg.dart';

class TeamResponseCard extends GetView<PlaySportypickResponsesController> {
  final DrawTeamsModel myDraws;
  final int index;
  const TeamResponseCard(
    this.index,
    this.myDraws, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(PlaySportypickResponsesController());
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      final DateTime endDate = DateTime.parse(myDraws.matchStartsAt.toString());
      final String formattedDifference = formatEndDateTime(endDate.toLocal());
      final maxWidth = constraints.maxWidth;
      return Obx(() {
        return Container(
          margin: EdgeInsets.only(bottom: 10.h),
          clipBehavior: Clip.hardEdge,
          padding: const EdgeInsets.all(5),
          width: Get.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.r),
            color: AppColors.white,
          ),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.bottomRight,
                child: Transform.rotate(
                  origin: const Offset(30, -20),
                  angle: pi / 4.5, // Rotate 60 degrees clockwise
                  child: Container(
                    height: 150.0, // Adjust height of the bar
                    width: 40.0, // Adjust width of the bar
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      gradient: const LinearGradient(
                        colors: [
                          Color.fromRGBO(219, 231, 255, 1),
                          Color.fromRGBO(219, 231, 255, 0)
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomRight,
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Transform.rotate(
                  origin: const Offset(0, 60),
                  angle: pi / 4.5, // Rotate 60 degrees clockwise
                  child: Container(
                    height: 100.0, // Adjust height of the bar
                    width: 60.0, // Adjust width of the bar
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      gradient: const LinearGradient(
                        colors: [
                          Color.fromRGBO(219, 231, 255, 1),
                          Color.fromRGBO(219, 231, 255, 0)
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomRight,
                      ),
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 5.w),
                        child: Text(
                          myDraws.competition!,
                          style: globalTextStyle2(
                            fontSize: 12.sp,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            left: 10.w, right: 15.w, top: 5.h, bottom: 5.h),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.r),
                          color: AppColors.grey,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              AppImages.calender,
                              // ignore: deprecated_member_use
                              color: AppColors.dark,
                              width: maxWidth > 600 ? 12.w : 15.w,
                              height: maxWidth > 600 ? 12.h : 15.h,
                            ),
                            horizontalSpace(10.w),
                            Text(
                              formattedDifference,
                              style: globalTextStyle(
                                fontSize: maxWidth > 600 ? 8.sp : 10.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.dark,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  verticalSpace(20.h),
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
                              child: myDraws.homeTeamImageUrl == null
                                  ? Container()
                                  : myDraws.homeTeamImageUrl!.endsWith('.svg')
                                      ? controller.selectedSport.value == 'CR'
                                          ? Image.network(
                                              replaceSvgWithPng(
                                                  myDraws.homeTeamImageUrl!),
                                            )
                                          : SvgPicture.network(
                                              myDraws.homeTeamImageUrl!,
                                            )
                                      : Image.network(myDraws.homeTeamImageUrl!,
                                          height: 45.h, width: 45.w),
                            ),
                            verticalSpace(10.h),
                            Text(
                              textAlign: TextAlign.center,
                              myDraws.homeTeamName!,
                              style: globalTextStyle(
                                fontSize: maxWidth > 600 ? 12.sp : 14.sp,
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
                                fontSize: maxWidth > 600 ? 14.sp : 16.sp,
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
                              child: myDraws.awayTeamImageUrl == null
                                  ? Container()
                                  : myDraws.awayTeamImageUrl!.endsWith('.svg')
                                      ? controller.selectedSport.value == 'CR'
                                          ? Image.network(
                                              replaceSvgWithPng(
                                                  myDraws.awayTeamImageUrl!),
                                            )
                                          : SvgPicture.network(
                                              myDraws.awayTeamImageUrl!,
                                            )
                                      : Image.network(myDraws.awayTeamImageUrl!,
                                          height: 45.h, width: 45.w),
                            ),
                            verticalSpace(10.h),
                            Text(
                              textAlign: TextAlign.center,
                              myDraws.awayTeamName!,
                              style: globalTextStyle(
                                fontSize: maxWidth > 600 ? 12.sp : 14.sp,
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
                  verticalSpace(10.h),
                ],
              ),
            ],
          ),
        );
      });
    });
  }
}
