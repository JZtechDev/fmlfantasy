import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/ui/views/player_stats_view/controller/players_stats_controller.dart';

class PlayersTabBar extends StatelessWidget {
  const PlayersTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(PlayersStatsController());
    return GetBuilder<PlayersStatsController>(builder: (controller) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        clipBehavior: Clip.hardEdge,
        decoration: const BoxDecoration(
          color: AppColors.secondary,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ...controller.tabLabels.map((data) {
              return GestureDetector(
                onTap: () {
                  controller.selectedTab = data;
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: controller.selectedTab == data
                        ? AppColors.white
                        : Colors.transparent,
                  ),
                  child: Text(
                    data,
                    style: globalTextStyle(
                      fontSize: 12,
                      color: controller.selectedTab == data
                          ? AppColors.dark
                          : AppColors.white,
                    ),
                  ),
                ),
              );
            })
          ],
        ),
      );
    });
  }
}
