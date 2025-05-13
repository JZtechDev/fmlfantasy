import 'package:flutter_svg/svg.dart';
import 'package:fmlfantasy/app/app_images/app_images.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/ui/helpers/replace_svg_with_png.dart';
import 'package:fmlfantasy/ui/views/select_players/controller/select_player_controller.dart';

class SelectedPlayersList extends GetView<SelectPlayerController> {
  const SelectedPlayersList({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Wrap(
        runSpacing: 5.h,
        children: [
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            alignment: WrapAlignment.start,
            runAlignment: WrapAlignment.start,
            runSpacing: 5.h,
            spacing: 5.w,
            children: [
              ...controller.selectedPlayers.map((player) {
                return Container(
                  decoration: BoxDecoration(
                    color: AppColors.secondary,
                    borderRadius: BorderRadius.circular(2.5.r),
                  ),
                  child: controller.sportName == 'FB'
                      ? player.imageUrl == null
                          ? Stack(
                              alignment: Alignment.center,
                              clipBehavior: Clip.hardEdge,
                              children: [
                                player.jerseyImageUrl != null
                                    ? player.jerseyImageUrl!.endsWith('svg')
                                        ? SvgPicture.network(
                                            player.jerseyImageUrl!,
                                            height: 50,
                                            width: 50,
                                          )
                                        : Image.network(
                                            player.jerseyImageUrl!,
                                            height: 50,
                                            width: 50,
                                          )
                                    : Image.asset(
                                        AppImages.userPlaceHolder,
                                        height: 50,
                                        width: 50,
                                      ),
                                player.jerseyImageUrl == null
                                    ? Image.asset(
                                        AppImages.userPlaceHolder,
                                        width: 50,
                                        height: 50,
                                      )
                                    : Align(
                                        alignment: Alignment.topCenter,
                                        widthFactor: 0.1.w,
                                        child: SizedBox(
                                          width: 70.w,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                padding: EdgeInsets.only(
                                                    left: 2.w,
                                                    right: 2.w,
                                                    top: 1.h,
                                                    bottom: 1.h),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                2.r)),
                                                    color: AppColors.white
                                                        .withValues(
                                                            alpha: 0.9)),
                                                child: SizedBox(
                                                  width: 20.w,
                                                  child: Text(
                                                    player.fullName!
                                                        .split(' ')
                                                        .last,
                                                    style: globalTextStyle2(
                                                        fontSize: 6.sp,
                                                        color: AppColors.dark),
                                                    textAlign: TextAlign.start,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 1,
                                                  ),
                                                ),
                                              ),
                                              verticalSpace(5.h),
                                              Container(
                                                alignment: Alignment.center,
                                                padding: EdgeInsets.all(1.r),
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: AppColors.white
                                                        .withValues(
                                                            alpha: 0.9)),
                                                child: Text(
                                                  player.jerseyNumber ?? '',
                                                  style: globalTextStyle2(
                                                      fontSize: 8.sp,
                                                      color: AppColors.dark),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                              ],
                            )
                          : player.imageUrl != null
                              ? player.imageUrl!.endsWith('svg')
                                  ? SvgPicture.network(
                                      player.imageUrl!,
                                      height: 50,
                                      width: 50,
                                    )
                                  : FadeInImage.assetNetwork(
                                      placeholder: AppImages.userPlaceHolder,
                                      image: player.imageUrl!,
                                      width: 50,
                                      height: 50,
                                      fadeInDuration:
                                          const Duration(milliseconds: 300),
                                      imageErrorBuilder:
                                          (context, error, stackTrace) {
                                        return Image.asset(
                                          AppImages.userPlaceHolder,
                                          width: 50,
                                          height: 50,
                                        );
                                      })
                              : Image.asset(
                                  AppImages.userPlaceHolder,
                                  height: 50,
                                  width: 50,
                                )
                      : player.imageUrl != null
                          ? player.imageUrl!.endsWith('.svg')
                              ? controller.sportName == 'CR'
                                  ? Image.network(
                                      replaceSvgWithPng(player.imageUrl!),
                                      height: 50,
                                      width: 50)
                                  : SvgPicture.network(
                                      player.imageUrl!,
                                      height: 50,
                                      width: 50,
                                    )
                              : Image.network(player.imageUrl!,
                                  height: 50, width: 50)
                          : Image.asset(
                              AppImages.userPlaceHolder,
                              height: 50,
                              width: 50,
                            ),
                );
              }),
              ...controller.selectedPlayersPlaceholders.map((placeholder) {
                return Image.asset(
                  'assets/new_images/playeplaceholder.png',
                  height: 50,
                  width: 50,
                );
              }),
              GestureDetector(
                onTap: () {
                  controller.removeSelectedPLayers();
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.circular(2.5.r),
                  ),
                  child: Container(
                    height: 50,
                    width: 50,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(2.5.r),
                    ),
                    child: Image.asset('assets/new_images/clear_all.png'),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
