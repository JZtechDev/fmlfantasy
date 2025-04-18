import 'dart:developer';

import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/ui/views/player_stats_view/controller/players_stats_controller.dart';
import 'package:fmlfantasy/ui/views/player_stats_view/models/players_info_model.dart';
import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';

class PlayersStats extends StatelessWidget {
  const PlayersStats({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(PlayersStatsController());
    return GetBuilder<PlayersStatsController>(builder: (controller) {
      return Obx(() {
        final aggregatedData =
            groupBy(controller.playersRecentStats, (PlayersRecentStats player) {
          if (player.playersBreakDown == null ||
              player.playersBreakDown!.isEmpty) {
            return [];
          }
          return player.playersBreakDown!.first.statsBreakDown!
              .map((e) => e.name) // Collect all stat names
              .toList();
        }).entries.toList();

        final summedData = <String, double>{};
        for (var entry in aggregatedData) {
          for (var statName in entry.key) {
            if (summedData.containsKey(statName)) {
              final totalPoints = entry.value
                  .map((player) =>
                      player.playersBreakDown!.first.statsBreakDown!
                          .firstWhere((stat) => stat.name == statName)
                          .value ??
                      0.0)
                  .reduce((a, b) => a + b); // Sum the points for that stat

              summedData[statName!] = summedData[statName]! + totalPoints;
            } else {
              summedData[statName!] = entry.value
                  .map((player) =>
                      player.playersBreakDown!.first.statsBreakDown!
                          .firstWhere((stat) => stat.name == statName)
                          .value ??
                      0.0)
                  .reduce((a, b) => a + b);
            }
          }
        }
        final summedDataList = summedData.entries
            .map((entry) => MapEntry(entry.key, entry.value))
            .toList();
        log(summedDataList.toString());
        return Column(children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'Event type',
                  style: globalTextStyle2(
                      fontSize: 14.sp,
                      color: AppColors.dark,
                      fontWeight: FontWeight.w600),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        controller.showAutoDismissAlert(context);
                      },
                      child: const Icon(
                        CupertinoIcons.exclamationmark_circle,
                        color: AppColors.textGray,
                      ),
                    ),
                    verticalSpace(10),
                    Row(
                      children: [
                        Obx(
                          () => Text(
                            controller.selectedTitle.value,
                            style: globalTextStyle2(
                                fontSize: 14.sp,
                                color: AppColors.dark,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        horizontalSpace(5),
                        const Icon(
                          CupertinoIcons.arrow_down,
                          color: AppColors.textGray,
                          size: 20,
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          ...summedDataList.map((data) {
            return Column(
              children: [
                Container(
                    margin: const EdgeInsets.only(
                      left: 10,
                      right: 10,
                    ),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppColors.grey,
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(2.5.r)),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              data.key,
                              style: globalTextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            horizontalSpace(5.w),
                            Text(
                              data.value.toStringAsFixed(0),
                              style: globalTextStyle2(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.dark),
                            )
                          ]),
                    )),
                const Divider(
                  thickness: 0.5,
                  indent: 20,
                  endIndent: 20,
                  color: AppColors.primary,
                )
              ],
            );
          })
        ]);
      });
    });
  }
}
