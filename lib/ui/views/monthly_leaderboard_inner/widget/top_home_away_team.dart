import 'package:fmlfantasy/app/app_colors/app_colors.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/ui/helpers/replace_svg_with_png.dart';
import 'package:fmlfantasy/ui/views/dashboard/dashboard_view.dart';
import 'package:fmlfantasy/ui/views/monthly_leaderboard_inner/monthly_inner_leaderboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class TopHomeAwayTeam extends GetView<MonthlyInnerLeaderboard> {
  const TopHomeAwayTeam(
    this.homeImageUrl,
    this.home,
    this.awayImageUrl,
    this.away,
    this.homeScore,
    this.awayScore,
    this.sportsType, {
    super.key,
  });

  final String homeImageUrl;
  final String home;
  final String awayImageUrl;
  final String away;
  final String homeScore;
  final String awayScore;
  final String sportsType;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isPortrait =
            MediaQuery.of(context).orientation == Orientation.portrait;
        final imageSize = constraints.maxWidth * 0.1;
        final fontSize = isPortrait ? 12.sp : 10.sp;
        final spacing = constraints.maxWidth * 0.02;

        return Column(
          children: [
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(
                horizontal: 20.w,
              ),
              padding: EdgeInsets.only(bottom: 10.h, top: 10.h),
              decoration: BoxDecoration(
                color: AppColors.customWhite,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.r),
                  topRight: Radius.circular(10.r),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 10.h,
                        horizontal: 10.w,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(width: spacing),
                          Container(
                            constraints: BoxConstraints(
                              maxHeight: imageSize,
                              maxWidth: imageSize,
                              minHeight: imageSize * 0.8,
                              minWidth: imageSize * 0.8,
                            ),
                            child: homeImageUrl.isEmpty
                                ? const SizedBox()
                                : homeImageUrl.endsWith('.png')
                                    ? Image.network(
                                        homeImageUrl,
                                        height: imageSize,
                                        width: imageSize,
                                        fit: BoxFit.contain,
                                      )
                                    : sportsType == 'CR'
                                        ? Image.network(
                                            replaceSvgWithPng(homeImageUrl),
                                            height: imageSize,
                                            width: imageSize,
                                            fit: BoxFit.contain,
                                          )
                                        : SvgPicture.network(
                                            homeImageUrl,
                                            height: imageSize,
                                            width: imageSize,
                                            fit: BoxFit.contain,
                                          ),
                          ),
                          SizedBox(width: spacing),
                          Flexible(
                            child: Text(
                              home.toString(),
                              style: globalTextStyle(
                                fontSize: fontSize,
                                fontWeight: FontWeight.w700,
                                color: AppColors.primaryVeryDark,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.start,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          constraints: BoxConstraints(
                            maxHeight: imageSize,
                            maxWidth: imageSize,
                            minHeight: imageSize * 0.8,
                            minWidth: imageSize * 0.8,
                          ),
                          child: awayImageUrl.isEmpty
                              ? const SizedBox()
                              : awayImageUrl.endsWith('.png')
                                  ? Image.network(
                                      awayImageUrl,
                                      height: imageSize,
                                      width: imageSize,
                                      fit: BoxFit.contain,
                                    )
                                  : sportsType == 'CR'
                                      ? Image.network(
                                          replaceSvgWithPng(awayImageUrl),
                                          height: imageSize,
                                          width: imageSize,
                                          fit: BoxFit.contain,
                                        )
                                      : SvgPicture.network(
                                          awayImageUrl,
                                          height: imageSize,
                                          width: imageSize,
                                          fit: BoxFit.contain,
                                        ),
                        ),
                        SizedBox(width: spacing),
                        Flexible(
                          child: Text(
                            away.toString(),
                            style: globalTextStyle(
                              fontSize: fontSize,
                              fontWeight: FontWeight.w700,
                              color: AppColors.primaryVeryDark,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.start,
                          ),
                        ),
                        SizedBox(width: spacing),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: Get.width * 0.6,
              child: ClipPath(
                clipper: TrapezoidClipper(),
                child: Container(
                  width: Get.width,
                  height: 20.h,
                  color: AppColors.secondary,
                  child: Center(
                    child: Text(
                      'Top Players',
                      style: globalTextStyle(
                          color: AppColors.primaryVeryDark,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
