import 'package:fmlfantasy/app/app%20routes/app_routes.dart';
import 'package:fmlfantasy/app/app_colors/app_colors.dart';
import 'package:fmlfantasy/app/app_sizings.dart';
import 'package:fmlfantasy/model/tournament_model.dart';
import 'package:fmlfantasy/ui/helpers/commons.dart';
import 'package:fmlfantasy/ui/views/home/controller/home_controller.dart';
import 'package:fmlfantasy/ui/views/home/widgets/sports_text.dart';
import 'package:fmlfantasy/ui/views/home/widgets/public_tournament_card.dart';
import 'package:fmlfantasy/ui/views/home/widgets/skeleton/tounament_card_skeleton.dart';
import 'package:fmlfantasy/ui/views/home/widgets/tounament_label.dart';
import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TournamentsScreen extends GetView<HomeController> {
  const TournamentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SportsNAme(),
          verticalSpace(10.h),
          Divider(
            thickness: 1.h,
            color: AppColors.textGray.withOpacity(0.1),
            endIndent: 40.w,
            indent: 40.w,
          ),
          verticalSpace(10.h),
          Obx(
            () => TournamentLabel(
              title: 'publicTournament'.tr,
              iconPathN: 'assets/icons/arrowright.svg',
              iconPathP: 'assets/icons/arrowleft.svg',
              previousButtonColor:
                  controller.publicTournamentCrouselIndex.value ==
                          controller.tournaments.length - 1
                      ? AppColors.dark
                      : AppColors.white,
              nextButtonColor: controller.publicTournamentCrouselIndex.value ==
                      controller.tournaments.length - 1
                  ? AppColors.white
                  : AppColors.dark,
              previousIconColor:
                  controller.publicTournamentCrouselIndex.value ==
                          controller.tournaments.length - 1
                      ? AppColors.white
                      : AppColors.dark,
              nextIconColor: controller.publicTournamentCrouselIndex.value ==
                      controller.tournaments.length - 1
                  ? AppColors.dark
                  : AppColors.white,
              onPrevious: () {
                controller.onPreviousPublicCard();
              },
              onNext: () {
                controller.onNextPublicCard();
              },
            ),
          ),
          verticalSpace(20.h),
          Obx(
            () => controller.isPublicTournamentsLoading.value
                ? const TournamentCardSkeleton()
                : controller.tournaments.isEmpty
                    ? Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: const Text('No tournaments available.'),
                      )
                    : LayoutBuilder(builder: (context, constraints) {
                        final maxWidth = constraints.maxWidth;

                        return SlideTransition(
                          position: Tween<Offset>(
                            begin: const Offset(1, 0),
                            end: Offset.zero,
                          ).animate(CurvedAnimation(
                              parent: controller.animationController,
                              curve: Curves.easeInOut)),
                          child: CarouselSlider.builder(
                            itemCount: controller.tournaments.length,
                            controller:
                                controller.publicTournamentcarouselController,
                            itemBuilder: (BuildContext context, int index,
                                int realIndex) {
                              Tournaments tournaments =
                                  controller.tournaments[index];
                              return GestureDetector(
                                onTap: () {
                                  Get.toNamed(AppRoutes.selectPlayers,
                                      arguments: {
                                        'matchID':
                                            tournaments.matches![0].matchCode,
                                        'sport': controller.selectedSport.value,
                                        'tournamentId': tournaments.id
                                      });
                                },
                                child: TournamentCardSlider(
                                    tournament: controller.tournaments[index]),
                              );
                            },
                            options: CarouselOptions(
                              padEnds: true,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              aspectRatio: maxWidth > 600 ? 17 / 7 : 17 / 9,
                              viewportFraction:
                                  AppSizing.isMobile(context) ? 0.9 : 0.9,
                              initialPage: 0,
                              disableCenter: true,
                              enableInfiniteScroll: false,
                              reverse: false,
                              autoPlay: false,
                              enlargeCenterPage: false,
                              scrollDirection: Axis.horizontal,
                              onPageChanged: (index, reason) {
                                controller.publicTournamentCrouselIndex.value =
                                    index;
                              },
                              pageSnapping: true,
                            ),
                          ),
                        );
                      }),
          ),
          verticalSpace(20.h),
          Obx(
            () => TournamentLabel(
              title: 'privateTournament'.tr,
              iconPathN: 'assets/icons/arrowright.svg',
              iconPathP: 'assets/icons/arrowleft.svg',
              previousButtonColor:
                  controller.privateTournamentCrouselIndex.value ==
                          controller.tournaments.length - 1
                      ? AppColors.dark
                      : AppColors.white,
              nextButtonColor: controller.privateTournamentCrouselIndex.value ==
                      controller.tournaments.length - 1
                  ? AppColors.white
                  : AppColors.dark,
              previousIconColor:
                  controller.privateTournamentCrouselIndex.value ==
                          controller.tournaments.length - 1
                      ? AppColors.white
                      : AppColors.dark,
              nextIconColor: controller.privateTournamentCrouselIndex.value ==
                      controller.tournaments.length - 1
                  ? AppColors.dark
                  : AppColors.white,
              onPrevious: () {
                controller.onPreviousPrivateCard();
              },
              onNext: () {
                controller.onNextPrivateCard();
              },
            ),
          ),
          verticalSpace(20.h),
          Obx(
            () => controller.isPrivateTOurnamentLoading.value
                ? const TournamentCardSkeleton()
                : controller.privateTournaments.isEmpty
                    ? Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: const Text('No tournaments available.'),
                      )
                    : LayoutBuilder(builder: (context, constraints) {
                        final maxWidth = constraints.maxWidth;

                        return SlideTransition(
                          position: Tween<Offset>(
                            begin: const Offset(1, 0),
                            end: Offset.zero,
                          ).animate(CurvedAnimation(
                              parent: controller.privateAnimationController,
                              curve: Curves.easeInOut)),
                          child: CarouselSlider.builder(
                            itemCount: controller.privateTournaments.length,
                            controller:
                                controller.privateTournamentcarouselController,
                            itemBuilder: (BuildContext context, int index,
                                int realIndex) {
                              Tournaments tournaments =
                                  controller.privateTournaments[index];
                              return GestureDetector(
                                onTap: () {
                                  Get.toNamed(AppRoutes.selectPlayers,
                                      arguments: {
                                        'matchID':
                                            tournaments.matches![0].matchCode,
                                        'sport': controller.selectedSport.value,
                                        'tournamentId': tournaments.id,
                                        'joinCode': tournaments.joinCode
                                      });
                                },
                                child: TournamentCardSlider(
                                    tournament:
                                        controller.privateTournaments[index]),
                              );
                            },
                            options: CarouselOptions(
                              padEnds: true,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              aspectRatio: maxWidth > 600 ? 17 / 7 : 17 / 9,
                              viewportFraction:
                                  AppSizing.isMobile(context) ? 0.9 : 0.9,
                              initialPage: 0,
                              disableCenter: true,
                              enableInfiniteScroll: false,
                              reverse: false,
                              autoPlay: false,
                              enlargeCenterPage: false,
                              scrollDirection: Axis.horizontal,
                              onPageChanged: (index, reason) {
                                controller.privateTournamentCrouselIndex.value =
                                    index;
                              },
                              pageSnapping: true,
                            ),
                          ),
                        );
                      }),
          ),
          verticalSpace(30.h),
        ]);
  }
}
