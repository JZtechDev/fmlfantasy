import 'package:fmlfantasy/app/app_images/app_images.dart';
import 'package:fmlfantasy/app/app_sizings.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/ui/views/home/controller/home_controller.dart';
import 'package:fmlfantasy/ui/views/monthly_leaderboard/monthly_leaderboard.dart';
import 'package:fmlfantasy/ui/views/play_sportypick/leaderboard_sportyplay.dart';
import 'package:fmlfantasy/ui/widgets/primary_button.dart';
import 'package:flutter_svg/svg.dart';

class DrawerView extends StatefulWidget {
  const DrawerView({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DrawerViewState createState() => _DrawerViewState();
}

class _DrawerViewState extends State<DrawerView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<Animation<Offset>> _animations;
  late Animation<double> fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );

    // Define animations for each drawer item
    _animations = List.generate(10, (index) {
      return Tween<Offset>(
        begin: const Offset(-1.0, 0.0),
        end: Offset.zero,
      ).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Interval(
            0.1 * index,
            1.0,
            curve: Curves.easeOut,
          ),
        ),
      );
    });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    double drawerWidth = 0.75.sw;
    if (ScreenUtil().screenWidth >= 600) {
      drawerWidth = 0.6.sw;
    }

    return Drawer(
      backgroundColor: Colors.white,
      width: drawerWidth,
      child: Padding(
        padding: EdgeInsets.only(top: 10.h, right: 10, left: 20, bottom: 20.h),
        child: ListView(
          shrinkWrap: true,
          children: [
            FadeTransition(
              opacity: fadeAnimation,
              child: SvgPicture.asset(
                AppImages.logo,
                height: 40.h,
                width: 40.w,
              ),
            ),
            verticalSpace(15.h),
            SlideTransition(
              position: _animations[2],
              child: Padding(
                padding: EdgeInsets.only(left: 10.w, right: 10.w),
                child: Text(
                  'QUICKLINKS'.tr,
                  style: globalTextStyle(
                      fontSize: AppSizing.isMobile(context) ? 12.sp : 10.sp,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
            SlideTransition(
              position: _animations[3],
              child: ExpansionTile(
                enabled: true,
                shape: const Border(),
                initiallyExpanded: true,
                trailing: Image.asset(
                  AppImages.downIcon,
                  color: AppColors.dark,
                  height: AppSizing.isMobile(context) ? 10.sp : 6.sp,
                  width: AppSizing.isMobile(context) ? 10.sp : 6.sp,
                ),
                title: Row(
                  children: [
                    SvgPicture.asset(
                      AppImages.addIcon,
                      height: 10.h,
                      // ignore: deprecated_member_use
                      color: AppColors.primary,
                    ),
                    horizontalSpace(10.w),
                    Text(
                      'Fantasy Sports'.tr,
                      style: globalTextStyle2(
                          fontSize: AppSizing.isMobile(context) ? 12.sp : 10.sp,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                children: [
                  buildAnimatedRow(
                    index: 1,
                    iconPath: AppImages.howItWork,
                    text: 'Dashboard'.tr,
                    onTap: () {
                      Get.toNamed(AppRoutes.dashboardView);
                    },
                  ),
                  verticalSpace(10.h),
                  buildAnimatedRow(
                    index: 2,
                    iconPath: AppImages.howItWork,
                    text: 'Create New Team'.tr,
                    onTap: () {
                      Get.toNamed(AppRoutes.home);
                    },
                  ),
                  verticalSpace(10.h),
                  buildAnimatedRow(
                    index: 3,
                    iconPath: AppImages.matchCenter,
                    text: 'Match Center'.tr,
                    onTap: () {
                      Get.toNamed(AppRoutes.matchCenter);
                    },
                  ),
                  verticalSpace(10.h),
                  buildAnimatedRow(
                    index: 4,
                    iconPath: AppImages.leaderboard,
                    text: 'LeaderBoard'.tr,
                    onTap: () {
                      Get.to(() => const MonthlyLeaderboard());
                    },
                  ),
                  verticalSpace(10.h),
                  buildAnimatedRow(
                    index: 5,
                    iconPath: AppImages.howItWork,
                    text: 'How it Works'.tr,
                    onTap: () {
                      Get.toNamed(AppRoutes.howItWorks);
                    },
                  ),
                  verticalSpace(10.h),
                  buildAnimatedRow(
                    index: 6,
                    iconPath: AppImages.myTeam,
                    text: 'My Teams'.tr,
                    onTap: () {
                      Get.toNamed(AppRoutes.myTeams);
                    },
                  ),
                  verticalSpace(10.h),
                  buildAnimatedRow(
                    index: 7,
                    iconPath: AppImages.myContest,
                    text: 'My Contests'.tr,
                    onTap: () {
                      Get.toNamed(AppRoutes.myContestView);
                    },
                  ),
                  verticalSpace(10.h),
                  buildAnimatedRow(
                    index: 8,
                    iconPath: AppImages.myContest,
                    text: 'Friends'.tr,
                    onTap: () {
                      Get.toNamed(AppRoutes.friendsView);
                    },
                  ),
                ],
              ),
            ),
            SlideTransition(
              position: _animations[8],
              child: ExpansionTile(
                enabled: true,
                initiallyExpanded: true,
                trailing: Image.asset(
                  AppImages.downIcon,
                  color: AppColors.dark,
                  height: AppSizing.isMobile(context) ? 10.sp : 6.sp,
                  width: AppSizing.isMobile(context) ? 10.sp : 6.sp,
                ),
                shape: const Border(),
                title: Row(
                  children: [
                    SvgPicture.asset(
                      AppImages.addIcon,
                      height: 10.h,
                      // ignore: deprecated_member_use
                      color: AppColors.primary,
                    ),
                    horizontalSpace(10.w),
                    Text(
                      'Daily Matchpick'.tr,
                      style: globalTextStyle2(
                          fontSize: AppSizing.isMobile(context) ? 12.sp : 10.sp,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                children: [
                  buildAnimatedRow(
                    index: 6,
                    iconPath: AppImages.friends,
                    text: 'Create New Draw'.tr,
                    onTap: () {
                      Get.toNamed(AppRoutes.matchFixturesView);
                    },
                  ),
                  verticalSpace(10.h),
                  buildAnimatedRow(
                    index: 6,
                    iconPath: AppImages.friends,
                    text: 'My Draws'.tr,
                    onTap: () {
                      Get.toNamed(AppRoutes.myDrawsView);
                    },
                  ),
                  verticalSpace(10.h),
                  buildAnimatedRow(
                    index: 6,
                    iconPath: AppImages.friends,
                    text: 'Draws Leaderboard'.tr,
                    onTap: () {
                      Get.toNamed(AppRoutes.sportPickLeaderboard);
                    },
                  ),
                ],
              ),
            ),
            SlideTransition(
              position: _animations[9],
              child: ExpansionTile(
                enabled: true,
                initiallyExpanded: true,
                trailing: Image.asset(
                  AppImages.downIcon,
                  color: AppColors.dark,
                  height: AppSizing.isMobile(context) ? 10.sp : 6.sp,
                  width: AppSizing.isMobile(context) ? 10.sp : 6.sp,
                ),
                shape: const Border(),
                title: Row(
                  children: [
                    SvgPicture.asset(
                      AppImages.addIcon,
                      height: 10.h,
                      // ignore: deprecated_member_use
                      color: AppColors.primary,
                    ),
                    horizontalSpace(10.w),
                    Text(
                      'SportyPick\'em'.tr,
                      style: globalTextStyle2(
                          fontSize: AppSizing.isMobile(context) ? 12.sp : 10.sp,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                children: [
                  buildAnimatedRow(
                    index: 6,
                    iconPath: AppImages.friends,
                    text: 'Play SportyPick\'em'.tr,
                    onTap: () {
                      Get.toNamed(AppRoutes.playSportyPick);
                    },
                  ),
                  verticalSpace(10.h),
                  buildAnimatedRow(
                    index: 6,
                    iconPath: AppImages.friends,
                    text: 'My SportyPick\'em'.tr,
                    onTap: () {
                      Get.toNamed(AppRoutes.playSportyResponses);
                    },
                  ),
                  verticalSpace(10.h),
                  buildAnimatedRow(
                    index: 6,
                    iconPath: AppImages.friends,
                    text: 'Leaderboard'.tr,
                    onTap: () {
                      Get.to(() => const LeaderboardSportyplay());
                    },
                  ),
                ],
              ),
            ),
            verticalSpace(50.h),
            FadeTransition(
              opacity: fadeAnimation,
              child: PrimaryButton(
                buttonText: 'Private Contest'.tr,
                onPressed: () {
                  // Get.toNamed(AppRoutes.createContest);
                  Get.toNamed(AppRoutes.privateTournamentView);
                },
                isEnabled: true,
                iconBeforeText: true,
                iconPath: AppImages.addIcon,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildAnimatedRow(
      {required int index,
      required String iconPath,
      Color? backgroundColor = AppColors.white,
      required String text,
      required VoidCallback onTap}) {
    return LayoutBuilder(builder: (context, constraints) {
      double maxWidth = constraints.maxWidth;
      return SlideTransition(
        position: _animations[index],
        child: Padding(
          padding: const EdgeInsets.only(right: 5),
          child: GestureDetector(
            onTap: onTap,
            child: Container(
              color: backgroundColor,
              child: Row(
                children: [
                  horizontalSpace(10.w),
                  Container(
                    padding: const EdgeInsets.all(5),
                    height: maxWidth > 450 ? 20.h : 24.h,
                    width: maxWidth > 450 ? 20.h : 24.h,
                    decoration: BoxDecoration(
                      color: AppColors.grey,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: SvgPicture.asset(iconPath),
                  ),
                  horizontalSpace(10.w),
                  Text(
                    text,
                    style: globalTextStyle(
                        fontSize: AppSizing.isMobile(context) ? 12.sp : 8.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.dark),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
