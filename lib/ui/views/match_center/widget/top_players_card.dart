import 'package:fmlfantasy/app/app_images/app_images.dart';
import 'package:fmlfantasy/app/app_sizings.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/model/match_center_inner_model.dart';
import 'package:fmlfantasy/ui/helpers/replace_svg_with_png.dart';
import 'package:fmlfantasy/ui/views/match_center/controller/match_center_inner_controller.dart';
import 'package:fmlfantasy/ui/views/match_center/widget/top_playertab.dart';
import 'package:flutter_svg/svg.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class TopPlayersCard extends GetView<MatchCenterInner> {
  final PlayersBreakDown topPlayers;
  final int indexs;
  const TopPlayersCard(
      {super.key, required this.topPlayers, required this.indexs});

  @override
  Widget build(BuildContext context) {
    Get.put(MatchCenterInner());
    return LayoutBuilder(builder: (context, constraints) {
      double maxWidth = constraints.maxWidth;
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    alignment: Alignment.center,
                    //height: 55.h,
                    width: maxWidth > 350 ? 40.w : 60.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.r),
                        color: AppColors.navyBlue),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/icons/publictournament.svg',
                          // ignore: deprecated_member_use
                          color: AppColors.white,
                          height: 16.h,
                          width: 16.w,
                        ),
                        verticalSpace(5.h),
                        Text(
                          topPlayers.rank!.toString().padLeft(2, '0'),
                          style: globalTextStyle(
                            color: AppColors.white,
                            fontSize: maxWidth > 350 ? 12.sp : 14.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                  ),
                  verticalSpace(2.h),
                  Container(
                    alignment: Alignment.center,
                    height: 35.h,
                    width: maxWidth > 350 ? 40.w : 60.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.r),
                      color: AppColors.primary,
                    ),
                    child: Text(
                      topPlayers.fantasyPoints!.toStringAsFixed(0),
                      style: globalTextStyle(
                        color: AppColors.white,
                        fontSize: maxWidth > 350 ? 12.sp : 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
              horizontalSpace(5.w),
              Container(
                height: 90.h,
                width: maxWidth > 350 ? 120.w : 147.w,
                decoration: BoxDecoration(
                  color: AppColors.white, // Change color if needed
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
                            ? topPlayers.imageUrl == null
                                ? Stack(
                                    clipBehavior: Clip.hardEdge,
                                    alignment: Alignment.center,
                                    children: [
                                      topPlayers.jerseyImage == null
                                          ? Image.asset(
                                              excludeFromSemantics: true,
                                              isAntiAlias: true,
                                              AppImages.userPlaceHolder,
                                            )
                                          : topPlayers.jerseyImage!
                                                  .endsWith('svg')
                                              ? SvgPicture.network(
                                                  topPlayers.jerseyImage!,
                                                )
                                              : Image.network(
                                                  topPlayers.jerseyImage!,
                                                ),
                                      topPlayers.jerseyImage == null
                                          ? const SizedBox()
                                          : Positioned(
                                              top: 20.h,
                                              child: Container(
                                                padding: EdgeInsets.only(
                                                  left: 2.w,
                                                  right: 2.w,
                                                  top: 1.h,
                                                  bottom: 1.h,
                                                ),
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                    color: AppColors.white
                                                        .withOpacity(0.9),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            2.r)),
                                                child: Text(
                                                  textAlign: TextAlign.center,
                                                  topPlayers.name!
                                                      .split(' ')
                                                      .last
                                                      .split(' ')
                                                      .last,
                                                  style: globalTextStyle(
                                                      fontSize: 8.sp,
                                                      color: AppColors.dark),
                                                ),
                                              ),
                                            ),
                                      topPlayers.jerseyImage == null
                                          ? const SizedBox()
                                          : Align(
                                              alignment: Alignment.center,
                                              child: Container(
                                                height: 30.h,
                                                width: 30.w,
                                                padding: const EdgeInsets.only(
                                                  top: 5,
                                                  right: 5,
                                                  left: 5,
                                                  bottom: 5,
                                                ),
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                    color: AppColors.white
                                                        .withOpacity(0.9),
                                                    shape: BoxShape.circle),
                                                child: Text(
                                                  textAlign: TextAlign.center,
                                                  topPlayers.fantasyNumnber ??
                                                      '-',
                                                  style: globalTextStyle(
                                                      fontSize: 10.sp,
                                                      color: AppColors.dark),
                                                ),
                                              ),
                                            ),
                                    ],
                                  )
                                : topPlayers.jerseyImage == null
                                    ? Image.asset(
                                        excludeFromSemantics: true,
                                        isAntiAlias: true,
                                        AppImages.userPlaceHolder,
                                      )
                                    : topPlayers.imageUrl!.endsWith('svg')
                                        ? SvgPicture.network(
                                            topPlayers.imageUrl!,
                                          )
                                        : Image.network(
                                            topPlayers.imageUrl!,
                                          )
                            : topPlayers.imageUrl == null
                                ? Image.asset(
                                    excludeFromSemantics: true,
                                    isAntiAlias: true,
                                    AppImages.userPlaceHolder,
                                  )
                                : topPlayers.imageUrl!.endsWith('svg')
                                    ? controller.sportsCode == 'CR'
                                        ? Image.network(
                                            replaceSvgWithPng(
                                                topPlayers.imageUrl!),
                                          )
                                        : SvgPicture.network(
                                            topPlayers.imageUrl!,
                                          )
                                    : Image.network(
                                        topPlayers.imageUrl!,
                                      ),
                      ),
                    ]),
              ),
            ],
          ),
          verticalSpace(5.h),
          Text(
            topPlayers.name!,
            style: globalTextStyle(
                fontSize: AppSizing.isMobile(context) ? 12.sp : 10.sp,
                fontWeight: FontWeight.w600),
          ),
          Text(
            topPlayers.position!,
            style: globalTextStyle2(
                fontSize: AppSizing.isMobile(context) ? 10.sp : 8.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.textGray),
          ),
          verticalSpace(10.h),
          ToggleCarouselSliderContainer(index: indexs),
          Obx(() => Column(
                children: [
                  verticalSpace(5.h),
                  controller.isStatsList[indexs].value == true
                      ? SizedBox(
                          width: 210.w,
                          height: 140.h,
                          child: Wrap(
                            alignment: WrapAlignment.start,
                            spacing: 5.w,
                            runSpacing: 5.h,
                            children: topPlayers.statsBreakDown
                                .take(4)
                                .map((statics) {
                              return Container(
                                padding: const EdgeInsets.all(12),
                                width: maxWidth > 350 ? 82.w : 102.w,
                                // height: 67.h,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5.r),
                                ),
                                child: Column(
                                  children: [
                                    Text(
                                      statics.value!
                                          .toStringAsFixed(0)
                                          .padLeft(2, '0'),
                                      style: globalTextStyle(
                                        fontSize:
                                            maxWidth > 350 ? 16.sp : 23.sp,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.primary,
                                      ),
                                    ),
                                    Text(
                                      statics.name!,
                                      textAlign: TextAlign.center,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: globalTextStyle2(
                                        color: AppColors.navyBlue,
                                        fontSize: maxWidth > 350 ? 8.sp : 10.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }).toList(),
                          ),
                        )
                      : topPlayers.fantasyPointsBreakDown.isEmpty
                          ? Text(
                              'notAvailable'.tr,
                              style: globalTextStyle2(
                                color: AppColors.navyBlue,
                                fontSize: 12.sp,
                              ),
                            )
                          : Container(
                              width: maxWidth > 350 ? 170.w : 210.w,
                              height: 135.h,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.r),
                                  color: AppColors.white),
                              child: SfCircularChart(
                                  margin: REdgeInsets.only(
                                      top: 10.h, left: 5.w, right: 10.w),
                                  //backgroundColor: AppColors.white,
                                  legend: Legend(
                                    legendItemBuilder: (String name,
                                        dynamic series,
                                        dynamic point,
                                        int index) {
                                      final FantasyPointsBreakDown data =
                                          topPlayers
                                              .fantasyPointsBreakDown[index];
                                      List<Color> colors = [
                                        const Color.fromRGBO(0, 166, 251, 1),
                                        const Color.fromRGBO(5, 130, 202, 1),
                                        const Color.fromRGBO(0, 100, 148, 1),
                                        const Color.fromRGBO(0, 53, 84, 1),
                                        const Color.fromRGBO(5, 25, 35, 1),
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
                                            width: maxWidth > 350 ? 7.w : 10.w,
                                            height: maxWidth > 350 ? 7.h : 10.h,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: itemColor,
                                            ),
                                          ),
                                          horizontalSpace(5.w),
                                          Text(
                                            data.name
                                                .toString()
                                                .split(' ')
                                                .join('\n'),
                                            style: globalTextStyle2(
                                              fontSize:
                                                  maxWidth > 350 ? 7.sp : 10.sp,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ), // Display x value
                                        ],
                                      );
                                    },
                                    itemPadding: 2,
                                    padding: 5,
                                    alignment: ChartAlignment.center,
                                    isVisible: true,
                                    position: LegendPosition.right,
                                    //overflowMode: LegendItemOverflowMode.scroll,
                                    isResponsive: false,
                                  ),
                                  tooltipBehavior: TooltipBehavior(
                                    enable: true,
                                    canShowMarker: false,
                                    color: AppColors.navyBlue,
                                  ),
                                  centerX: '50%',
                                  centerY: '50%',
                                  series: <CircularSeries>[
                                    DoughnutSeries<FantasyPointsBreakDown,
                                        String>(
                                      dataSource: topPlayers
                                          .fantasyPointsBreakDown
                                          .take(4)
                                          .toList(),
                                      pointColorMapper:
                                          (FantasyPointsBreakDown data,
                                              int index) {
                                        List<Color> colors = [
                                          const Color.fromRGBO(0, 166, 251, 1),
                                          const Color.fromRGBO(5, 130, 202, 1),
                                          const Color.fromRGBO(0, 100, 148, 1),
                                          const Color.fromRGBO(0, 53, 84, 1),
                                          const Color.fromRGBO(5, 25, 35, 1),
                                          // Add more colors if needed
                                        ];
                                        // Return the color based on the index
                                        return colors[index % colors.length];
                                      },
                                      xValueMapper:
                                          (FantasyPointsBreakDown data, _) =>
                                              data.name,
                                      yValueMapper:
                                          (FantasyPointsBreakDown data, _) =>
                                              data.value,
                                      strokeWidth: 1,
                                      innerRadius: '70%',
                                      radius: '80%',
                                      legendIconType: LegendIconType.circle,
                                    ),
                                  ],
                                  annotations: <CircularChartAnnotation>[
                                    CircularChartAnnotation(
                                        radius: '0%',
                                        widget: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                                topPlayers.fantasyPoints!
                                                    .toStringAsFixed(0)
                                                    .padLeft(2, '0'),
                                                style: globalTextStyle(
                                                  fontSize: maxWidth > 350
                                                      ? 10.sp
                                                      : 12.sp,
                                                )),
                                            Text('points'.tr,
                                                style: globalTextStyle(
                                                  fontSize: maxWidth > 350
                                                      ? 10.sp
                                                      : 12.sp,
                                                )),
                                          ],
                                        ))
                                  ]),
                            ),
                ],
              )),
        ],
      );
    });
  }
}
