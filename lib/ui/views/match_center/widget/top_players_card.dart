import 'package:fmlfantasy/app/app_images/app_images.dart';
import 'package:fmlfantasy/app/app_sizings.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/model/match_center_inner_model.dart';
import 'package:fmlfantasy/new_model/match_center_inner_new.dart';
import 'package:fmlfantasy/ui/helpers/replace_svg_with_png.dart';
import 'package:fmlfantasy/ui/views/match_center/controller/match_center_inner_controller.dart';
import 'package:fmlfantasy/ui/views/match_center/widget/top_playertab.dart';
import 'package:flutter_svg/svg.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class TopPlayersCard extends GetView<MatchCenterInner> {
  final PlayerMatchStatistic topPlayers;
  final int indexs;
  const TopPlayersCard({
    super.key,
    required this.topPlayers,
    required this.indexs,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(MatchCenterInner());
    return LayoutBuilder(builder: (context, constraints) {
      double maxWidth = constraints.maxWidth;
      return Container(
        padding: const EdgeInsets.only(left: 30, right: 30),
        color: AppColors.backgroud,
        child: Container(
          padding: const EdgeInsets.only(left: 5, right: 5, top: 20),
          decoration: BoxDecoration(
            color: const Color.fromRGBO(44, 86, 80, 1),
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(color: AppColors.secondary, width: 1.w),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10.w, right: 30.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            alignment: Alignment.center,
                            height: 64.h,
                            width: 60.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              color: AppColors.primaryLight,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/new_images/Award.png',
                                  color: AppColors.white,
                                  height: 20.h,
                                  width: 20.w,
                                ),
                                verticalSpace(5.h),
                                Text(
                                  topPlayers.rank.toString().padLeft(2, '0'),
                                  style: globalTextStyle(
                                    color: AppColors.white,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          verticalSpace(10.h),
                          Container(
                            alignment: Alignment.center,
                            height: 60.h,
                            width: 60.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              color: AppColors.primaryLight,
                            ),
                            child: Text(
                              (topPlayers.fantasyPointsBreakdowns != null &&
                                      topPlayers
                                          .fantasyPointsBreakdowns.isNotEmpty &&
                                      indexs <
                                          topPlayers
                                              .fantasyPointsBreakdowns.length &&
                                      topPlayers.fantasyPointsBreakdowns[indexs]
                                              .fantasyPoints !=
                                          null)
                                  ? topPlayers.fantasyPointsBreakdowns[indexs]
                                      .fantasyPoints
                                      .toString()
                                  : '0',
                              style: globalTextStyle(
                                color: AppColors.white,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w700,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                    horizontalSpace(5.w),
                    Column(
                      children: [
                        Container(
                          height: 90.h,
                          width: maxWidth > 350 ? 120.w : 147.w,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(44, 86, 80, 1),
                            borderRadius: BorderRadius.circular(5.r),
                          ),
                          child: Stack(
                            alignment: Alignment.topLeft,
                            clipBehavior: Clip.none,
                            fit: StackFit.passthrough,
                            children: [
                              Positioned(
                                top: -10,
                                left: 0,
                                right: 0,
                                bottom: 0,
                                child: controller.sportsCode == 'FB'
                                    ? topPlayers.headshotImageUrl.isEmpty
                                        ? Stack(
                                            clipBehavior: Clip.hardEdge,
                                            alignment: Alignment.center,
                                            children: [
                                              Image.asset(
                                                excludeFromSemantics: true,
                                                isAntiAlias: true,
                                                AppImages.userPlaceHolder,
                                              ),
                                              topPlayers
                                                      .headshotImageUrl.isEmpty
                                                  ? const SizedBox()
                                                  : Positioned(
                                                      top: 20.h,
                                                      child: Container(
                                                        padding:
                                                            EdgeInsets.only(
                                                          left: 2.w,
                                                          right: 2.w,
                                                          top: 1.h,
                                                          bottom: 1.h,
                                                        ),
                                                        alignment:
                                                            Alignment.center,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: AppColors.white
                                                              .withValues(
                                                                  alpha: 0.9),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      2.r),
                                                        ),
                                                        child: Text(
                                                          topPlayers.name
                                                              .split(' ')
                                                              .last,
                                                          style:
                                                              globalTextStyle(
                                                            fontSize: 8.sp,
                                                            color:
                                                                AppColors.dark,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                              topPlayers
                                                      .headshotImageUrl.isEmpty
                                                  ? const SizedBox()
                                                  : Align(
                                                      alignment:
                                                          Alignment.center,
                                                      child: Container(
                                                        height: 30.h,
                                                        width: 30.w,
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                          top: 5,
                                                          right: 5,
                                                          left: 5,
                                                          bottom: 5,
                                                        ),
                                                        alignment:
                                                            Alignment.center,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: AppColors.white
                                                              .withValues(
                                                                  alpha: 0.9),
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                        child: Text(
                                                          topPlayers.name,
                                                          style:
                                                              globalTextStyle(
                                                            fontSize: 10.sp,
                                                            color:
                                                                AppColors.dark,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                            ],
                                          )
                                        : topPlayers.headshotImageUrl
                                                .endsWith('svg')
                                            ? SvgPicture.network(
                                                topPlayers.headshotImageUrl,
                                              )
                                            : Image.network(
                                                topPlayers.headshotImageUrl,
                                              )
                                    : topPlayers.headshotImageUrl.isEmpty
                                        ? Image.asset(
                                            excludeFromSemantics: true,
                                            isAntiAlias: true,
                                            AppImages.userPlaceHolder,
                                          )
                                        : topPlayers.headshotImageUrl
                                                .endsWith('svg')
                                            ? controller.sportsCode == 'CR'
                                                ? Image.network(
                                                    replaceSvgWithPng(topPlayers
                                                        .headshotImageUrl),
                                                  )
                                                : SvgPicture.network(
                                                    topPlayers.headshotImageUrl,
                                                  )
                                            : Image.network(
                                                topPlayers.headshotImageUrl,
                                              ),
                              ),
                            ],
                          ),
                        ),
                        verticalSpace(5.h),
                        Text(
                          topPlayers.name,
                          style: globalTextStyle(
                            fontSize:
                                AppSizing.isMobile(context) ? 14.sp : 10.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          topPlayers.role,
                          style: globalTextStyle2(
                            fontSize:
                                AppSizing.isMobile(context) ? 12.sp : 8.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              verticalSpace(10.h),
              ToggleCarouselSliderContainer(index: indexs),
              Obx(() => Column(
                    children: [
                      verticalSpace(5.h),
                      controller.isStatsList[indexs].value == true
                          ? Wrap(
                              alignment: WrapAlignment.start,
                              spacing: 5.w,
                              runSpacing: 5.h,
                              children: [
                                ...topPlayers.statsBreakdowns.map((stat) {
                                  return _buildStatContainer(
                                    stat.statName,
                                    stat.statValue.toStringAsFixed(1),
                                    maxWidth,
                                  );
                                })
                              ],
                            )
                          : topPlayers.fantasyPointsBreakdowns.isEmpty
                              ? Text(
                                  'notAvailable'.tr,
                                  style: globalTextStyle2(
                                    color: AppColors.navyBlue,
                                    fontSize: 12.sp,
                                  ),
                                )
                              : Container(
                                  clipBehavior: Clip.hardEdge,
                                  width: Get.width * 0.62,
                                  height: 135.h,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.r),
                                    color: AppColors.primaryLight,
                                  ),
                                  child: Stack(
                                    children: [
                                      Align(
                                        alignment: Alignment.bottomLeft,
                                        child: Container(
                                          clipBehavior: Clip.hardEdge,
                                          height: 135.h,
                                          width: Get.width * 0.3,
                                          decoration: BoxDecoration(
                                            color: AppColors.backgroud,
                                            borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(10.r),
                                              bottomRight:
                                                  Radius.circular(10.r),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SfCircularChart(
                                        margin: EdgeInsets.only(
                                          top: 10.h,
                                          left: 5.w,
                                          right: 10.w,
                                        ),
                                        legend: Legend(
                                          legendItemBuilder: (String name,
                                              dynamic series,
                                              dynamic point,
                                              int index) {
                                            final FantasyPointsBreakdown data =
                                                topPlayers
                                                        .fantasyPointsBreakdowns[
                                                    index];
                                            List<Color> colors = [
                                              const Color.fromRGBO(
                                                  102, 203, 61, 1),
                                              const Color.fromRGBO(
                                                  249, 207, 88, 1),
                                              const Color.fromRGBO(
                                                  0, 100, 148, 1),
                                              const Color.fromRGBO(
                                                  255, 255, 255, 1),
                                              const Color.fromRGBO(
                                                  230, 180, 125, 1),
                                            ];
                                            Color itemColor =
                                                colors[index % colors.length];
                                            return Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              mainAxisSize: MainAxisSize.min,
                                              verticalDirection:
                                                  VerticalDirection.down,
                                              children: [
                                                Container(
                                                  width: maxWidth > 350
                                                      ? 7.w
                                                      : 15.w,
                                                  height: maxWidth > 350
                                                      ? 7.h
                                                      : 15.h,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: itemColor,
                                                  ),
                                                ),
                                                horizontalSpace(5.w),
                                                SizedBox(
                                                  width: 70,
                                                  child: Text(
                                                    data.fantasyPointType,
                                                    style: globalTextStyle2(
                                                      fontSize: maxWidth > 350
                                                          ? 10.sp
                                                          : 10.sp,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            );
                                          },
                                          itemPadding: 10,
                                          padding: 5,
                                          alignment: ChartAlignment.center,
                                          isVisible: true,
                                          position: LegendPosition.left,
                                          isResponsive: false,
                                        ),
                                        tooltipBehavior: TooltipBehavior(
                                          enable: true,
                                          canShowMarker: false,
                                          color: AppColors.navyBlue,
                                        ),
                                        centerX: '67%',
                                        centerY: '47%',
                                        series: <CircularSeries>[
                                          DoughnutSeries<FantasyPointsBreakdown,
                                              String>(
                                            dataSource: topPlayers
                                                .fantasyPointsBreakdowns
                                                .take(4)
                                                .toList(),
                                            pointColorMapper:
                                                (FantasyPointsBreakdown data,
                                                    int index) {
                                              List<Color> colors = [
                                                const Color.fromRGBO(
                                                    102, 203, 61, 1),
                                                const Color.fromRGBO(
                                                    249, 207, 88, 1),
                                                const Color.fromRGBO(
                                                    0, 100, 148, 1),
                                                const Color.fromRGBO(
                                                    255, 255, 255, 1),
                                                const Color.fromRGBO(
                                                    0, 100, 148, 1),
                                              ];
                                              return colors[
                                                  index % colors.length];
                                            },
                                            xValueMapper:
                                                (FantasyPointsBreakdown data,
                                                        _) =>
                                                    data.fantasyPointType,
                                            yValueMapper:
                                                (FantasyPointsBreakdown data,
                                                        _) =>
                                                    data.fantasyPoints,
                                            strokeWidth: 1,
                                            innerRadius: '70%',
                                            radius: '70%',
                                            legendIconType:
                                                LegendIconType.circle,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                    ],
                  )),
            ],
          ),
        ),
      );
    });
  }

  Widget _buildStatContainer(String name, String value, double maxWidth) {
    return Container(
      padding: const EdgeInsets.all(12),
      width: Get.width * 0.3,
      decoration: BoxDecoration(
        color: AppColors.primaryLight,
        borderRadius: BorderRadius.circular(5.r),
      ),
      child: Column(
        children: [
          Text(
            value.padLeft(2, '0'),
            style: globalTextStyle(
              fontSize: maxWidth > 350 ? 20.sp : 24.sp,
              fontWeight: FontWeight.w700,
              color: AppColors.secondary,
            ),
          ),
          Text(
            name,
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: globalTextStyle2(
              color: AppColors.secondary,
              fontSize: maxWidth > 350 ? 12.sp : 14.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
