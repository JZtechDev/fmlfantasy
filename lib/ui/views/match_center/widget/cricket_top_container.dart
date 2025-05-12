import 'package:fmlfantasy/app/app_sizings.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/ui/helpers/replace_svg_with_png.dart';
import 'package:fmlfantasy/ui/views/match_center/controller/match_center_inner_controller.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class CricketTopContainer extends GetView<MatchCenterInner> {
  final String? homename;
  final String? awayname;
  final String? homeimageurl;
  final String? awayimageurl;
  final String? homeScore;
  final String? awayScore;
  final String? playerOfTheMatch;
  final String? leagueName;
  final String? time;
  final String? homeOvers;
  final String? awayOvers;

  const CricketTopContainer(
    this.homename,
    this.awayname,
    this.homeimageurl,
    this.awayimageurl,
    this.homeScore,
    this.awayScore,
    this.playerOfTheMatch,
    this.leagueName,
    this.time,
    this.homeOvers,
    this.awayOvers, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      double maxWidth = constraints.maxWidth;
      return Container(
        decoration: const BoxDecoration(
          color: Color.fromRGBO(18, 96, 85, 1),
        ),
        child: Padding(
          padding:
              EdgeInsets.only(left: 10.w, right: 10.w, top: 10.h, bottom: 10.h),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      width: Get.width * 0.45,
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/new_images/cricket_ball.png',
                            height: 18,
                            width: 18,
                          ),
                          horizontalSpace(10.w),
                          Text(
                            maxLines: 2,
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.ellipsis,
                            leagueName.toString(),
                            style: globalTextStyle(
                                fontSize:
                                    AppSizing.isMobile(context) ? 12.sp : 10.sp,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      )),
                  Row(
                    children: [
                      Image.asset('assets/new_images/calender.png',
                          height: 15.h, width: 15.w),
                      horizontalSpace(10.w),
                      Text(
                          time != null
                              ? DateFormat('d MMM hh:mm a')
                                  .format(DateTime.parse(time ?? '').toLocal())
                              : '',
                          style: globalTextStyle2(
                              fontSize: maxWidth > 600 ? 8.sp : 12.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.white),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis),
                    ],
                  )
                ],
              ),
              verticalSpace(20.h),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.customWhite,
                        borderRadius: BorderRadius.circular(5.r),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 10, right: 10, top: 10, bottom: 10),
                            child: Row(
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
                                                replaceSvgWithPng(
                                                    homeimageurl!),
                                                height: 45.h,
                                                width: 45.w,
                                              )
                                            : SvgPicture.network(
                                                homeimageurl!,
                                                height: 30.h,
                                                width: 30.w,
                                              ),
                                horizontalSpace(10.w),
                                Container(
                                  width: Get.width * 0.22,
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 12),
                                  decoration: BoxDecoration(
                                    color: AppColors.secondary,
                                    borderRadius: BorderRadius.circular(5.r),
                                  ),
                                  child: Column(
                                    children: [
                                      Text(homeScore == null ? '' : homeScore!,
                                          style: globalTextStyle(
                                              color: AppColors.darkGreen,
                                              fontWeight: FontWeight.w700,
                                              fontSize:
                                                  AppSizing.isMobile(context)
                                                      ? 14.sp
                                                      : 10.sp)),
                                      Text(
                                          homeOvers == null
                                              ? ''
                                              : "${homeOvers!.split('.')[0]} Overs",
                                          style: globalTextStyle(
                                              color: AppColors.darkGreen,
                                              fontSize:
                                                  AppSizing.isMobile(context)
                                                      ? 12.sp
                                                      : 10.sp)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 15),
                            decoration: BoxDecoration(
                                color: AppColors.backgroud,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(5.w),
                                  bottomRight: Radius.circular(5.w),
                                )),
                            child: Text(homename == null ? '-' : homename!,
                                style: globalTextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: AppSizing.isMobile(context)
                                        ? 10.sp
                                        : 8.sp)),
                          )
                        ],
                      ),
                    ),
                  ),
                  horizontalSpace(5.w),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.customWhite,
                        borderRadius: BorderRadius.circular(5.r),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 10, right: 10, top: 10, bottom: 10),
                            child: Row(
                              children: [
                                awayimageurl == null
                                    ? const SizedBox(
                                        height: 50,
                                        width: 100,
                                      )
                                    : homeimageurl!.endsWith('.png')
                                        ? Image.network(
                                            awayimageurl!,
                                            height: 45.h,
                                            width: 45.w,
                                          )
                                        : controller.sportsCode == 'CR'
                                            ? Image.network(
                                                replaceSvgWithPng(
                                                    awayimageurl!),
                                                height: 45.h,
                                                width: 45.w,
                                              )
                                            : SvgPicture.network(
                                                awayimageurl!,
                                                height: 30.h,
                                                width: 30.w,
                                              ),
                                horizontalSpace(10.w),
                                Container(
                                  width: Get.width * 0.22,
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 12),
                                  decoration: BoxDecoration(
                                    color: AppColors.secondary,
                                    borderRadius: BorderRadius.circular(5.r),
                                  ),
                                  child: Column(
                                    children: [
                                      Text(awayScore == null ? '' : awayScore!,
                                          style: globalTextStyle(
                                              color: AppColors.darkGreen,
                                              fontWeight: FontWeight.w700,
                                              fontSize:
                                                  AppSizing.isMobile(context)
                                                      ? 14.sp
                                                      : 10.sp)),
                                      Text(
                                          awayOvers == null
                                              ? ''
                                              : "${awayOvers!.split('.')[0]} Overs",
                                          style: globalTextStyle(
                                              color: AppColors.darkGreen,
                                              fontSize:
                                                  AppSizing.isMobile(context)
                                                      ? 12.sp
                                                      : 10.sp)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 15),
                            decoration: BoxDecoration(
                                color: AppColors.backgroud,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(5.w),
                                  bottomRight: Radius.circular(5.w),
                                )),
                            child: Text(awayname == null ? '-' : awayname!,
                                style: globalTextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: AppSizing.isMobile(context)
                                        ? 10.sp
                                        : 8.sp)),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
