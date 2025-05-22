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
      backgroundColor: const Color.fromRGBO(101, 184, 172, 1),
      surfaceTintColor: const Color.fromRGBO(101, 184, 172, 1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0.r),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: SizedBox(
          child: Obx(() {
            InnerMatchCenterModel data = controller.matchCenterInnerData[0];
            MyTeamsModel selectedTeam = controller.selectedTeams;
            log(selectedTeam.id ?? 'Null');
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ...data.playersBreakDown.take(5).map((topPlayer) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            height: Get.height * 0.08,
                            padding: EdgeInsets.symmetric(
                                vertical: 20.h, horizontal: 20.w),
                            decoration: const BoxDecoration(
                                color: Color.fromRGBO(72, 122, 116, 1)),
                            child: Text(
                              topPlayer.rank.toString(),
                              style: globalTextStyle(
                                  fontSize: 14.sp,
                                  color: AppColors.white,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Container(
                            alignment: Alignment.centerRight,
                            padding: EdgeInsets.symmetric(horizontal: 5.w),
                            height: Get.height * 0.08,
                            decoration:
                                const BoxDecoration(color: AppColors.backgroud),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  topPlayer.teamAbbreviation ==
                                          selectedTeam.matchData!.awayShortName!
                                      ? Container(
                                          constraints: BoxConstraints(
                                            maxHeight: 20.h,
                                            maxWidth: 25.w,
                                          ),
                                          child: selectedTeam.matchData!
                                                      .awayImageUrl ==
                                                  null
                                              ? Container()
                                              : selectedTeam
                                                      .matchData!.awayImageUrl!
                                                      .endsWith('.png')
                                                  ? Image.network(
                                                      selectedTeam.matchData!
                                                          .awayImageUrl!,
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
                                                          selectedTeam
                                                              .matchData!
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
                                          child: selectedTeam.matchData!
                                                      .homeImageUrl ==
                                                  null
                                              ? Container()
                                              : selectedTeam
                                                      .matchData!.homeImageUrl!
                                                      .endsWith('.png')
                                                  ? Image.network(
                                                      selectedTeam.matchData!
                                                          .homeImageUrl!,
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
                                                          selectedTeam
                                                              .matchData!
                                                              .homeImageUrl!
                                                              .toString(),
                                                          fit: BoxFit.fill,
                                                        ),
                                        ),
                                  horizontalSpace(10),
                                  SizedBox(
                                    width: Get.width * 0.35,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          topPlayer.name ?? '-',
                                          style: globalTextStyle(
                                              fontSize:
                                                  AppSizing.isMobile(context)
                                                      ? 14.sp
                                                      : 10.sp,
                                              color: AppColors.secondary,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Text(
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          topPlayer.position ?? '-',
                                          style: globalTextStyle(
                                              fontSize:
                                                  AppSizing.isMobile(context)
                                                      ? 12.sp
                                                      : 8.sp,
                                              color: AppColors.white,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            alignment: Alignment.center,
                            height: Get.height * 0.08,
                            decoration:
                                const BoxDecoration(color: AppColors.secondary),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  textAlign: TextAlign.center,
                                  topPlayer.fantasyPoints!.toStringAsFixed(0),
                                  style: globalTextStyle(
                                      fontSize: AppSizing.isMobile(context)
                                          ? 14.sp
                                          : 10.sp,
                                      color: AppColors.backgroud),
                                ),
                                Text(
                                  textAlign: TextAlign.center,
                                  'Points',
                                  style: globalTextStyle(
                                      fontSize: AppSizing.isMobile(context)
                                          ? 12.sp
                                          : 10.sp,
                                      color: AppColors.backgroud),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
                verticalSpace(10.h),
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
