import 'package:fmlfantasy/app/app_images/app_images.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/ui/helpers/replace_svg_with_png.dart';
import 'package:fmlfantasy/ui/views/match_center/controller/match_center_inner_controller.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class FootballTopContainer extends GetView<MatchCenterInner> {
  final String? homename;
  final String? awayname;
  final String? homeimageurl;
  final String? awayimageurl;
  final String? homeScore;
  final String? awayScore;
  final String? playerOfTheMatch;
  final String? time;
  final String? leagueName;
  final String? venue;
  // final String? homeTeamTopBatsman1;
  // final String? homeTeamTopBatsman2;
  // final String? homeTeamTopBowler1;
  // final String? homeTeamTopBowler2;
  // final String? awayTeamTopBatsman1;
  // final String? awayTeamTopBatsman2;
  // final String? awayTeamTopBowler1;
  // final String? awayTeamTopBowler2;

  // final String? homeOvers;
  // final String? awayOvers;

  const FootballTopContainer(
    this.homename,
    this.awayname,
    this.homeimageurl,
    this.awayimageurl,
    this.homeScore,
    this.awayScore,
    this.playerOfTheMatch,
    this.time,
    this.leagueName,
    this.venue,
    // this.homeTeamTopBatsman1,
    // this.homeTeamTopBatsman2,
    // this.homeTeamTopBowler1,
    // this.homeTeamTopBowler2,
    // this.awayTeamTopBatsman1,
    // this.awayTeamTopBatsman2,
    // this.awayTeamTopBowler1,
    // this.awayTeamTopBowler2,

    // this.homeOvers,
    // this.awayOvers,
    {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      double maxWidth = constraints.maxWidth;
      return Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(color: AppColors.borderColor, width: 1.w),
          ),
          child: Padding(
            padding: EdgeInsets.only(
                left: 10.w, right: 10.w, top: 10.h, bottom: 10.h),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      width: Get.width * 0.4,
                      child: Text(
                        maxLines: 2,
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.ellipsis,
                        leagueName.toString(),
                        style: globalTextStyle(
                            fontSize: 12.sp, fontWeight: FontWeight.w600),
                      )),
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/clock.svg',
                        // ignore: deprecated_member_use
                        color: AppColors.navyBlue,
                        height: 16.h,
                        width: 16.w,
                      ),
                      horizontalSpace(5.w),
                      Text(
                          time != null
                              ? DateFormat('d MMM hh:mm a')
                                  .format(DateTime.parse(time!).toLocal())
                              : '',
                          style: globalTextStyle2(
                              fontSize: maxWidth > 600 ? 8.sp : 10.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.navyBlue),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis),
                    ],
                  )
                ],
              ),
              verticalSpace(10.h),
              Text(venue.toString(),
                  style: globalTextStyle2(
                      fontSize: maxWidth > 600 ? 8.sp : 12.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.navyBlue),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis),
              verticalSpace(10.h),
              Container(
                width: Get.width,
                height: 47.h,
                decoration: BoxDecoration(
                  color: AppColors.grey,
                  borderRadius: BorderRadius.circular(5.r),
                ),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text(homeScore!,
                      style: globalTextStyle2(
                          fontSize: maxWidth > 600 ? 8.sp : 30.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.navyBlue),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis),
                  horizontalSpace(10.w),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 5.h,
                        width: 5.w,
                        decoration: BoxDecoration(
                            color: AppColors.navyBlue,
                            borderRadius: BorderRadius.circular(1.r)),
                      ),
                      verticalSpace(10.h),
                      Container(
                        height: 5.h,
                        width: 5.w,
                        decoration: BoxDecoration(
                            color: AppColors.navyBlue,
                            borderRadius: BorderRadius.circular(1.r)),
                      ),
                    ],
                  ),
                  horizontalSpace(10.w),
                  Text(awayScore!,
                      style: globalTextStyle2(
                          fontSize: maxWidth > 600 ? 8.sp : 30.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.navyBlue),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis),
                ]),
              ),
              verticalSpace(10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: Get.width * 0.43,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        homeimageurl == null
                            ? const SizedBox(
                                height: 50,
                                width: 100,
                              )
                            : homeimageurl!.endsWith('.png')
                                ? Image.network(
                                    homeimageurl!,
                                    height: 45.h,
                                    width: 45.w,
                                  )
                                : controller.sportsCode == 'CR'
                                    ? Image.network(
                                        replaceSvgWithPng(homeimageurl!),
                                        height: 45.h,
                                        width: 45.w,
                                      )
                                    : SvgPicture.network(
                                        homeimageurl!,
                                        height: 30.h,
                                        width: 30.w,
                                      ),
                        verticalSpace(5.h),
                        Text(homename == null ? '-' : homename!,
                            style: globalTextStyle(
                                fontSize: maxWidth > 600 ? 12.sp : 14.sp)),
                      ],
                    ),
                  ),
                  const VerticalDivider(
                    color: AppColors.borderColor,
                    width: 2,
                    indent: 0,
                    endIndent: 10,
                  ),
                  SizedBox(
                    width: Get.width * 0.43,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        awayimageurl == null
                            ? const SizedBox(
                                height: 50,
                                width: 100,
                              )
                            : awayimageurl!.endsWith('.png')
                                ? Image.network(
                                    awayimageurl!,
                                    height: 45.h,
                                    width: 45.w,
                                  )
                                : controller.sportsCode == 'CR'
                                    ? Image.network(
                                        replaceSvgWithPng(awayimageurl!),
                                        height: 45.h,
                                        width: 45.w,
                                      )
                                    : SvgPicture.network(
                                        awayimageurl!,
                                        height: 30.h,
                                        width: 30.w,
                                      ),
                        verticalSpace(5.h),
                        Text(awayname == null ? '-' : awayname!,
                            style: globalTextStyle(
                                fontSize: maxWidth > 600 ? 12.sp : 14.sp)),
                      ],
                    ),
                  ),
                ],
              ),
              verticalSpace(10.h),
              Container(
                padding: EdgeInsets.only(top: 5.h, bottom: 5.h),
                alignment: Alignment.center,
                width: Get.width,
                decoration: BoxDecoration(
                  color: AppColors.grey,
                  borderRadius: BorderRadius.circular(5.r),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      AppImages.playerOfTheMatch,
                      height: 25.h,
                      width: 25.w,
                    ),
                    horizontalSpace(10.h),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("playerOfTheMatch".tr,
                            style: globalTextStyle(
                                fontSize: maxWidth > 600 ? 10.sp : 12.sp,
                                color: AppColors.navyBlue)),
                        Text(
                            playerOfTheMatch == null
                                ? "notAvailable".tr
                                : playerOfTheMatch!,
                            style: globalTextStyle2(
                                fontSize: maxWidth > 600 ? 8.sp : 10.sp,
                                color: AppColors.navyBlue)),
                      ],
                    ),
                  ],
                ),
              ),
            ]),
          ));
    });
  }
}
