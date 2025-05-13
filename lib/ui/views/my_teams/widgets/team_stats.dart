import 'dart:math';
import 'package:fmlfantasy/app/app%20routes/app_routes.dart';
import 'package:fmlfantasy/app/app_colors/app_colors.dart';
import 'package:fmlfantasy/app/app_sizings.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/model/my_teams_model.dart';
import 'package:fmlfantasy/model/my_teams_players_model.dart';
import 'package:fmlfantasy/ui/helpers/commons.dart';
import 'package:fmlfantasy/ui/views/monthly_leaderboard/monthly_leaderboard.dart';
import 'package:fmlfantasy/ui/views/my_teams/controller/my_teams_controller.dart';
import 'package:fmlfantasy/ui/views/my_teams/widgets/statistics_players_grid.dart';
import 'package:fmlfantasy/ui/views/my_teams/widgets/team_preview.dart';
import 'package:fmlfantasy/ui/widgets/primary_button.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class TeamStatistics extends GetView<MyTeamsController> {
  final MyTeamsModel myTeams;
  const TeamStatistics({super.key, required this.myTeams});

  @override
  Widget build(BuildContext context) {
    Get.put(MyTeamsController());
    return Container(
      margin: EdgeInsets.only(left: 10.w, right: 10.w),
      clipBehavior: Clip.hardEdge,
      padding: EdgeInsets.only(top: 25.h),
      decoration: BoxDecoration(
          color: AppColors.white, borderRadius: BorderRadius.circular(5)),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Transform.rotate(
              origin: const Offset(280, -210), // 180, -170
              angle: pi / 4.5, // Rotate 60 degrees clockwise
              child: Container(
                height: 460.0, // Adjust height of the bar
                width: 75.0, // Adjust width of the bar
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  gradient: LinearGradient(
                    colors: [
                      AppColors.primary.withValues(alpha: 0.25),
                      AppColors.primary.withValues(alpha: 0.2).withValues(
                          alpha: 0.0), // Adjust opacity or color as needed
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Transform.rotate(
              origin: const Offset(70, -45),
              angle: pi / 4.5,
              child: Container(
                height: 260.0,
                width: 75.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  gradient: LinearGradient(
                    colors: [
                      AppColors.primary.withValues(alpha: 0.20),
                      AppColors.primary
                          .withValues(alpha: 0.2)
                          .withValues(alpha: 0.0),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Transform.rotate(
              origin: const Offset(100, -70),
              angle: pi / 4.5,
              child: Container(
                height: 450.0,
                width: 80.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  gradient: LinearGradient(
                    colors: [
                      AppColors.primary.withValues(alpha: 0.1),
                      AppColors.primary
                          .withValues(alpha: 0.1)
                          .withValues(alpha: 0.0),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
            ),
          ),
          Column(
            children: [
              Obx(
                () => Padding(
                  padding: EdgeInsets.only(left: 10.w, right: 10.w),
                  child: Center(
                    child: Text(
                      controller.team.value,
                      textAlign: TextAlign.center,
                      style: globalTextStyle(
                          fontSize: 24.sp, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
              verticalSpace(2),
              Center(
                child: Text(
                  "pointsDistribution".tr,
                  style: globalTextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textGray),
                ),
              ),
              verticalSpace(10.h),
              const PlayerGridView(),
              myTeams.matchData!.status == 'not_started'
                  ? Container()
                  : PrimaryButton(
                      backgroundColor: AppColors.navyBlue,
                      buttonText: 'View Top Performers',
                      onPressed: () {
                        controller.showTopPerfomers(Get.context!);
                      },
                      isEnabled: true),
              verticalSpace(10.h),
              Obx(
                () => SfCircularChart(
                  tooltipBehavior: TooltipBehavior(
                    enable: true,
                    builder: (data, point, series, pointIndex, seriesIndex) {
                      return Container(
                          width: 150.w,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.r),
                            color: AppColors.navyBlue,
                          ),
                          child: Row(
                            children: [
                              Text("${point.x}",
                                  style: globalTextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.white,
                                  )),
                              horizontalSpace(5.w),
                              Text("${point.y!.toStringAsFixed(0)}k",
                                  style: globalTextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.white,
                                  )),
                            ],
                          ));
                    },
                  ),
                  legend: Legend(
                    toggleSeriesVisibility: false,
                    orientation: LegendItemOrientation.vertical,
                    overflowMode: LegendItemOverflowMode.wrap,
                    legendItemBuilder: (String name, dynamic series,
                        dynamic point, int index) {
                      final groupedData = groupBy(
                        controller.myTeamPlayers,
                        (MyTeamPlayersModel player) => player.position,
                      ).entries.toList();
                      final data = groupedData[index].value;
                      double totalPoints = data
                          .map((e) => e.investment)
                          .reduce((a, b) => a! + b!)!;
                      List<Color> colors = [
                        const Color.fromRGBO(0, 166, 251, 1),
                        const Color.fromRGBO(5, 130, 202, 1),
                        const Color.fromRGBO(0, 100, 148, 1),
                        const Color.fromRGBO(0, 53, 84, 1),
                        const Color.fromRGBO(5, 25, 35, 1),
                      ];
                      Color itemColor = colors[index % colors.length];

                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 12,
                            height: 12,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: itemColor,
                            ),
                          ),
                          horizontalSpace(5),
                          Row(
                            children: [
                              Text(
                                groupedData[index].value.first.position ?? '',
                                style: globalTextStyle(
                                  fontSize: AppSizing.isMobile(context)
                                      ? 12.sp
                                      : 10.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              horizontalSpace(5.w),
                              Text(
                                "${totalPoints.toStringAsFixed(0)}k",
                                style: globalTextStyle(
                                  fontSize: AppSizing.isMobile(context)
                                      ? 12.sp
                                      : 10.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          horizontalSpace(10.h)
                        ],
                      );
                    },
                    alignment: ChartAlignment.center,
                    isVisible: true,
                    position: LegendPosition.bottom,
                    isResponsive: true,
                    shouldAlwaysShowScrollbar: false,
                  ),
                  centerX: '50%',
                  centerY: '50%',
                  series: <CircularSeries>[
                    DoughnutSeries<MapEntry<String, List<MyTeamPlayersModel>>,
                        String>(
                      dataSource: groupBy(
                        controller.myTeamPlayers,
                        (MyTeamPlayersModel player) => player.position ?? '',
                      ).entries.toList(),
                      pointColorMapper:
                          (MapEntry<String, List<MyTeamPlayersModel>> data,
                              int index) {
                        List<Color> colors = [
                          const Color.fromRGBO(0, 166, 251, 1),
                          const Color.fromRGBO(5, 130, 202, 1),
                          const Color.fromRGBO(0, 100, 148, 1),
                          const Color.fromRGBO(0, 53, 84, 1),
                          const Color.fromRGBO(5, 25, 35, 1),
                        ];
                        return colors[index % colors.length];
                      },
                      xValueMapper:
                          (MapEntry<String, List<MyTeamPlayersModel>> data,
                                  _) =>
                              data.key,
                      yValueMapper:
                          (MapEntry<String, List<MyTeamPlayersModel>> data,
                                  _) =>
                              data.value
                                  .map((e) => e.investment)
                                  .reduce((a, b) => a! + b!),
                      strokeWidth: 1,
                      innerRadius: '70%',
                      radius: '80%',
                    ),
                  ],
                  annotations: <CircularChartAnnotation>[
                    CircularChartAnnotation(
                      widget: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${controller.calculateTotalPoitns().toStringAsFixed(0)}%",
                            style: globalTextStyle(
                              fontSize:
                                  AppSizing.isMobile(context) ? 26.sp : 19.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            'salaryUsed'.tr,
                            style: globalTextStyle(
                                fontSize:
                                    AppSizing.isMobile(context) ? 12.sp : 8.sp,
                                fontWeight: FontWeight.w700,
                                color: AppColors.textGray),
                          ),
                        ],
                      ),
                      radius: '0%', // Center of the doughnut
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                        child: GestureDetector(
                      onTap: () {
                        //controller.teamId = teamId;
                        controller.showCopyModal(context);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: AppColors.grey),
                        child: Text(
                          'copy'.tr,
                          style: globalTextStyle2(
                              color: AppColors.dark,
                              fontSize:
                                  AppSizing.isMobile(context) ? 12.sp : 10.sp,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    )),
                    horizontalSpace(10),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Get.toNamed(AppRoutes.selectPlayers, arguments: {
                            'matchID': controller.matchCode.value,
                            'sport': controller.selectedSport.value,
                            'tournamentId': controller.tournamentId.value,
                            'teamId': controller.teamId.value,
                            'players': controller.myTeamPlayers,
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: AppColors.navyBlue),
                          child: Text(
                            'edit'.tr,
                            style: globalTextStyle2(
                                color: AppColors.white,
                                fontSize:
                                    AppSizing.isMobile(context) ? 12.sp : 10.sp,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              PrimaryButton(
                buttonText: 'preview'.tr,
                onPressed: () {
                  Get.to(() => const TeamPreview());
                },
                isEnabled: true,
              ),
              verticalSpace(5.h),
              myTeams.matchData!.status == 'not_started'
                  ? Container()
                  : Row(
                      children: [
                        Expanded(
                          child: PrimaryButton(
                            buttonText: 'Leaderboard'.tr,
                            onPressed: () {
                              Get.to(() => const MonthlyLeaderboard(),
                                  arguments: {'data': myTeams});
                            },
                            isEnabled: true,
                          ),
                        ),
                        Expanded(
                          child: PrimaryButton(
                            backgroundColor: AppColors.secondary,
                            buttonText: 'Match Center'.tr,
                            onPressed: () {
                              Get.toNamed(AppRoutes.matchCenterInner,
                                  arguments: {
                                    'sports': controller.selectedSport.value,
                                    'matchKey': controller.matchCode.value,
                                    'SportsName':
                                        controller.selectedSport.value,
                                  });
                            },
                            isEnabled: true,
                          ),
                        )
                      ],
                    )
            ],
          )
        ],
      ),
    );
  }
}
