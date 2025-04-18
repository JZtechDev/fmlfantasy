import 'dart:developer';

import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/model/match_center_inner_model.dart';
import 'package:fmlfantasy/ui/views/player_stats_view/controller/players_stats_controller.dart';
import 'package:fmlfantasy/ui/views/player_stats_view/models/players_info_model.dart';
import 'package:collection/collection.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class PlayersFantaspoints extends StatelessWidget {
  const PlayersFantaspoints({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(PlayersStatsController());
    return GetBuilder<PlayersStatsController>(builder: (controller) {
      return Obx(
        () {
          final aggregatedData = groupBy(
            controller.playersRecentStats,
            (PlayersRecentStats player) {
              if (player.playersBreakDown == null ||
                  player.playersBreakDown!.isEmpty) {
                return [];
              }
              final fantasyPointsBreakDown =
                  player.playersBreakDown?.first.fantasyPointsBreakDown;
              if (fantasyPointsBreakDown != null &&
                  fantasyPointsBreakDown.isNotEmpty) {
                return fantasyPointsBreakDown.map((e) => e.name).toList();
              } else {
                return [];
              }
            },
          ).entries.toList();

          log(aggregatedData.toString());

          final summedData = <String, double>{};

          for (var entry in aggregatedData) {
            if (entry.key.isEmpty) {
              summedData[""] = 0.0;
            }
            for (var statName in entry.key) {
              final totalPoints = entry.value.map((player) {
                final fantasyPointsBreakDown =
                    player.playersBreakDown?.first.fantasyPointsBreakDown;
                if (fantasyPointsBreakDown != null &&
                    fantasyPointsBreakDown.isNotEmpty) {
                  final stat = fantasyPointsBreakDown.firstWhere(
                    (stat) => stat.name == statName,
                    orElse: () => FantasyPointsBreakDown(
                        name: statName, value: 0.0, displayOrder: 0),
                  );
                  return stat.value ?? 0.0;
                }
                return 0.0;
              }).reduce((a, b) => a + b);

              if (summedData.containsKey(statName)) {
                summedData[statName] = summedData[statName]! + totalPoints;
              } else {
                summedData[statName] = totalPoints;
              }
            }
          }

          final summedDataList = summedData.entries.toList();

          final total = summedData.values.reduce((a, b) => a + b);
          log(summedDataList.toString());

          return Column(
            children: [
              summedDataList.isNotEmpty
                  ? SfCircularChart(
                      title: ChartTitle(
                        text: 'Fantasy Points Chart',
                        textStyle: globalTextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      tooltipBehavior: TooltipBehavior(
                        enable: true,
                        builder:
                            (data, point, series, pointIndex, seriesIndex) {
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
                            ),
                          );
                        },
                      ),
                      legend: Legend(
                        toggleSeriesVisibility: false,
                        orientation: LegendItemOrientation.vertical,
                        overflowMode: LegendItemOverflowMode.wrap,
                        legendItemBuilder: (String name, dynamic series,
                            dynamic point, int index) {
                          List<Color> colors = [
                            const Color.fromRGBO(0, 166, 251, 1),
                            const Color.fromRGBO(5, 130, 202, 1),
                            const Color.fromRGBO(0, 100, 148, 1),
                            const Color.fromRGBO(0, 53, 84, 1),
                            const Color.fromRGBO(5, 25, 35, 1),
                          ];
                          Color itemColor = colors[index % colors.length];

                          return summedDataList[index].key == ''
                              ? Container()
                              : Row(
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
                                          summedDataList[index].key,
                                          style: globalTextStyle(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        horizontalSpace(5.w),
                                        Text(
                                          summedDataList[index]
                                              .value
                                              .toStringAsFixed(0),
                                          style: globalTextStyle(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        horizontalSpace(2.w),
                                        Text(
                                          '(Fantasy Points)',
                                          style: globalTextStyle(
                                            fontSize: 6.sp,
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
                        DoughnutSeries<MapEntry<String, double>, String>(
                          dataSource: summedDataList,
                          pointColorMapper:
                              (MapEntry<String, double> data, int index) {
                            List<Color> colors = [
                              const Color.fromRGBO(0, 166, 251, 1),
                              const Color.fromRGBO(5, 130, 202, 1),
                              const Color.fromRGBO(0, 100, 148, 1),
                              const Color.fromRGBO(0, 53, 84, 1),
                              const Color.fromRGBO(5, 25, 35, 1),
                            ];
                            return colors[index % colors.length];
                          },
                          xValueMapper: (MapEntry<String, double> data, _) =>
                              data.key,
                          yValueMapper: (MapEntry<String, double> data, _) =>
                              data.value,
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
                                total.toStringAsFixed(0),
                                style: globalTextStyle(
                                  fontSize: 26.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                'Points',
                                style: globalTextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.textGray,
                                ),
                              ),
                            ],
                          ),
                          radius: '0%',
                        ),
                      ],
                    )
                  : const Text(
                      'Fantasy Points Chart',
                    )
            ],
          );
        },
      );
    });
  }
}
