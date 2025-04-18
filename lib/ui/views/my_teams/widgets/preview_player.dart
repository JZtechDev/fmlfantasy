import 'package:fmlfantasy/app/app_images/app_images.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/model/my_teams_players_model.dart';
import 'package:fmlfantasy/ui/views/my_teams/controller/my_teams_controller.dart';
import 'package:flutter_svg/svg.dart';

class PreviewPlayerCard extends GetView<MyTeamsController> {
  final MyTeamPlayersModel player;
  const PreviewPlayerCard({super.key, required this.player});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 30.h),
      child: SizedBox(
        width: Get.width * 0.25,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            controller.selectedSport.value == 'FB'
                ? player.imageUrl == null
                    ? Stack(
                        alignment: Alignment.center,
                        children: [
                          player.jerseyImageUrl == null
                              ? Image.asset(
                                  AppImages.userPlaceHolder,
                                  height: 70,
                                  width: 70,
                                )
                              : player.jerseyImageUrl!.endsWith('.svg')
                                  ? SvgPicture.network(
                                      player.imageUrl!,
                                      height: 70,
                                      width: 70,
                                    )
                                  : Image.network(
                                      player.jerseyImageUrl!,
                                      height: 70,
                                      width: 70,
                                    ),
                          player.jerseyImageUrl == null
                              ? Image.asset(
                                  AppImages.userPlaceHolder,
                                  height: 70,
                                  width: 70,
                                )
                              : Align(
                                  alignment: Alignment.topCenter,
                                  widthFactor: 0.68.w,
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
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(2.r)),
                                              color: AppColors.white
                                                  .withOpacity(0.9)),
                                          child: SizedBox(
                                            width: 22.w,
                                            child: Text(
                                              controller.myTeamPlayers[0].name!
                                                  .split(' ')
                                                  .last,
                                              style: globalTextStyle2(
                                                  fontSize: 6.sp,
                                                  color: AppColors.dark),
                                              textAlign: TextAlign.start,
                                              overflow: TextOverflow.ellipsis,
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
                                                  .withOpacity(0.9)),
                                          child: Text(
                                            controller.myTeamPlayers[0]
                                                    .jerseyNumber ??
                                                '',
                                            style: globalTextStyle2(
                                                fontSize: 10.sp,
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
                    : player.jerseyImageUrl == null
                        ? Image.asset(
                            AppImages.userPlaceHolder,
                            height: 70,
                            width: 70,
                          )
                        : player.imageUrl!.endsWith('.svg')
                            ? SvgPicture.network(
                                player.imageUrl!,
                                height: 70,
                                width: 70,
                              )
                            : Image.network(
                                player.imageUrl!,
                                height: 70,
                                width: 70,
                              )
                : player.imageUrl == null
                    ? Image.asset(
                        AppImages.userPlaceHolder,
                        height: 70,
                        width: 70,
                      )
                    : player.imageUrl!.endsWith('.svg')
                        ? SvgPicture.network(
                            player.imageUrl!,
                            height: 70,
                            width: 70,
                          )
                        : Image.network(
                            player.imageUrl!,
                            height: 70,
                            width: 70,
                          ),
            SizedBox(
              width: Get.width * 0.25,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  player.isCaptain! == true
                      ? SvgPicture.asset(
                          AppImages.star,
                          // ignore: deprecated_member_use
                          color: AppColors.errorRed,
                        )
                      : Container(),
                  SizedBox(
                    width: Get.width * 0.2,
                    child: Text(
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      player.name!,
                      style: globalTextStyle(fontSize: 12.sp),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
