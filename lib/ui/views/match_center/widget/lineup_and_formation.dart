import 'package:fmlfantasy/app/app_sizings.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/model/match_center_inner.dart';
import 'package:fmlfantasy/model/match_center_inner_model.dart';
import 'package:fmlfantasy/ui/helpers/replace_svg_with_png.dart';
import 'package:fmlfantasy/ui/views/match_center/controller/match_center_inner_controller.dart';
import 'package:fmlfantasy/ui/views/match_center/player_details.dart';
import 'package:flutter_svg/svg.dart';

class LineupAndFormation extends GetView<MatchCenterInner> {
  final InnerMatchCenterModel data;
  const LineupAndFormation({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    Get.put(MatchCenterInner());
    return Obx(() {
      List<PlayersBreakDown> filteredPlayers = controller.playersTabIsAway.value
          ? data.playersBreakDown
              .where((player) => player.teamIsAway == true)
              .toList()
          : data.playersBreakDown
              .where((player) => player.teamIsAway == false)
              .toList();
      if (controller.isLineup.value) {
        return Column(
          children: [
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: filteredPlayers.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                PlayersBreakDown topPlayers = filteredPlayers[index];
                return GestureDetector(
                    onTap: () {
                      Get.to(() => PlayerDetails(
                            playersdata: topPlayers,
                          ));
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: Row(children: [
                        Container(
                            padding: const EdgeInsets.all(5),
                            width: 70.w,
                            height: 71.h,
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(5.r),
                                  bottomLeft: Radius.circular(5.r)),
                            ),
                            child: Column(
                              children: [
                                Container(
                                  constraints: BoxConstraints(
                                    maxWidth: 35.w,
                                    maxHeight: 55.h,
                                  ),
                                  child: controller.sportsCode == 'FB'
                                      ? topPlayers.imageUrl == null ||
                                              topPlayers.imageUrl!.isEmpty
                                          ? topPlayers.jerseyImage == null ||
                                                  topPlayers
                                                      .jerseyImage!.isEmpty
                                              ? Container()
                                              : topPlayers.jerseyImage!
                                                      .endsWith('.svg')
                                                  ? SvgPicture.network(
                                                      topPlayers.jerseyImage!,
                                                    )
                                                  : Image.network(
                                                      topPlayers.jerseyImage!,
                                                    )
                                          : topPlayers.imageUrl == null ||
                                                  topPlayers.imageUrl!.isEmpty
                                              ? Container()
                                              : topPlayers.imageUrl!
                                                      .endsWith('.svg')
                                                  ? SvgPicture.network(
                                                      topPlayers.imageUrl!,
                                                    )
                                                  : Image.network(
                                                      topPlayers.imageUrl!,
                                                    )
                                      //Condition for general
                                      : topPlayers.imageUrl == null ||
                                              topPlayers.imageUrl!.isEmpty
                                          ? Container()
                                          : topPlayers.imageUrl!
                                                  .endsWith('.svg')
                                              ? controller.sportsCode == 'CR'
                                                  ? Image.network(
                                                      replaceSvgWithPng(
                                                          topPlayers.imageUrl!),
                                                    )
                                                  : SvgPicture.network(
                                                      topPlayers.imageUrl!,
                                                    )
                                              : Image.network(
                                                  topPlayers.imageUrl!,
                                                ),
                                ),
                                verticalSpace(2.h),
                                Text(
                                  topPlayers.rank.toString().padLeft(2, '0'),
                                  style: globalTextStyle2(
                                      fontWeight: FontWeight.w700,
                                      fontSize: AppSizing.isMobile(context)
                                          ? 14.sp
                                          : 10.sp,
                                      color: AppColors.navyBlue),
                                ),
                              ],
                            )),
                        Expanded(
                          child: Container(
                              alignment: Alignment.center,
                              height: 71.h,
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: AppColors.primaryLight,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    topPlayers.name!,
                                    style: globalTextStyle2(
                                        fontWeight: FontWeight.w700,
                                        fontSize: AppSizing.isMobile(context)
                                            ? 14.sp
                                            : 10.sp,
                                        color: AppColors.white),
                                  ),
                                  verticalSpace(2.h),
                                  Text(
                                    topPlayers.position ?? '-',
                                    style: globalTextStyle2(
                                        fontWeight: FontWeight.w700,
                                        fontSize: AppSizing.isMobile(context)
                                            ? 12.sp
                                            : 8.sp,
                                        color: AppColors.white),
                                  ),
                                ],
                              )),
                        ),
                        Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(5),
                            width: 70.w,
                            height: 71.h,
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(5.r),
                                  bottomRight: Radius.circular(5.r)),
                            ),
                            child:
                                Row(mainAxisSize: MainAxisSize.min, children: [
                              Text(
                                topPlayers.fantasyPoints!.toStringAsFixed(0),
                                style: globalTextStyle2(
                                    fontWeight: FontWeight.w700,
                                    fontSize: AppSizing.isMobile(context)
                                        ? 14.sp
                                        : 8.sp,
                                    color: AppColors.navyBlue),
                              ),
                              horizontalSpace(10.w),
                              Icon(
                                Icons.arrow_forward_outlined,
                                color: AppColors.primary,
                                size:
                                    AppSizing.isMobile(context) ? 12.sp : 10.sp,
                              )
                            ]))
                      ]),
                      //  ListTile(
                      //   style: ListTileStyle.list,
                      //   shape: RoundedRectangleBorder(
                      //     borderRadius: BorderRadius.circular(5.r),
                      //   ),
                      //   trailing:
                      //       Row(mainAxisSize: MainAxisSize.min, children: [
                      //     Text(
                      //       topPlayers.fantasyPoints!.toStringAsFixed(0),
                      //       style: globalTextStyle2(
                      //           fontSize:
                      //               AppSizing.isMobile(context) ? 12.sp : 8.sp,
                      //           color: AppColors.navyBlue),
                      //     ),
                      //     horizontalSpace(10.w),
                      //     Icon(
                      //       Icons.arrow_forward_ios,
                      //       color: AppColors.primary,
                      //       size: AppSizing.isMobile(context) ? 12.sp : 10.sp,
                      //     )
                      //   ]),
                      //   tileColor: AppColors.primaryLight,
                      //   leading: Text(
                      //     topPlayers.rank.toString(),
                      //     style: globalTextStyle2(
                      //         fontSize:
                      //             AppSizing.isMobile(context) ? 12.sp : 10.sp,
                      //         color: AppColors.navyBlue),
                      //   ),
                      //   title: SizedBox(
                      //     width: Get.width * 0.3,
                      //     child: Row(
                      //       children: [
                      //         // Condition For Football
                      //         controller.sportsCode == 'FB'
                      //             ? topPlayers.imageUrl == null ||
                      //                     topPlayers.imageUrl!.isEmpty
                      //                 ? topPlayers.jerseyImage == null ||
                      //                         topPlayers.jerseyImage!.isEmpty
                      //                     ? Container()
                      //                     : topPlayers.jerseyImage!
                      //                             .endsWith('.svg')
                      //                         ? SvgPicture.network(
                      //                             topPlayers.jerseyImage!,
                      //                             height: 30.h,
                      //                             width: 30.w,
                      //                           )
                      //                         : Image.network(
                      //                             topPlayers.jerseyImage!,
                      //                             height: 30.h,
                      //                             width: 30.w,
                      //                           )
                      //                 : topPlayers.imageUrl == null ||
                      //                         topPlayers.imageUrl!.isEmpty
                      //                     ? Container()
                      //                     : topPlayers.imageUrl!
                      //                             .endsWith('.svg')
                      //                         ? SvgPicture.network(
                      //                             topPlayers.imageUrl!,
                      //                             height: 30.h,
                      //                             width: 30.w,
                      //                           )
                      //                         : Image.network(
                      //                             topPlayers.imageUrl!,
                      //                             height: 30.h,
                      //                             width: 30.w,
                      //                           )
                      //             //Condition for general
                      //             : topPlayers.imageUrl == null ||
                      //                     topPlayers.imageUrl!.isEmpty
                      //                 ? Container()
                      //                 : topPlayers.imageUrl!.endsWith('.svg')
                      //                     ? controller.sportsCode == 'CR'
                      //                         ? Image.network(
                      //                             replaceSvgWithPng(
                      //                                 topPlayers.imageUrl!),
                      //                             height: 30.h,
                      //                           )
                      //                         : SvgPicture.network(
                      //                             topPlayers.imageUrl!,
                      //                             height: 30.h,
                      //                             width: 30.w,
                      //                           )
                      //                     : Image.network(
                      //                         topPlayers.imageUrl!,
                      //                         height: 30.h,
                      //                         width: 30.w,
                      //                       ),
                      //         horizontalSpace(5.w),
                      //         Column(
                      //           crossAxisAlignment: CrossAxisAlignment.start,
                      //           children: [
                      //             SizedBox(
                      //               width: Get.width * 0.35,
                      //               child: Text(
                      //                   maxLines: 1,
                      //                   overflow: TextOverflow.ellipsis,
                      //                   topPlayers.name ?? '-',
                      //                   style: globalTextStyle(
                      //                       fontSize:
                      //                           AppSizing.isMobile(context)
                      //                               ? 12.sp
                      //                               : 10.sp,
                      //                       fontWeight: FontWeight.w400)),
                      //             ),
                      //             Text(topPlayers.position ?? '-',
                      //                 style: globalTextStyle2(
                      //                     fontSize: AppSizing.isMobile(context)
                      //                         ? 10.sp
                      //                         : 8.sp,
                      //                     fontWeight: FontWeight.w600,
                      //                     color: AppColors.textGray)),
                      //           ],
                      //         ),
                      //         topPlayers.isStarter == true
                      //             ? Container()
                      //             : SvgPicture.asset(
                      //                 'assets/images/Mobile-Substitution-On.svg',
                      //                 height: 20.h,
                      //                 width: 20.w)
                      //       ],
                      //     ),
                      //   ),
                      // ),
                    ));
              },
            ),
          ],
        );
      } else {
        return Container(
            color: AppColors.white,
            alignment: Alignment.center,
            width: Get.width,
            child: Stack(
              children: [
                Positioned.fill(
                    child: Image.asset(
                  fit: BoxFit.fill,
                  controller.getPitchesImages(controller.sportsCode),
                )),
                Wrap(
                  spacing: 40,
                  runSpacing: 50,
                  alignment: WrapAlignment.center,
                  children: [
                    ...filteredPlayers.map((player) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            controller.sportsCode == 'FB'
                                ? player.imageUrl == null ||
                                        player.imageUrl!.isEmpty
                                    ? player.jerseyImage == null ||
                                            player.jerseyImage!.isEmpty
                                        ? Container()
                                        : player.jerseyImage!.endsWith('.svg')
                                            ? SvgPicture.network(
                                                player.jerseyImage!,
                                                height: 30.h,
                                                width: 30.w,
                                              )
                                            : Image.network(
                                                player.jerseyImage!,
                                                height: 30.h,
                                                width: 30.w,
                                              )
                                    : player.imageUrl == null ||
                                            player.imageUrl!.isEmpty
                                        ? Container()
                                        : player.imageUrl!.endsWith('.svg')
                                            ? SvgPicture.network(
                                                player.imageUrl!,
                                                height: 30.h,
                                                width: 30.w,
                                              )
                                            : Image.network(
                                                player.imageUrl!,
                                                height: 30.h,
                                                width: 30.w,
                                              )
                                //Condition for general
                                : player.imageUrl == null ||
                                        player.imageUrl!.isEmpty
                                    ? Container()
                                    : player.imageUrl!.endsWith('.svg')
                                        ? controller.sportsCode == 'CR'
                                            ? Image.network(
                                                replaceSvgWithPng(
                                                    player.imageUrl!),
                                                height: 30.h,
                                              )
                                            : SvgPicture.network(
                                                player.imageUrl!,
                                                height: 30.h,
                                                width: 30.w,
                                              )
                                        : Image.network(
                                            player.imageUrl!,
                                            height: 30.h,
                                            width: 30.w,
                                          ),
                            verticalSpace(5.h),
                            Text(
                              player.name ?? '-',
                              style: globalTextStyle(
                                  fontSize: AppSizing.isMobile(context)
                                      ? 12.sp
                                      : 10.sp,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      );
                    })
                  ],
                )
              ],
            ));
      }
    });
  }
}
