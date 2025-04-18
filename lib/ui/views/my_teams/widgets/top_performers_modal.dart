import 'dart:developer';

import 'package:fmlfantasy/app/app_sizings.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/model/match_center_inner.dart';
import 'package:fmlfantasy/model/my_teams_model.dart';
import 'package:fmlfantasy/ui/helpers/replace_svg_with_png.dart';
import 'package:fmlfantasy/ui/views/my_teams/controller/my_teams_controller.dart';
import 'package:fmlfantasy/ui/widgets/primary_button.dart';
import 'package:flutter_svg/svg.dart';

class TopPerformersModal extends GetView<MyTeamsController> {
  const TopPerformersModal({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.white,
      surfaceTintColor: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0.r),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: SizedBox(
          child: Obx(() {
            InnerMatchCenterModel data = controller.matchCenterInnerData[0];
            MyTeamsModel selectedTeam = controller.selectedTeams;
            log(selectedTeam.id ?? 'Null');
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ...data.playersBreakDown.take(5).map((topPlayer) {
                  return Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.primary, width: 1),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    margin: const EdgeInsets.only(bottom: 10),
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 10),
                    child: Row(
                      children: [
                        Text(
                          topPlayer.rank.toString(),
                          style: globalTextStyle(
                              fontSize: 12.sp, color: AppColors.dark),
                        ),
                        horizontalSpace(20),
                        Expanded(
                          child: Row(
                            children: [
                              topPlayer.teamAbbreviation ==
                                      selectedTeam.matchData!.awayShortName!
                                  ? Container(
                                      constraints: BoxConstraints(
                                        maxHeight: 20.h,
                                        maxWidth: 25.w,
                                      ),
                                      child: selectedTeam
                                                  .matchData!.awayImageUrl ==
                                              null
                                          ? Container()
                                          : selectedTeam
                                                  .matchData!.awayImageUrl!
                                                  .endsWith('.png')
                                              ? Image.network(
                                                  selectedTeam
                                                      .matchData!.awayImageUrl!,
                                                  fit: BoxFit.fill,
                                                )
                                              : controller.selectedSport
                                                          .value ==
                                                      'CR'
                                                  ? Image.network(
                                                      replaceSvgWithPng(
                                                          selectedTeam
                                                              .matchData!
                                                              .awayImageUrl!),
                                                      fit: BoxFit.fill,
                                                    )
                                                  : SvgPicture.network(
                                                      selectedTeam.matchData!
                                                          .awayImageUrl!
                                                          .toString(),
                                                      fit: BoxFit.fill,
                                                    ),
                                    )
                                  : Container(
                                      constraints: BoxConstraints(
                                        maxHeight: 20.h,
                                        maxWidth: 25.w,
                                      ),
                                      child: selectedTeam
                                                  .matchData!.homeImageUrl ==
                                              null
                                          ? Container()
                                          : selectedTeam
                                                  .matchData!.homeImageUrl!
                                                  .endsWith('.png')
                                              ? Image.network(
                                                  selectedTeam
                                                      .matchData!.homeImageUrl!,
                                                  fit: BoxFit.fill,
                                                )
                                              : controller.selectedSport
                                                          .value ==
                                                      'CR'
                                                  ? Image.network(
                                                      replaceSvgWithPng(
                                                          selectedTeam
                                                              .matchData!
                                                              .homeImageUrl!),
                                                      fit: BoxFit.fill,
                                                    )
                                                  : SvgPicture.network(
                                                      selectedTeam.matchData!
                                                          .homeImageUrl!
                                                          .toString(),
                                                      fit: BoxFit.fill,
                                                    ),
                                    ),
                              horizontalSpace(10),
                              SizedBox(
                                width: Get.width * 0.5,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      topPlayer.name ?? '-',
                                      style: globalTextStyle(
                                          fontSize: AppSizing.isMobile(context)
                                              ? 12.sp
                                              : 10.sp,
                                          color: AppColors.dark),
                                    ),
                                    Text(
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      topPlayer.position ?? '-',
                                      style: globalTextStyle(
                                          fontSize: AppSizing.isMobile(context)
                                              ? 10.sp
                                              : 8.sp,
                                          color: AppColors.textGray),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          "${topPlayer.fantasyPoints!.toStringAsFixed(0)} Points",
                          style: globalTextStyle(
                              fontSize:
                                  AppSizing.isMobile(context) ? 12.sp : 10.sp,
                              color: AppColors.textGray),
                        ),
                      ],
                    ),
                  );
                }),
                PrimaryButton(
                    buttonText: 'Back',
                    onPressed: () {
                      Get.back();
                    },
                    isEnabled: true)
              ],
            );
          }),
        ),
      ),
    );
  }
}
