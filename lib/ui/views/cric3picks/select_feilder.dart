import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/ui/views/cric3picks/controller/cric3_controller.dart';
import 'package:fmlfantasy/ui/views/cric3picks/selected_players_view.dart';
import 'package:fmlfantasy/ui/views/cric3picks/widgets/custom_player_card.dart';
import 'package:fmlfantasy/ui/widgets/primary_button.dart';

class SelectFielderView extends StatelessWidget {
  const SelectFielderView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Cric3Controller());
    return Scaffold(
      body: GetBuilder<Cric3Controller>(builder: (controller) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 70,
              ),
              child: Center(
                child: Text(
                  'PICK THE TOP FIELDER',
                  style: globalTextStyle(
                      fontSize: 16.sp,
                      color: AppColors.secondary,
                      fontWeight: FontWeight.w800),
                ),
              ),
            ),
            Text('Who will be the best in the fielding?',
                style: globalTextStyle(
                    fontSize: 12.sp,
                    color: AppColors.white,
                    fontWeight: FontWeight.w600)),
            verticalSpace(10),
            Container(
              alignment: Alignment.center,
              width: Get.width,
              color: AppColors.primaryDark,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  controller.selectedTournament!.matches![0].home!,
                  style: globalTextStyle(
                      fontSize: 14.sp,
                      color: AppColors.white,
                      fontWeight: FontWeight.w800),
                ),
              ),
            ),
            verticalSpace(10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      controller.onPreviousPlayerCard(true, false, false, true);
                    },
                    child: Container(
                      height: 40.h,
                      width: 40.w,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(5),
                      child: Image.asset(
                        'assets/new_images/arrow left.png',
                        height: 25.h,
                        width: 25.w,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.onNextPlayerCard(true, false, false, true);
                    },
                    child: Container(
                      height: 40.h,
                      width: 40.w,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(5),
                      child: Image.asset(
                        'assets/new_images/arrow right.png',
                        height: 25.h,
                        width: 25.w,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            verticalSpace(10),
            controller.players.isEmpty
                ? const SizedBox.shrink()
                : CarouselSlider(
                    controller: controller.homeFielderController,
                    options: CarouselOptions(
                      height: 170, // adjust according to your card height
                      enlargeCenterPage: false,
                      enableInfiniteScroll: false,
                      viewportFraction: 0.5, // shows two cards partially

                      padEnds: false,
                    ),
                    items: controller.homePlayers.map((player) {
                      return Builder(
                        builder: (BuildContext context) {
                          final isSelected =
                              controller.selectedHomeFielder == player;
                          return GestureDetector(
                            onTap: () {
                              controller.onSelectedFielder(player, true);
                            },
                            child: CustomPlayerCard(
                              player: player,
                              widthFactor: 0.4,
                              borderColor: isSelected
                                  ? AppColors.secondary
                                  : AppColors.primary,
                              backgroundColor: isSelected
                                  ? AppColors.secondary
                                  : AppColors.primary,
                              textColor:
                                  isSelected ? AppColors.dark : AppColors.white,
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ),
            verticalSpace(30),
            Container(
              alignment: Alignment.center,
              width: Get.width,
              color: AppColors.primaryDark,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  controller.selectedTournament!.matches![0].away!,
                  style: globalTextStyle(
                      fontSize: 14.sp,
                      color: AppColors.white,
                      fontWeight: FontWeight.w800),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      controller.onPreviousPlayerCard(
                          false, false, false, true);
                    },
                    child: Container(
                      height: 40.h,
                      width: 40.w,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(5),
                      child: Image.asset(
                        'assets/new_images/arrow left.png',
                        height: 25.h,
                        width: 25.w,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.onNextPlayerCard(false, false, false, true);
                    },
                    child: Container(
                      height: 40.h,
                      width: 40.w,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(5),
                      child: Image.asset(
                        'assets/new_images/arrow right.png',
                        height: 25.h,
                        width: 25.w,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            verticalSpace(10),
            controller.players.isEmpty
                ? const SizedBox.shrink()
                : CarouselSlider(
                    controller: controller.awayFielderController,
                    options: CarouselOptions(
                      height: 170, // adjust according to your card height
                      enlargeCenterPage: false,
                      enableInfiniteScroll: false,
                      viewportFraction: 0.5, // shows two cards partially

                      padEnds: false,
                    ),
                    items: controller.awayPlayers.map((player) {
                      final isSelected =
                          controller.selectedAwayFielder == player;
                      return Builder(
                        builder: (BuildContext context) {
                          return GestureDetector(
                            onTap: () {
                              controller.onSelectedFielder(player, false);
                            },
                            child: CustomPlayerCard(
                              player: player,
                              widthFactor: 0.4,
                              borderColor: isSelected
                                  ? AppColors.secondary
                                  : AppColors.primary,
                              backgroundColor: isSelected
                                  ? AppColors.secondary
                                  : AppColors.primary,
                              textColor:
                                  isSelected ? AppColors.dark : AppColors.white,
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ),
            const Spacer(),
            Row(
              children: [
                Expanded(
                  child: PrimaryButton(
                      buttonText: 'Previous'.tr,
                      onPressed: () {
                        Get.back();
                      },
                      isEnabled: true),
                ),
                horizontalSpace(5),
                Expanded(
                  child: PrimaryButton(
                      buttonText: 'Continue'.tr,
                      onPressed: () {
                        Get.to(() => const SelectedPlayersView());
                      },
                      isEnabled: true),
                ),
              ],
            ),
            verticalSpace(30),
          ],
        );
      }),
    );
  }
}
