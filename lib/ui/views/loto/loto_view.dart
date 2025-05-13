import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/ui/components/inner_appbar.dart';
import 'package:fmlfantasy/ui/views/loto/loto_controller/loto_controller.dart';
import 'package:fmlfantasy/ui/views/loto/widgets/bottom_container.dart';
import 'package:fmlfantasy/ui/views/loto/widgets/draw_container.dart';
import 'package:fmlfantasy/ui/views/loto/widgets/skeleton.dart';
import 'package:fmlfantasy/ui/views/loto/widgets/top_container.dart';
import 'package:fmlfantasy/ui/widgets/primary_button.dart';

class CreateLotoView extends GetView<LotoController> {
  const CreateLotoView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LotoController());
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.grey,
        appBar: const AppBarInner(
          title: 'select players',
        ),
        body: FutureBuilder(
            future: controller.selectTeam,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const LotoSkeleton();
              } else if (snapshot.hasError) {
                return const Center(child: Text('Server Error'));
              } else {
                final teams = snapshot.data!;
                controller.homeTeamKey = teams.homeTeam!.assetCode!;
                controller.awayTeamKey = teams.awayTeam!.assetCode!;
                controller.homeTeamName = teams.homeTeam!.name!;
                controller.awayTeamName = teams.awayTeam!.name!;
                return CustomScrollView(
                  slivers: [
                    SliverAppBar(
                        automaticallyImplyLeading: false,
                        pinned: true,
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        collapsedHeight: 140.h,
                        flexibleSpace: LotoTopContainer(
                          selectTeam: teams,
                        )),
                    SliverToBoxAdapter(
                        child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 10.h, horizontal: 10.w),
                      child: Obx(
                        () => Column(
                          children: [
                            ...controller.drawsList
                                .asMap()
                                .entries
                                .map((drawEntry) {
                              int drawIndex = drawEntry.key;
                              var draw = drawEntry.value.players;
                              var winner = drawEntry.value.winner;
                              var drawId = drawEntry.value.drawId;
                              controller.drawIndexs.value = drawIndex;
                              return Column(
                                children: [
                                  DrawContainer(
                                      drawIndex: drawIndex,
                                      draw: draw,
                                      winner: winner,
                                      drawId: drawId,
                                      teams: teams),
                                  // Container(
                                  //   padding: EdgeInsets.symmetric(
                                  //       horizontal: 5.w, vertical: 5.h),
                                  //   decoration: BoxDecoration(
                                  //     color: AppColors.white,
                                  //     border: const Border(
                                  //       bottom: BorderSide(
                                  //         color: AppColors.borderColor,
                                  //         width: 1,
                                  //       ),
                                  //     ),
                                  //     borderRadius: BorderRadius.circular(5.r),
                                  //   ),
                                  //   child: Column(
                                  //     children: [
                                  //       Container(
                                  //         padding: EdgeInsets.symmetric(
                                  //             vertical: 15.h, horizontal: 10.w),
                                  //         decoration: BoxDecoration(
                                  //             color: AppColors.grey,
                                  //             borderRadius:
                                  //                 BorderRadius.circular(5.r)),
                                  //         child: Row(
                                  //           mainAxisAlignment:
                                  //               MainAxisAlignment.spaceBetween,
                                  //           children: [
                                  //             Text(
                                  //               'draws'.tr,
                                  //               style: globalTextStyle2(
                                  //                   fontSize:
                                  //                       AppSizing.isMobile(
                                  //                               context)
                                  //                           ? 14.sp
                                  //                           : 10.sp,
                                  //                   color: AppColors.dark,
                                  //                   fontWeight:
                                  //                       FontWeight.w500),
                                  //             ),
                                  //             Text(
                                  //               // ignore: unrelated_type_equality_checks
                                  //               drawId == 0
                                  //                   ? '-'
                                  //                   : "#${drawId.value.toString()}",
                                  //               style: globalTextStyle2(
                                  //                   fontSize: 12.sp,
                                  //                   color: AppColors.dark,
                                  //                   fontWeight:
                                  //                       FontWeight.w600),
                                  //             ),
                                  //           ],
                                  //         ),
                                  //       ),
                                  //       verticalSpace(10.h),
                                  //       Wrap(
                                  //         spacing: 10.w,
                                  //         runSpacing: 10.h,
                                  //         children: [
                                  //           ...draw
                                  //               .asMap()
                                  //               .entries
                                  //               .map((entry) {
                                  //             int index = entry.key;
                                  //             var players = entry.value;
                                  //             return GestureDetector(
                                  //               onTap: () {
                                  //                 drawId.value == 0
                                  //                     ? null
                                  //                     : drawId.value == 0
                                  //                         ? controller.sportName ==
                                  //                                 'FB'
                                  //                             ? players.fullName ==
                                  //                                         '' &&
                                  //                                     players.jerseyImageUrl ==
                                  //                                         ''
                                  //                                 ? null
                                  //                                 : Get.to(() =>
                                  //                                     LotoSelectPlayerView(
                                  //                                       playerIndex:
                                  //                                           index,
                                  //                                       selectplayer:
                                  //                                           teams,
                                  //                                       drawIndex:
                                  //                                           drawIndex,
                                  //                                     ))
                                  //                             : players.fullName ==
                                  //                                         '' &&
                                  //                                     players.imageUrl ==
                                  //                                         ''
                                  //                                 ? null
                                  //                                 : Get.to(() =>
                                  //                                     LotoSelectPlayerView(
                                  //                                       playerIndex:
                                  //                                           index,
                                  //                                       selectplayer:
                                  //                                           teams,
                                  //                                       drawIndex:
                                  //                                           drawIndex,
                                  //                                     ))
                                  //                         : null;
                                  //               },
                                  //               child: Column(
                                  //                 crossAxisAlignment:
                                  //                     CrossAxisAlignment.start,
                                  //                 mainAxisSize:
                                  //                     MainAxisSize.min,
                                  //                 children: [
                                  //                   SizedBox(
                                  //                     height:
                                  //                         AppSizing.isMobile(
                                  //                                 context)
                                  //                             ? 120.h
                                  //                             : 110.h,
                                  //                     width: AppSizing.isMobile(
                                  //                             context)
                                  //                         ? Get.width * 0.42
                                  //                         : Get.width * 0.28,
                                  //                     child: Row(
                                  //                       mainAxisAlignment:
                                  //                           MainAxisAlignment
                                  //                               .start,
                                  //                       children: [
                                  //                         Expanded(
                                  //                           child: Container(
                                  //                             constraints:
                                  //                                 BoxConstraints(
                                  //                                     maxHeight:
                                  //                                         150.h),
                                  //                             decoration:
                                  //                                 BoxDecoration(
                                  //                               color: AppColors
                                  //                                   .grey,
                                  //                               borderRadius:
                                  //                                   BorderRadius
                                  //                                       .circular(
                                  //                                           2.5.r),
                                  //                             ),
                                  //                             child: controller
                                  //                                         .sportName ==
                                  //                                     'FB'
                                  //                                 ? players.imageUrl ==
                                  //                                         null
                                  //                                     ? Stack(
                                  //                                         clipBehavior:
                                  //                                             Clip.hardEdge,
                                  //                                         alignment:
                                  //                                             Alignment.center,
                                  //                                         children: [
                                  //                                           players.jerseyImageUrl == null || players.jerseyImageUrl!.isEmpty
                                  //                                               ? Image.asset('assets/images/userplaceholdertwo.png')
                                  //                                               : players.jerseyImageUrl == ''
                                  //                                                   ? Image.asset('assets/images/userplaceholdertwo.png')
                                  //                                                   : players.jerseyImageUrl!.endsWith('.svg')
                                  //                                                       ? SvgPicture.network(
                                  //                                                           players.jerseyImageUrl ?? '',
                                  //                                                         )
                                  //                                                       : Image.network(
                                  //                                                           players.jerseyImageUrl ?? '',
                                  //                                                         ),
                                  //                                           players.jerseyImageUrl == null || players.jerseyImageUrl!.isEmpty
                                  //                                               ? const SizedBox()
                                  //                                               : Align(
                                  //                                                   heightFactor: 0.85,
                                  //                                                   alignment: Alignment.bottomCenter,
                                  //                                                   child: Column(
                                  //                                                     mainAxisAlignment: MainAxisAlignment.center,
                                  //                                                     crossAxisAlignment: CrossAxisAlignment.center,
                                  //                                                     children: [
                                  //                                                       players.fullName == null || players.fullName!.isEmpty
                                  //                                                           ? const SizedBox()
                                  //                                                           : Container(
                                  //                                                               width: 50.w,
                                  //                                                               padding: EdgeInsets.only(
                                  //                                                                 left: 2.w,
                                  //                                                                 right: 2.w,
                                  //                                                                 top: 1.h,
                                  //                                                                 bottom: 1.h,
                                  //                                                               ),
                                  //                                                               alignment: Alignment.center,
                                  //                                                               decoration: BoxDecoration(color: AppColors.white.withValues(alpha:0.9), borderRadius: BorderRadius.circular(2.r)),
                                  //                                                               child: Text(
                                  //                                                                 textAlign: TextAlign.center,
                                  //                                                                 players.fullName!.split(' ').last,
                                  //                                                                 style: globalTextStyle(fontSize: 8.sp, color: AppColors.dark),
                                  //                                                               ),
                                  //                                                             ),
                                  //                                                       verticalSpace(10.h),
                                  //                                                       Container(
                                  //                                                         padding: const EdgeInsets.all(5),
                                  //                                                         decoration: BoxDecoration(
                                  //                                                           shape: BoxShape.circle,
                                  //                                                           color: AppColors.white.withValues(alpha:0.9),
                                  //                                                         ),
                                  //                                                         child: Text(
                                  //                                                           players.jerseyNumber ?? '',
                                  //                                                           style: globalTextStyle2(fontSize: 8.sp, color: AppColors.dark),
                                  //                                                           textAlign: TextAlign.center,
                                  //                                                         ),
                                  //                                                       ),
                                  //                                                     ],
                                  //                                                   ),
                                  //                                                 ),
                                  //                                         ],
                                  //                                       )
                                  //                                     : players.imageUrl == null ||
                                  //                                             players
                                  //                                                 .imageUrl!.isEmpty
                                  //                                         ? Image.asset(
                                  //                                             'assets/images/userplaceholdertwo.png')
                                  //                                         : players.imageUrl ==
                                  //                                                 ''
                                  //                                             ? Image.asset(
                                  //                                                 'assets/images/userplaceholdertwo.png')
                                  //                                             : players.imageUrl!.endsWith(
                                  //                                                     '.svg')
                                  //                                                 ? SvgPicture
                                  //                                                     .network(
                                  //                                                     players.imageUrl ?? '',
                                  //                                                   )
                                  //                                                 : Image
                                  //                                                     .network(
                                  //                                                     players.imageUrl ?? '',
                                  //                                                   )
                                  //                                 : players.imageUrl ==
                                  //                                             null ||
                                  //                                         players
                                  //                                             .imageUrl!
                                  //                                             .isEmpty
                                  //                                     ? Image.asset(
                                  //                                         'assets/images/userplaceholdertwo.png')
                                  //                                     : players.imageUrl ==
                                  //                                             ''
                                  //                                         ? Image.asset('assets/images/userplaceholdertwo.png')
                                  //                                         : players.imageUrl!.endsWith('.svg')
                                  //                                             ? controller.sportName == 'CR'
                                  //                                                 ? Image.network(
                                  //                                                     replaceSvgWithPng(players.imageUrl!),
                                  //                                                   )
                                  //                                                 : SvgPicture.network(
                                  //                                                     players.imageUrl ?? '',
                                  //                                                   )
                                  //                                             : Image.network(
                                  //                                                 players.imageUrl ?? '',
                                  //                                               ),
                                  //                           ),
                                  //                         ),
                                  //                         horizontalSpace(5.w),
                                  //                         Container(
                                  //                           alignment: Alignment
                                  //                               .center,
                                  //                           padding: EdgeInsets.symmetric(
                                  //                               horizontal:
                                  //                                   AppSizing.isMobile(
                                  //                                           context)
                                  //                                       ? 10.w
                                  //                                       : 7.w),
                                  //                           height: AppSizing
                                  //                                   .isMobile(
                                  //                                       context)
                                  //                               ? 100.h
                                  //                               : 100.h,
                                  //                           decoration:
                                  //                               BoxDecoration(
                                  //                             color: AppColors
                                  //                                 .navyBlue,
                                  //                             borderRadius:
                                  //                                 BorderRadius
                                  //                                     .circular(
                                  //                                         5.r),
                                  //                           ),
                                  //                           child: Column(
                                  //                             mainAxisAlignment:
                                  //                                 MainAxisAlignment
                                  //                                     .center,
                                  //                             children: [
                                  //                               SvgPicture
                                  //                                   .asset(
                                  //                                 'assets/icons/publictournament.svg',
                                  //                                 // ignore: deprecated_member_use
                                  //                                 color:
                                  //                                     AppColors
                                  //                                         .white,
                                  //                                 height: 15.h,
                                  //                                 width: 15.w,
                                  //                               ),
                                  //                               verticalSpace(
                                  //                                   5.h),
                                  //                               Text(
                                  //                                 "${index + 1}"
                                  //                                     .toString()
                                  //                                     .padLeft(
                                  //                                         2,
                                  //                                         '0'),
                                  //                                 style: globalTextStyle(
                                  //                                     fontSize: AppSizing.isMobile(
                                  //                                             context)
                                  //                                         ? 12
                                  //                                             .sp
                                  //                                         : 10
                                  //                                             .sp,
                                  //                                     fontWeight:
                                  //                                         FontWeight
                                  //                                             .w600,
                                  //                                     color: AppColors
                                  //                                         .white),
                                  //                               ),
                                  //                             ],
                                  //                           ),
                                  //                         )
                                  //                       ],
                                  //                     ),
                                  //                   ),
                                  //                   players.fullName == null
                                  //                       ? PrimaryButton(
                                  //                           iconPath: AppImages
                                  //                               .addIcon,
                                  //                           padding: 0,
                                  //                           buttonWidth: AppSizing
                                  //                                   .isMobile(
                                  //                                       context)
                                  //                               ? Get.width *
                                  //                                   0.42
                                  //                               : Get.width *
                                  //                                   0.28,
                                  //                           buttonText:
                                  //                               'select'.tr,
                                  //                           onPressed: () {
                                  //                             Get.to(() =>
                                  //                                 LotoSelectPlayerView(
                                  //                                   playerIndex:
                                  //                                       index,
                                  //                                   selectplayer:
                                  //                                       teams,
                                  //                                   drawIndex:
                                  //                                       drawIndex,
                                  //                                 ));
                                  //                           },
                                  //                           isEnabled: true)
                                  //                       : Column(
                                  //                           crossAxisAlignment:
                                  //                               CrossAxisAlignment
                                  //                                   .start,
                                  //                           mainAxisAlignment:
                                  //                               MainAxisAlignment
                                  //                                   .start,
                                  //                           children: [
                                  //                             SizedBox(
                                  //                               width: AppSizing
                                  //                                       .isMobile(
                                  //                                           context)
                                  //                                   ? Get.width *
                                  //                                       0.4
                                  //                                   : Get.width *
                                  //                                       0.28,
                                  //                               child: Text(
                                  //                                 textAlign:
                                  //                                     TextAlign
                                  //                                         .center,
                                  //                                 maxLines: 1,
                                  //                                 overflow:
                                  //                                     TextOverflow
                                  //                                         .ellipsis,
                                  //                                 players.fullName ??
                                  //                                     '-',
                                  //                                 style: globalTextStyle(
                                  //                                     fontSize: AppSizing.isMobile(
                                  //                                             context)
                                  //                                         ? 12
                                  //                                             .sp
                                  //                                         : 8
                                  //                                             .sp,
                                  //                                     color: AppColors
                                  //                                         .dark),
                                  //                               ),
                                  //                             ),
                                  //                             verticalSpace(
                                  //                                 2.h),
                                  //                             SizedBox(
                                  //                               width: AppSizing
                                  //                                       .isMobile(
                                  //                                           context)
                                  //                                   ? Get.width *
                                  //                                       0.4
                                  //                                   : Get.width *
                                  //                                       0.28,
                                  //                               child: Text(
                                  //                                 maxLines: 1,
                                  //                                 overflow:
                                  //                                     TextOverflow
                                  //                                         .ellipsis,
                                  //                                 players.teamName ??
                                  //                                     '-',
                                  //                                 style: globalTextStyle(
                                  //                                     fontSize: AppSizing.isMobile(
                                  //                                             context)
                                  //                                         ? 12
                                  //                                             .sp
                                  //                                         : 8
                                  //                                             .sp,
                                  //                                     color: AppColors
                                  //                                         .textGray),
                                  //                                 textAlign:
                                  //                                     TextAlign
                                  //                                         .center,
                                  //                               ),
                                  //                             ),
                                  //                           ],
                                  //                         ),
                                  //                 ],
                                  //               ),
                                  //             );
                                  //           }),
                                  //           Column(
                                  //             children: [
                                  //               Container(
                                  //                   padding: EdgeInsets.only(
                                  //                       left: 10.h,
                                  //                       right: 10.h,
                                  //                       top: 10.h,
                                  //                       bottom: 10.h),
                                  //                   margin: EdgeInsets.only(
                                  //                       top: 10.h),
                                  //                   width: AppSizing.isMobile(
                                  //                           context)
                                  //                       ? Get.width * 0.42
                                  //                       : Get.width * 0.28,
                                  //                   decoration: BoxDecoration(
                                  //                     color: AppColors.grey,
                                  //                     borderRadius:
                                  //                         BorderRadius.circular(
                                  //                             2.5.r),
                                  //                   ),
                                  //                   child: winner.id == 3
                                  //                       ? Row(
                                  //                           mainAxisAlignment:
                                  //                               MainAxisAlignment
                                  //                                   .center,
                                  //                           children: [
                                  //                             teams.homeTeam!
                                  //                                         .imageUrl ==
                                  //                                     null
                                  //                                 ? Container()
                                  //                                 : SizedBox(
                                  //                                     width:
                                  //                                         45.w,
                                  //                                     child: teams
                                  //                                             .homeTeam!
                                  //                                             .imageUrl!
                                  //                                             .endsWith('svg')
                                  //                                         ? controller.sportName == 'CR'
                                  //                                             ? Image.network(replaceSvgWithPng(teams.homeTeam!.imageUrl!))
                                  //                                             : SvgPicture.network(
                                  //                                                 teams.homeTeam!.imageUrl!,
                                  //                                                 height: 50.h,
                                  //                                                 width: 50.w,
                                  //                                               )
                                  //                                         : Image.network(
                                  //                                             teams.homeTeam!.imageUrl!,
                                  //                                             height: 50.h,
                                  //                                             width: 50.w,
                                  //                                           ),
                                  //                                   ),
                                  //                             horizontalSpace(
                                  //                                 10.w),
                                  //                             teams.awayTeam!
                                  //                                         .imageUrl ==
                                  //                                     null
                                  //                                 ? Container()
                                  //                                 : SizedBox(
                                  //                                     width:
                                  //                                         45.w,
                                  //                                     child: teams
                                  //                                             .awayTeam!
                                  //                                             .imageUrl!
                                  //                                             .endsWith('svg')
                                  //                                         ? controller.sportName == 'CR'
                                  //                                             ? Image.network(
                                  //                                                 replaceSvgWithPng(teams.awayTeam!.imageUrl!),
                                  //                                                 height: 50.h,
                                  //                                                 width: 50.w,
                                  //                                               )
                                  //                                             : SvgPicture.network(
                                  //                                                 teams.awayTeam!.imageUrl!,
                                  //                                                 height: 50.h,
                                  //                                                 width: 50.w,
                                  //                                               )
                                  //                                         : Image.network(
                                  //                                             teams.awayTeam!.imageUrl!,
                                  //                                             height: 50.h,
                                  //                                             width: 50.w,
                                  //                                           ),
                                  //                                   )
                                  //                           ],
                                  //                         )
                                  //                       : winner.imageUrl == ''
                                  //                           ? Image.asset(
                                  //                               AppImages
                                  //                                   .winnerPlaceholder,
                                  //                               height: 60.h,
                                  //                             )
                                  //                           : winner.imageUrl
                                  //                                   .endsWith(
                                  //                                       'svg')
                                  //                               ? controller.sportName ==
                                  //                                       'CR'
                                  //                                   ? Image.network(
                                  //                                       replaceSvgWithPng(winner
                                  //                                           .imageUrl),
                                  //                                       height: 60
                                  //                                           .h)
                                  //                                   : SvgPicture.network(
                                  //                                       winner
                                  //                                           .imageUrl,
                                  //                                       height:
                                  //                                           60.h)
                                  //                               : Image.network(
                                  //                                   winner
                                  //                                       .imageUrl,
                                  //                                   height:
                                  //                                       60.h,
                                  //                                 )),
                                  //               verticalSpace(2.h),
                                  //               Container(
                                  //                 width: AppSizing.isMobile(
                                  //                         context)
                                  //                     ? Get.width * 0.42
                                  //                     : Get.width * 0.28,
                                  //                 alignment: Alignment.center,
                                  //                 padding: EdgeInsets.symmetric(
                                  //                     horizontal: 5.w,
                                  //                     vertical: 5.h),
                                  //                 decoration: BoxDecoration(
                                  //                   color: AppColors.navyBlue,
                                  //                   borderRadius:
                                  //                       BorderRadius.circular(
                                  //                           5.r),
                                  //                 ),
                                  //                 child: Row(
                                  //                   mainAxisAlignment:
                                  //                       MainAxisAlignment
                                  //                           .center,
                                  //                   children: [
                                  //                     SvgPicture.asset(
                                  //                       AppImages.reward,
                                  //                       // ignore: deprecated_member_use
                                  //                       color: AppColors.white,
                                  //                       height: 15.h,
                                  //                       width: 15.w,
                                  //                     ),
                                  //                     horizontalSpace(5.w),
                                  //                     Text(
                                  //                       winner.id == 3
                                  //                           ? 'draws'.tr
                                  //                           : 'winner'.tr,
                                  //                       style: globalTextStyle(
                                  //                           fontSize: AppSizing
                                  //                                   .isMobile(
                                  //                                       context)
                                  //                               ? 12.sp
                                  //                               : 10.sp,
                                  //                           fontWeight:
                                  //                               FontWeight.w600,
                                  //                           color: AppColors
                                  //                               .white),
                                  //                     ),
                                  //                   ],
                                  //                 ),
                                  //               ),
                                  //               verticalSpace(5.h),
                                  //               drawId.value == 0
                                  //                   ? PrimaryButton(
                                  //                       iconPath:
                                  //                           AppImages.addIcon,
                                  //                       padding: 0,
                                  //                       buttonWidth: AppSizing
                                  //                               .isMobile(
                                  //                                   context)
                                  //                           ? Get.width * 0.42
                                  //                           : Get.width * 0.28,
                                  //                       buttonText: 'select'.tr,
                                  //                       onPressed: () {
                                  //                         showDialog(
                                  //                             context: context,
                                  //                             builder:
                                  //                                 (BuildContext
                                  //                                     context) {
                                  //                               return WinnerModal(
                                  //                                 teams: teams,
                                  //                                 drawIndex:
                                  //                                     drawIndex,
                                  //                               );
                                  //                             });
                                  //                       },
                                  //                       isEnabled: controller
                                  //                                   .drawsList[
                                  //                                       drawIndex]
                                  //                                   .players
                                  //                                   .where((element) =>
                                  //                                       element
                                  //                                           .assetCode !=
                                  //                                       '')
                                  //                                   .length ==
                                  //                               5
                                  //                           ? true
                                  //                           : false,
                                  //                     )
                                  //                   : Container(
                                  //                       width: Get.width * 0.42,
                                  //                     )
                                  //             ],
                                  //           ),
                                  //           verticalSpace(10.h),
                                  //           PrimaryButton(
                                  //             padding: 0,
                                  //             buttonText: 'remove'.tr,
                                  //             onPressed: () {
                                  //               drawId.value == 0
                                  //                   ? controller
                                  //                       .removeDraw(drawIndex)
                                  //                   : controller.deleteDraw(
                                  //                       drawId.value.toString(),
                                  //                       drawIndex);
                                  //             },
                                  //             isEnabled: true,
                                  //             backgroundColor:
                                  //                 AppColors.errorRed,
                                  //             textColor: AppColors.white,
                                  //           )
                                  //         ],
                                  //       ),
                                  //       verticalSpace(10.h),
                                  //     ],
                                  //   ),
                                  // ),
                                  verticalSpace(10.h),
                                ],
                              );
                            }),
                            PrimaryButton(
                                backgroundColor: AppColors.white,
                                textColor: AppColors.dark,
                                buttonText: 'addDraw'.tr,
                                onPressed: () {
                                  controller.addDraw();
                                },
                                isEnabled: true)
                          ],
                        ),
                      ),
                    )),
                  ],
                );
              }
            }),
        bottomNavigationBar: const BottomContainer());
  }
}
