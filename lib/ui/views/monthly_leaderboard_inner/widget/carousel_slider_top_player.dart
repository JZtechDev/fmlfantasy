import 'package:fmlfantasy/app/app_colors/app_colors.dart';
import 'package:fmlfantasy/app/app_images/app_images.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/model/monthly_leader_model.dart';
import 'package:fmlfantasy/ui/views/monthly_leaderboard_inner/controller/monthly_inner_leaderboard_controller.dart';
import 'package:fmlfantasy/ui/views/monthly_leaderboard_inner/widget/monthy_leaderbiard_toggle.dart';
import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CarouselSliderTopPlayerToggle
    extends GetView<MonthlyInnerLeaderboardController> {
  const CarouselSliderTopPlayerToggle(this.topPlayers, {super.key});

  final List<TopPlayers> topPlayers;

  @override
  Widget build(BuildContext context) {
    Get.put(MonthlyInnerLeaderboardController());
    return LayoutBuilder(
      builder: (context, constraints) {
        final isPortrait =
            MediaQuery.of(context).orientation == Orientation.portrait;
        final cardWidth = constraints.maxWidth * 0.48;
        final imageSize = cardWidth * 0.51;
        final rankBoxSize = cardWidth * 0.3;
        final rankBoxheight = cardWidth * 0.35;
        final fontSize = isPortrait ? 12.sp : 10.sp;
        final smallFontSize = isPortrait ? 12.sp : 8.sp;
        final padding = cardWidth * 0.05;

        return Column(
          children: [
            MonthlyLeaderboardToggle(
              iconPathN: 'assets/icons/arrowright.svg',
              iconPathP: 'assets/icons/arrowright.svg',
              onPrevious: () => controller.onPreviousPlayerCard(),
              onNext: () => controller.onNextPlayerCard(),
            ),
            CarouselSlider.builder(
              controller: controller.carouselController,
              itemCount: topPlayers.length,
              itemBuilder: (context, index, realIndex) {
                final player = topPlayers[index];
                return Container(
                  width: cardWidth,
                  margin:
                      EdgeInsets.symmetric(horizontal: padding, vertical: 5.h),
                  decoration: BoxDecoration(
                    color: AppColors.dark,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.all(padding),
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            // Rank and Points
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  width: rankBoxSize,
                                  height: rankBoxheight,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.r),
                                    color: AppColors.primary,
                                    border: Border.all(
                                        color: AppColors.white, width: 1.5),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        'assets/new_images/Award.png',
                                        height: rankBoxSize * 0.4,
                                        width: rankBoxSize * 0.4,
                                        color: AppColors.white,
                                      ),
                                      SizedBox(height: padding * 0.5),
                                      Text(
                                        player.rank.toString(),
                                        style: globalTextStyle(
                                          color: AppColors.white,
                                          fontSize: smallFontSize,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: padding),
                                Container(
                                  width: rankBoxSize,
                                  height: rankBoxSize * 0.6,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6.r),
                                    color: AppColors.primary,
                                    border: Border.all(
                                        color: AppColors.white, width: 1.5),
                                  ),
                                  child: Center(
                                    child: Text(
                                      player.fantasyPoint!.toStringAsFixed(1),
                                      style: globalTextStyle(
                                        color: AppColors.white,
                                        fontSize: smallFontSize,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            // Player Image
                            Container(
                              constraints: BoxConstraints(
                                maxHeight: imageSize,
                                maxWidth: imageSize,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.primary,
                                borderRadius: BorderRadius.circular(5.r),
                              ),
                              child: Stack(
                                alignment: Alignment.topCenter,
                                clipBehavior: Clip.none,
                                children: [
                                  Positioned(
                                    top: -padding,
                                    left: 0,
                                    right: 0,
                                    bottom: 0,
                                    child: controller.sportName == 'FB'
                                        ? Stack(
                                            alignment: Alignment.center,
                                            children: [
                                              player.jerseyImage != null
                                                  ? player.jerseyImage!
                                                          .endsWith('.svg')
                                                      ? SvgPicture.network(
                                                          player.jerseyImage!,
                                                          height: imageSize,
                                                          width: imageSize,
                                                          fit: BoxFit.contain,
                                                        )
                                                      : Image.network(
                                                          player.jerseyImage!,
                                                          height: imageSize,
                                                          width: imageSize,
                                                          fit: BoxFit.contain,
                                                        )
                                                  : Image.asset(
                                                      AppImages.userPlaceHolder,
                                                      height: imageSize,
                                                      width: imageSize,
                                                      fit: BoxFit.contain,
                                                    ),
                                              Align(
                                                alignment: Alignment.topCenter,
                                                heightFactor: 4,
                                                child: Container(
                                                  height: imageSize * 0.2,
                                                  width: imageSize * 0.5,
                                                  padding: EdgeInsets.symmetric(
                                                    horizontal: padding * 0.5,
                                                    vertical: padding * 0.2,
                                                  ),
                                                  alignment: Alignment.center,
                                                  decoration: BoxDecoration(
                                                    color: AppColors.white
                                                        .withValues(alpha: 0.9),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            2.r),
                                                  ),
                                                  child: Text(
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    player.jerseyName == null
                                                        ? player.name!
                                                            .split(' ')
                                                            .last
                                                        : player.jerseyName
                                                            .toString()
                                                            .padLeft(2, '0'),
                                                    style: globalTextStyle2(
                                                      fontSize:
                                                          smallFontSize * 0.8,
                                                      color: AppColors.dark,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              if (player.jerseyNumber != null)
                                                Align(
                                                  alignment: Alignment.center,
                                                  child: Container(
                                                    padding:
                                                        EdgeInsets.all(3.r),
                                                    decoration:
                                                        const BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: AppColors.white,
                                                    ),
                                                    child: Text(
                                                      player.jerseyNumber
                                                          .toString()
                                                          .padLeft(2, '0'),
                                                      style: globalTextStyle2(
                                                        fontSize:
                                                            smallFontSize * 0.8,
                                                        color: AppColors.dark,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                            ],
                                          )
                                        : player.picture != null
                                            ? player.picture!.endsWith('.svg')
                                                ? SvgPicture.network(
                                                    player.picture!,
                                                    height: imageSize,
                                                    width: imageSize,
                                                    fit: BoxFit.contain,
                                                  )
                                                : Image.network(
                                                    player.picture!,
                                                    height: imageSize,
                                                    width: imageSize,
                                                    fit: BoxFit.contain,
                                                  )
                                            : Image.asset(
                                                AppImages.userPlaceHolder,
                                                height: imageSize,
                                                width: imageSize,
                                                fit: BoxFit.contain,
                                              ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: padding),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: padding),
                        child: Text(
                          player.name!,
                          style: globalTextStyle(
                            fontSize: fontSize,
                            fontWeight: FontWeight.w700,
                            color: AppColors.white,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                );
              },
              options: CarouselOptions(
                aspectRatio: isPortrait ? 2.2 : 3.0,
                viewportFraction: isPortrait ? 0.5 : 0.45,
                scrollDirection: Axis.horizontal,
                enableInfiniteScroll: false,
                padEnds: false,
                onPageChanged: (index, reason) {
                  controller.topPlayerCrouselIndex.value = index;
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
