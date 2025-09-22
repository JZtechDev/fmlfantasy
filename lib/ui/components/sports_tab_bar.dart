import 'dart:developer';

import 'package:fmlfantasy/app/app_sizings.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/config/global_instances.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/model/sports_type.dart';
import 'package:fmlfantasy/ui/views/dashboard/controller/dashboard_controller.dart';

class SportsTabBar extends StatefulWidget {
  final List<Sport> sportsList;
  final int selectedIndex;
  final Function(int) onTap;
  final Color backgroundColor;
  final Color selectedColor;

  const SportsTabBar({
    super.key,
    required this.sportsList,
    required this.selectedIndex,
    required this.onTap,
    this.backgroundColor = Colors.white,
    this.selectedColor = AppColors.backgroud,
  });

  @override
  SportsTabBarState createState() => SportsTabBarState();
}

class SportsTabBarState extends State<SportsTabBar> {
  final List<Map<String, dynamic>> tabOptions = [
    {
      'name': 'Fantasy Sports',
      'icon': 'assets/icons/fantasy_sports.png',
    },
    {
      'name': 'Daily Match Pick',
      'icon': 'assets/icons/sporty_pick.png',
    },
    {
      'name': 'Sporty Pick',
      'icon': 'assets/icons/daily_match.png',
    },
  ];

  void _onSecondaryTabTap(int index) {
    selectedTab.value = tabOptions[index]['name'];
    log(selectedTab.value);

    Get.find<DashboardController>().updateFilteredList();
    setState(() {});
  }

  void navigateToHome() {
    if (selectedModule.value != 'dashboard') {
      Get.offAllNamed(AppRoutes.dashboardView);
      log(selectedSPort.value);
      selectedModule.value = 'dashboard';
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      double maxWidth = constraints.maxWidth;
      final double containerWidth = maxWidth > 600 ? 40.w : 52.w;
      final double containerHeight = maxWidth > 600 ? 55.h : 55.h;
      final double totalWidth = containerWidth * widget.sportsList.length;
      final double leftOffset = containerWidth * widget.selectedIndex;

      return Column(
        children: [
          // Primary Sports Tab Bar
          GestureDetector(
            onHorizontalDragEnd: (details) {
              if (details.primaryVelocity != null) {
                if (details.primaryVelocity! > 0) {
                  // Swipe Right
                  if (widget.selectedIndex > 0) {
                    widget.onTap(widget.selectedIndex - 1);
                  }
                } else if (details.primaryVelocity! < 0) {
                  // Swipe Left
                  if (widget.selectedIndex < widget.sportsList.length - 1) {
                    widget.onTap(widget.selectedIndex + 1);
                  }
                }
              }
            },
            child: Container(
              alignment: Alignment.center,
              width: Get.width,
              decoration: const BoxDecoration(
                color: AppColors.backgroud,
                border: Border.symmetric(
                    horizontal: BorderSide(color: AppColors.secondary)),
              ),
              child: Stack(
                children: [
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 500),
                    left: (Get.width - totalWidth) / 2 + leftOffset,
                    top: 0,
                    child: Container(
                      alignment: Alignment.center,
                      width: containerWidth,
                      height: containerHeight,
                      decoration: BoxDecoration(
                        color: widget.selectedColor,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(
                      widget.sportsList.length,
                      (index) {
                        Sport sport = widget.sportsList[index];
                        bool isSelected = index == widget.selectedIndex;
                        return Expanded(
                          child: GestureDetector(
                            onTap: () {
                              widget.onTap(index);
                              navigateToHome();
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: containerWidth,
                              height: containerHeight,
                              decoration: BoxDecoration(
                                  border: const Border.symmetric(
                                      vertical: BorderSide(
                                          width: 0.5,
                                          color: AppColors.secondary)),
                                  gradient: LinearGradient(
                                    stops: const [0.0, 0.6, 0.7, 0.8, 0.9],
                                    colors: isSelected
                                        ? [
                                            AppColors.secondary
                                                .withValues(alpha: 0.8),
                                            AppColors.secondary
                                                .withValues(alpha: 0.2),
                                            AppColors.secondary
                                                .withValues(alpha: 0.1),
                                            AppColors.backgroud
                                                .withValues(alpha: 0.1),
                                            AppColors.backgroud
                                                .withValues(alpha: 0.6),
                                          ]
                                        : [
                                            AppColors.backgroud,
                                            AppColors.backgroud,
                                            AppColors.backgroud,
                                            AppColors.backgroud,
                                            AppColors.backgroud,
                                          ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                  )),
                              child: AnimatedOpacity(
                                duration: const Duration(milliseconds: 300),
                                opacity: 1,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      sport.icon,
                                      height: maxWidth > 600 ? 15.h : 20.h,
                                    ),
                                    verticalSpace(3.h),
                                    Text(
                                      sport.name!,
                                      style: globalTextStyle(
                                        fontSize: maxWidth > 600 ? 7.sp : 10.sp,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Secondary Tab Bar
          Container(
            height: 30,
            width: AppSizing.width(context),
            color: AppColors.primaryDark,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                tabOptions.length,
                (index) {
                  return Expanded(
                    child: GestureDetector(
                      onTap: () => _onSecondaryTabTap(index),
                      child: Container(
                        alignment: Alignment.center,
                        height: 30,
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color:
                                  selectedTab.value == tabOptions[index]['name']
                                      ? AppColors.secondary
                                      : Colors.transparent,
                              width: 2,
                            ),
                          ),
                        ),
                        child: Text(
                          tabOptions[index]['name'],
                          style: globalTextStyle(
                            fontSize:
                                AppSizing.width(context) > 600 ? 8.sp : 12.sp,
                            fontWeight: FontWeight.w800,
                            color:
                                selectedTab.value == tabOptions[index]['name']
                                    ? AppColors.secondary
                                    : AppColors.white,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      );
    });
  }
}
