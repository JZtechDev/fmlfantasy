import 'package:fmlfantasy/app/app_images/app_images.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/ui/components/inner_appbar.dart';
import 'package:fmlfantasy/ui/helpers/replace_svg_with_png.dart';
import 'package:fmlfantasy/ui/views/bull_player/controller/bull_player_controller.dart';
import 'package:fmlfantasy/ui/views/bull_player/widget/preview_players_card.dart';
import 'package:flutter_svg/svg.dart';

class TeamPreviewScreen extends GetView<BullPlayerController> {
  const TeamPreviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey,
      appBar: const AppBarInner(
        title: '',
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned.fill(
              child: Image.asset(
                  fit: BoxFit.fill,
                  controller.getPitchesImages(controller.sportName))),
          Positioned(
            top: 40.h,
            child: Obx(
              () {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (controller.selectedPlayers.isNotEmpty)
                      Center(
                        child: Column(
                          children: [
                            controller.sportName == 'FB'
                                ? controller.selectedPlayers[0].imageUrl == null
                                    ? Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          controller.selectedPlayers[0]
                                                      .jerseyImageUrl ==
                                                  null
                                              ? Image.asset(
                                                  excludeFromSemantics: true,
                                                  isAntiAlias: true,
                                                  AppImages.userPlaceHolder,
                                                  width: Get.width * 0.15,
                                                  fit: BoxFit.fill,
                                                )
                                              : controller.selectedPlayers[0]
                                                      .jerseyImageUrl!
                                                      .endsWith('svg')
                                                  ? SvgPicture.network(
                                                      controller
                                                          .selectedPlayers[0]
                                                          .jerseyImageUrl!,
                                                      width: 70,
                                                      fit: BoxFit.fill,
                                                    )
                                                  : FadeInImage.assetNetwork(
                                                      placeholder: AppImages
                                                          .userPlaceHolder,
                                                      image: controller
                                                          .selectedPlayers[0]
                                                          .jerseyImageUrl!,
                                                      width: 70,
                                                      fadeInDuration:
                                                          const Duration(
                                                              milliseconds:
                                                                  300),
                                                      imageErrorBuilder:
                                                          (context, error,
                                                              stackTrace) {
                                                        return Image.asset(
                                                          AppImages
                                                              .userPlaceHolder,
                                                          width: 70,
                                                        );
                                                      },
                                                    ),
                                          controller.selectedPlayers[0]
                                                      .jerseyImageUrl ==
                                                  null
                                              ? Image.asset(
                                                  excludeFromSemantics: true,
                                                  isAntiAlias: true,
                                                  AppImages.userPlaceHolder,
                                                  width: Get.width * 0.15,
                                                  fit: BoxFit.fill,
                                                )
                                              : Align(
                                                  alignment:
                                                      Alignment.topCenter,
                                                  widthFactor: 0.68.w,
                                                  child: SizedBox(
                                                    width: 70.w,
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Container(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 2.w,
                                                                  right: 2.w,
                                                                  top: 1.h,
                                                                  bottom: 1.h),
                                                          decoration: BoxDecoration(
                                                              borderRadius: BorderRadius
                                                                  .all(Radius
                                                                      .circular(
                                                                          2.r)),
                                                              color: AppColors
                                                                  .white
                                                                  .withValues(
                                                                      alpha:
                                                                          0.9)),
                                                          child: SizedBox(
                                                            width: 22.w,
                                                            child: Text(
                                                              controller
                                                                  .selectedPlayers[
                                                                      0]
                                                                  .fullName!
                                                                  .split(' ')
                                                                  .last,
                                                              style: globalTextStyle2(
                                                                  fontSize:
                                                                      6.sp,
                                                                  color:
                                                                      AppColors
                                                                          .dark),
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              maxLines: 1,
                                                            ),
                                                          ),
                                                        ),
                                                        verticalSpace(5.h),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          padding:
                                                              EdgeInsets.all(
                                                                  1.r),
                                                          decoration: BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
                                                              color: AppColors
                                                                  .white
                                                                  .withValues(
                                                                      alpha:
                                                                          0.9)),
                                                          child: Text(
                                                            controller
                                                                    .selectedPlayers[
                                                                        0]
                                                                    .jerseyNumber ??
                                                                '',
                                                            style: globalTextStyle2(
                                                                fontSize: 10.sp,
                                                                color: AppColors
                                                                    .dark),
                                                            textAlign: TextAlign
                                                                .center,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                        ],
                                      )
                                    : controller.selectedPlayers[0].imageUrl ==
                                            null
                                        ? Image.asset(
                                            excludeFromSemantics: true,
                                            isAntiAlias: true,
                                            AppImages.userPlaceHolder,
                                            width: Get.width * 0.15,
                                            fit: BoxFit.fill,
                                          )
                                        : controller
                                                .selectedPlayers[0].imageUrl!
                                                .endsWith('svg')
                                            ? SvgPicture.network(
                                                controller.selectedPlayers[0]
                                                    .imageUrl!,
                                                width: 70,
                                                fit: BoxFit.fill,
                                              )
                                            : FadeInImage.assetNetwork(
                                                placeholder:
                                                    AppImages.userPlaceHolder,
                                                image: controller
                                                    .selectedPlayers[0]
                                                    .imageUrl!,
                                                width: 70,
                                                fadeInDuration: const Duration(
                                                    milliseconds: 300),
                                                imageErrorBuilder: (context,
                                                    error, stackTrace) {
                                                  return Image.asset(
                                                    AppImages.userPlaceHolder,
                                                    width: 70,
                                                  );
                                                },
                                              )
                                : controller.selectedPlayers[0].imageUrl == null
                                    ? Image.asset(
                                        excludeFromSemantics: true,
                                        isAntiAlias: true,
                                        AppImages.userPlaceHolder,
                                        width: Get.width * 0.15,
                                        fit: BoxFit.fill,
                                      )
                                    : controller.selectedPlayers[0].imageUrl!
                                            .endsWith('svg')
                                        ? controller.sportName == 'CR'
                                            ? Image.network(
                                                replaceSvgWithPng(controller
                                                    .selectedPlayers[0]
                                                    .imageUrl!),
                                                width: 70.w,
                                              )
                                            : SvgPicture.network(
                                                controller.selectedPlayers[0]
                                                    .imageUrl!,
                                                width: 70.h,
                                              )
                                        : FadeInImage.assetNetwork(
                                            placeholder:
                                                AppImages.userPlaceHolder,
                                            image: controller
                                                .selectedPlayers[0].imageUrl!,
                                            width: 70,
                                            fadeInDuration: const Duration(
                                                milliseconds: 300),
                                            imageErrorBuilder:
                                                (context, error, stackTrace) {
                                              return Image.asset(
                                                AppImages.userPlaceHolder,
                                                width: 70,
                                              );
                                            },
                                          ),
                            SizedBox(
                              width: Get.width * 0.25,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  controller.selectedPlayers[0].isBull.value
                                      ? SvgPicture.asset(
                                          AppImages.star,
                                          // ignore: deprecated_member_use
                                          color: AppColors.errorRed,
                                        )
                                      : Container(),
                                  SizedBox(
                                    width: Get.width * 0.2,
                                    child: Text(
                                      controller.selectedPlayers[0].fullName!,
                                      style: globalTextStyle(fontSize: 12.sp),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    verticalSpace(30.h),
                    for (int index = 1;
                        index < controller.selectedPlayers.length;
                        index += 3)
                      Wrap(
                        spacing: 30.w.w,
                        children: [
                          if (index < controller.selectedPlayers.length)
                            PreviewPlayerCards(
                                player: controller.selectedPlayers[index]),
                          if (index + 1 < controller.selectedPlayers.length)
                            PreviewPlayerCards(
                                player: controller.selectedPlayers[index + 1]),
                          if (index + 2 < controller.selectedPlayers.length)
                            PreviewPlayerCards(
                                player: controller.selectedPlayers[index + 2]),
                        ],
                      ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
