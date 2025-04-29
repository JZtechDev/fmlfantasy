import 'dart:developer';

import 'package:fmlfantasy/app/app_images/app_images.dart';
import 'package:fmlfantasy/app/app_sizings.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/ui/components/inner_appbar.dart';
import 'package:fmlfantasy/ui/helpers/replace_svg_with_png.dart';
import 'package:fmlfantasy/ui/views/select_players/controller/select_player_controller.dart';
import 'package:fmlfantasy/ui/views/select_players/widgets/bottom_button.dart';
import 'package:fmlfantasy/ui/views/select_players/widgets/filter_container.dart';
import 'package:fmlfantasy/ui/views/select_players/widgets/fliters_button.dart';
import 'package:fmlfantasy/ui/views/select_players/widgets/match_timer.dart';
import 'package:fmlfantasy/ui/views/select_players/widgets/player_grid.dart';
import 'package:fmlfantasy/ui/views/select_players/widgets/skeleton/select_player_skeleton.dart';
import 'package:fmlfantasy/ui/views/select_players/widgets/team_names.dart';
import 'package:fmlfantasy/ui/widgets/app_textfield.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fmlfantasy/ui/widgets/dashboard_button.dart';

class SelectPlayerView extends GetView<SelectPlayerController> {
  const SelectPlayerView({super.key});

  @override
  Widget build(BuildContext context) {
    log('Match');
    final controller = Get.put(SelectPlayerController());
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.backgroud,
        appBar: const AppBarInner(
          title: 'select players',
        ),
        body: LayoutBuilder(builder: (context, constraints) {
          return Stack(
            children: [
              FutureBuilder(
                  future: controller.selectTeam,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Container();
                    } else if (snapshot.hasError) {
                      return const Center(child: Text('Server Error'));
                    } else if (!snapshot.hasData) {
                      return const Center(child: Text('No data available.'));
                    } else {
                      final selectTeam = snapshot.data!;
                      return Obx(() {
                        controller.filterPlayers(selectTeam);
                        return CustomScrollView(slivers: [
                          SliverAppBar(
                              pinned: true,
                              expandedHeight: AppSizing.height(context) * 0.35,
                              automaticallyImplyLeading: false,
                              backgroundColor: Colors.transparent,
                              elevation: 0,
                              flexibleSpace: FlexibleSpaceBar(
                                background: Container(
                                    color: AppColors.backgroud,
                                    child: Column(
                                      children: [
                                        verticalSpace(10),
                                        const DashboardButton(),
                                        TeamsContainer(
                                          homeTeamNme:
                                              selectTeam.homeTeam!.name,
                                          awayTeamName:
                                              selectTeam.awayTeam!.name,
                                          awayTeamImage:
                                              selectTeam.awayTeam!.imageUrl,
                                          homeTeamImage:
                                              selectTeam.homeTeam!.imageUrl,
                                          homeTeamCode:
                                              selectTeam.homeTeam!.assetCode,
                                          awayTeamCode:
                                              selectTeam.awayTeam!.assetCode,
                                        ),
                                        MatchTimer(
                                          key: const ValueKey('MatchTimer'),
                                          startDate: controller
                                              .matchData['ExpStartDate'],
                                        ),
                                        verticalSpace(10),
                                        Obx(
                                          () => Wrap(
                                            runSpacing: 5.h,
                                            children: [
                                              Wrap(
                                                crossAxisAlignment:
                                                    WrapCrossAlignment.center,
                                                alignment: WrapAlignment.start,
                                                runAlignment:
                                                    WrapAlignment.start,
                                                runSpacing: 5.h,
                                                spacing: 5.w,
                                                children: [
                                                  ...controller.selectedPlayers
                                                      .map((player) {
                                                    return controller.sportName ==
                                                            'FB'
                                                        ? player.imageUrl ==
                                                                null
                                                            ? Stack(
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                clipBehavior:
                                                                    Clip.hardEdge,
                                                                children: [
                                                                  player.jerseyImageUrl !=
                                                                          null
                                                                      ? player.jerseyImageUrl!.endsWith(
                                                                              'svg')
                                                                          ? SvgPicture
                                                                              .network(
                                                                              player.jerseyImageUrl!,
                                                                              height: 50,
                                                                              width: 50,
                                                                            )
                                                                          : Image
                                                                              .network(
                                                                              player.jerseyImageUrl!,
                                                                              height: 50,
                                                                              width: 50,
                                                                            )
                                                                      : Image
                                                                          .asset(
                                                                          AppImages
                                                                              .userPlaceHolder,
                                                                          height:
                                                                              50,
                                                                          width:
                                                                              50,
                                                                        ),
                                                                  player.jerseyImageUrl ==
                                                                          null
                                                                      ? Image
                                                                          .asset(
                                                                          AppImages
                                                                              .userPlaceHolder,
                                                                          width:
                                                                              50,
                                                                          height:
                                                                              50,
                                                                        )
                                                                      : Align(
                                                                          alignment:
                                                                              Alignment.topCenter,
                                                                          widthFactor:
                                                                              0.1.w,
                                                                          child:
                                                                              SizedBox(
                                                                            width:
                                                                                70.w,
                                                                            child:
                                                                                Column(
                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                              children: [
                                                                                Container(
                                                                                  padding: EdgeInsets.only(left: 2.w, right: 2.w, top: 1.h, bottom: 1.h),
                                                                                  decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(2.r)), color: AppColors.white.withValues(alpha: 0.9)),
                                                                                  child: SizedBox(
                                                                                    width: 20.w,
                                                                                    child: Text(
                                                                                      player.fullName!.split(' ').last,
                                                                                      style: globalTextStyle2(fontSize: 6.sp, color: AppColors.dark),
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
                                                                                  decoration: BoxDecoration(shape: BoxShape.circle, color: AppColors.white.withOpacity(0.9)),
                                                                                  child: Text(
                                                                                    player.jerseyNumber ?? '',
                                                                                    style: globalTextStyle2(fontSize: 8.sp, color: AppColors.dark),
                                                                                    textAlign: TextAlign.center,
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                ],
                                                              )
                                                            : player.imageUrl !=
                                                                    null
                                                                ? player.imageUrl!.endsWith(
                                                                        'svg')
                                                                    ? SvgPicture
                                                                        .network(
                                                                        player
                                                                            .imageUrl!,
                                                                        height:
                                                                            50,
                                                                        width:
                                                                            50,
                                                                      )
                                                                    : FadeInImage
                                                                        .assetNetwork(
                                                                            placeholder: AppImages
                                                                                .userPlaceHolder,
                                                                            image: player
                                                                                .imageUrl!,
                                                                            width:
                                                                                50,
                                                                            height:
                                                                                50,
                                                                            fadeInDuration: const Duration(
                                                                                milliseconds:
                                                                                    300),
                                                                            imageErrorBuilder: (context, error, stackTrace) {
                                                                              return Image.asset(
                                                                                AppImages.userPlaceHolder,
                                                                                width: 50,
                                                                                height: 50,
                                                                              );
                                                                            })
                                                                : Image.asset(
                                                                    AppImages
                                                                        .userPlaceHolder,
                                                                    height: 50,
                                                                    width: 50,
                                                                  )
                                                        : player.imageUrl !=
                                                                null
                                                            ? player.imageUrl!
                                                                    .endsWith(
                                                                        '.svg')
                                                                ? controller.sportName ==
                                                                        'CR'
                                                                    ? Image.network(
                                                                        replaceSvgWithPng(player
                                                                            .imageUrl!),
                                                                        height:
                                                                            50,
                                                                        width:
                                                                            50)
                                                                    : SvgPicture
                                                                        .network(
                                                                        player
                                                                            .imageUrl!,
                                                                        height:
                                                                            50,
                                                                        width:
                                                                            50,
                                                                      )
                                                                : Image.network(
                                                                    player.imageUrl!,
                                                                    height: 50,
                                                                    width: 50)
                                                            : Image.asset(
                                                                AppImages
                                                                    .userPlaceHolder,
                                                                height: 50,
                                                                width: 50,
                                                              );
                                                  }),
                                                  ...controller
                                                      .selectedPlayersPlaceholders
                                                      .map((placeholder) {
                                                    return Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    2.5.r),
                                                        color: AppColors.grey,
                                                      ),
                                                      child: Image.asset(
                                                        'assets/new_images/playeplaceholder.png',
                                                        height: 50,
                                                        width: 50,
                                                      ),
                                                    );
                                                  }),
                                                  GestureDetector(
                                                    onTap: () {
                                                      controller
                                                          .removeSelectedPLayers();
                                                    },
                                                    child: Container(
                                                        height: 50,
                                                        width: 50,
                                                        padding:
                                                            const EdgeInsets
                                                                .all(10),
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              AppColors.white,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      2.5.r),
                                                        ),
                                                        child: Image.asset(
                                                            'assets/new_images/clear_all.png')),
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    )),
                              )),
                          SliverToBoxAdapter(
                            child: ListView(
                                dragStartBehavior: DragStartBehavior.down,
                                controller: controller.scrollController,
                                shrinkWrap: true,
                                children: [
                                  const FilterButton(),
                                  Obx(
                                    () => AnimatedContainer(
                                        clipBehavior: Clip.hardEdge,
                                        height:
                                            controller.isSearch.value ? 60 : 0,
                                        duration:
                                            const Duration(milliseconds: 400),
                                        decoration: BoxDecoration(
                                            color: AppColors.backgroud,
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: OverflowBox(
                                          fit: OverflowBoxFit.deferToChild,
                                          minHeight: 0,
                                          maxHeight: 60,
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                left: 10.w, right: 10.w),
                                            child: AppTextField(
                                              fillColor: AppColors.backgroud,
                                              labelText: 'Search'.tr,
                                              controller:
                                                  controller.searchController,
                                              onChanged: (value) {
                                                controller.searchQuery.value =
                                                    value;
                                              },
                                            ),
                                          ),
                                        )),
                                  ),
                                  verticalSpace(10),
                                  PlayersGrid(selectTeam.homeTeam!.name!,
                                      selectTeam.awayTeam!.name!)
                                ]),
                          )
                        ]
                            // Container(
                            //     //height: Get.height*0.21,
                            //     width: Get.width,
                            //     decoration: const BoxDecoration(
                            //         color: AppColors.backgroud,
                            //         border: Border(
                            //             bottom: BorderSide(
                            //           color: AppColors.backgroud,
                            //           width: 1,
                            //         ))),
                            //     child: Column(
                            //       children: [
                            //         // LayoutBuilder(
                            //         //     builder: (context, constraints) {
                            //         //   final height =
                            //         //       constraints.maxWidth > 600
                            //         //           ? Get.height * 0.14
                            //         //           : Get.height * 0.13;
                            //         //   return SizedBox(
                            //         //     height: height,
                            //         //     child: Obx(
                            //         //       () => AnimatedSwitcher(
                            //         //         duration: const Duration(
                            //         //             milliseconds: 700),
                            //         //         transitionBuilder: (Widget child,
                            //         //             Animation<double> animation) {
                            //         //           return FadeTransition(
                            //         //               opacity: animation,
                            //         //               child: child);
                            //         //         },
                            //         //         child: controller.isScrolled.value
                            //         //             ? MatchTimer(
                            //         //                 key: const ValueKey(
                            //         //                     'MatchTimer'),
                            //         //                 startDate:
                            //         //                     controller.matchData[
                            //         //                         'ExpStartDate'],
                            //         //               )
                            //         //             : Column(
                            //         //                 key: const ValueKey(
                            //         //                     'TeamNames'),
                            //         //                 children: [
                            //         //                   TeamNames(
                            //         //                     homeTeamNme:
                            //         //                         selectTeam
                            //         //                             .homeTeam!
                            //         //                             .name,
                            //         //                     awayTeamName:
                            //         //                         selectTeam
                            //         //                             .awayTeam!
                            //         //                             .name!,
                            //         //                     awayTeamImage:
                            //         //                         selectTeam
                            //         //                             .awayTeam!
                            //         //                             .imageUrl,
                            //         //                     homeTeamImage:
                            //         //                         selectTeam
                            //         //                             .homeTeam!
                            //         //                             .imageUrl,
                            //         //                   ),
                            //         //                 ],
                            //         //               ),
                            //         //       ),
                            //         //     ),
                            //         //   );
                            //         // }),
                            //         // Theme(
                            //         //   data: Theme.of(context).copyWith(
                            //         //       dividerColor: Colors
                            //         //           .transparent), // Removes the divider lines
                            //         //   child: ExpansionTile(
                            //         //     title: Text(
                            //         //       'Positions',
                            //         //       style: globalTextStyle(
                            //         //         fontSize: 12.sp,
                            //         //         fontWeight: FontWeight.w600,
                            //         //         color: AppColors.dark,
                            //         //       ),
                            //         //     ), // Remove padding around the tile
                            //         //     childrenPadding: EdgeInsets
                            //         //         .zero, // Remove padding around the children
                            //         //     children: const [
                            //         //       Positions(),
                            //         //     ],
                            //         //   ),
                            //         // ),

                            //         verticalSpace(5.h),
                            //         // Obx(
                            //         //   () => Padding(
                            //         //     padding: EdgeInsets.only(
                            //         //       left: 5.w,
                            //         //       right: 5.w,
                            //         //     ),
                            //         //     child: Wrap(
                            //         //       runSpacing: 5.h,
                            //         //       children: [
                            //         //         Wrap(
                            //         //           crossAxisAlignment:
                            //         //               WrapCrossAlignment.center,
                            //         //           alignment: WrapAlignment.start,
                            //         //           runAlignment:
                            //         //               WrapAlignment.start,
                            //         //           runSpacing: 5.h,
                            //         //           spacing: 10.w,
                            //         //           children: [
                            //         //             ...controller.selectedPlayers
                            //         //                 .map((player) {
                            //         //               return controller.sportName ==
                            //         //                       'FB'
                            //         //                   ? player.imageUrl ==
                            //         //                           null
                            //         //                       ? Stack(
                            //         //                           alignment:
                            //         //                               Alignment
                            //         //                                   .center,
                            //         //                           clipBehavior:
                            //         //                               Clip.hardEdge,
                            //         //                           children: [
                            //         //                             player.jerseyImageUrl !=
                            //         //                                     null
                            //         //                                 ? player.jerseyImageUrl!.endsWith(
                            //         //                                         'svg')
                            //         //                                     ? SvgPicture
                            //         //                                         .network(
                            //         //                                         player.jerseyImageUrl!,
                            //         //                                         height: 50,
                            //         //                                         width: 50,
                            //         //                                       )
                            //         //                                     : Image
                            //         //                                         .network(
                            //         //                                         player.jerseyImageUrl!,
                            //         //                                         height: 50,
                            //         //                                         width: 50,
                            //         //                                       )
                            //         //                                 : Image
                            //         //                                     .asset(
                            //         //                                     AppImages
                            //         //                                         .userPlaceHolder,
                            //         //                                     height:
                            //         //                                         50,
                            //         //                                     width:
                            //         //                                         50,
                            //         //                                   ),
                            //         //                             player.jerseyImageUrl ==
                            //         //                                     null
                            //         //                                 ? Image
                            //         //                                     .asset(
                            //         //                                     AppImages
                            //         //                                         .userPlaceHolder,
                            //         //                                     width:
                            //         //                                         50,
                            //         //                                     height:
                            //         //                                         50,
                            //         //                                   )
                            //         //                                 : Align(
                            //         //                                     alignment:
                            //         //                                         Alignment.topCenter,
                            //         //                                     widthFactor:
                            //         //                                         0.1.w,
                            //         //                                     child:
                            //         //                                         SizedBox(
                            //         //                                       width:
                            //         //                                           70.w,
                            //         //                                       child:
                            //         //                                           Column(
                            //         //                                         mainAxisAlignment: MainAxisAlignment.center,
                            //         //                                         children: [
                            //         //                                           Container(
                            //         //                                             padding: EdgeInsets.only(left: 2.w, right: 2.w, top: 1.h, bottom: 1.h),
                            //         //                                             decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(2.r)), color: AppColors.white.withValues(alpha: 0.9)),
                            //         //                                             child: SizedBox(
                            //         //                                               width: 20.w,
                            //         //                                               child: Text(
                            //         //                                                 player.fullName!.split(' ').last,
                            //         //                                                 style: globalTextStyle2(fontSize: 6.sp, color: AppColors.dark),
                            //         //                                                 textAlign: TextAlign.start,
                            //         //                                                 overflow: TextOverflow.ellipsis,
                            //         //                                                 maxLines: 1,
                            //         //                                               ),
                            //         //                                             ),
                            //         //                                           ),
                            //         //                                           verticalSpace(5.h),
                            //         //                                           Container(
                            //         //                                             alignment: Alignment.center,
                            //         //                                             padding: EdgeInsets.all(1.r),
                            //         //                                             decoration: BoxDecoration(shape: BoxShape.circle, color: AppColors.white.withOpacity(0.9)),
                            //         //                                             child: Text(
                            //         //                                               player.jerseyNumber ?? '',
                            //         //                                               style: globalTextStyle2(fontSize: 8.sp, color: AppColors.dark),
                            //         //                                               textAlign: TextAlign.center,
                            //         //                                             ),
                            //         //                                           ),
                            //         //                                         ],
                            //         //                                       ),
                            //         //                                     ),
                            //         //                                   ),
                            //         //                           ],
                            //         //                         )
                            //         //                       : player.imageUrl !=
                            //         //                               null
                            //         //                           ? player.imageUrl!.endsWith(
                            //         //                                   'svg')
                            //         //                               ? SvgPicture
                            //         //                                   .network(
                            //         //                                   player
                            //         //                                       .imageUrl!,
                            //         //                                   height:
                            //         //                                       50,
                            //         //                                   width:
                            //         //                                       50,
                            //         //                                 )
                            //         //                               : FadeInImage
                            //         //                                   .assetNetwork(
                            //         //                                       placeholder: AppImages
                            //         //                                           .userPlaceHolder,
                            //         //                                       image: player
                            //         //                                           .imageUrl!,
                            //         //                                       width:
                            //         //                                           50,
                            //         //                                       height:
                            //         //                                           50,
                            //         //                                       fadeInDuration: const Duration(
                            //         //                                           milliseconds:
                            //         //                                               300),
                            //         //                                       imageErrorBuilder: (context, error, stackTrace) {
                            //         //                                         return Image.asset(
                            //         //                                           AppImages.userPlaceHolder,
                            //         //                                           width: 50,
                            //         //                                           height: 50,
                            //         //                                         );
                            //         //                                       })
                            //         //                           : Image.asset(
                            //         //                               AppImages
                            //         //                                   .userPlaceHolder,
                            //         //                               height: 50,
                            //         //                               width: 50,
                            //         //                             )
                            //         //                   : player.imageUrl !=
                            //         //                           null
                            //         //                       ? player.imageUrl!
                            //         //                               .endsWith(
                            //         //                                   '.svg')
                            //         //                           ? controller.sportName ==
                            //         //                                   'CR'
                            //         //                               ? Image.network(
                            //         //                                   replaceSvgWithPng(player
                            //         //                                       .imageUrl!),
                            //         //                                   height:
                            //         //                                       50,
                            //         //                                   width:
                            //         //                                       50)
                            //         //                               : SvgPicture
                            //         //                                   .network(
                            //         //                                   player
                            //         //                                       .imageUrl!,
                            //         //                                   height:
                            //         //                                       50,
                            //         //                                   width:
                            //         //                                       50,
                            //         //                                 )
                            //         //                           : Image.network(
                            //         //                               player.imageUrl!,
                            //         //                               height: 50,
                            //         //                               width: 50)
                            //         //                       : Image.asset(
                            //         //                           AppImages
                            //         //                               .userPlaceHolder,
                            //         //                           height: 50,
                            //         //                           width: 50,
                            //         //                         );
                            //         //             }),
                            //         //             ...controller
                            //         //                 .selectedPlayersPlaceholders
                            //         //                 .map((placeholder) {
                            //         //               return Container(
                            //         //                 decoration: BoxDecoration(
                            //         //                   borderRadius:
                            //         //                       BorderRadius
                            //         //                           .circular(
                            //         //                               2.5.r),
                            //         //                   color: AppColors.grey,
                            //         //                 ),
                            //         //                 child: Image.asset(
                            //         //                   'assets/images/userplaceholdertwo.png',
                            //         //                   height: 50,
                            //         //                   width: 50,
                            //         //                 ),
                            //         //               );
                            //         //             }),
                            //         //             GestureDetector(
                            //         //               onTap: () {
                            //         //                 controller
                            //         //                     .removeSelectedPLayers();
                            //         //               },
                            //         //               child: Container(
                            //         //                 height: 50,
                            //         //                 width: 50,
                            //         //                 decoration: BoxDecoration(
                            //         //                   color: AppColors.grey,
                            //         //                   borderRadius:
                            //         //                       BorderRadius
                            //         //                           .circular(
                            //         //                               2.5.r),
                            //         //                 ),
                            //         //                 child: const Icon(
                            //         //                   FlutterRemix
                            //         //                       .delete_bin_2_line,
                            //         //                   color:
                            //         //                       AppColors.errorRed,
                            //         //                 ),
                            //         //               ),
                            //         //             )

                            //         //           ],
                            //         //         ),
                            //         //       ],
                            //         //     ),
                            //         //   ),
                            //         // ),
                            //         verticalSpace(5.h),
                            //       ],
                            //     )),

                            // SizedBox(
                            //   height: maxWidth > 600
                            //       ? Get.height * 0.6
                            //       : Get.height * 0.5,
                            //   child: ListView(
                            //       dragStartBehavior: DragStartBehavior.down,
                            //       controller: controller.scrollController,
                            //       physics:
                            //           const AlwaysScrollableScrollPhysics(),
                            //       shrinkWrap: true,
                            //       children: [
                            //         verticalSpace(10.h),
                            //         //const FilterButton(),
                            //         SizedBox(
                            //           height: 8.h,
                            //         ),
                            //         FilterContainer(
                            //           homeTeamImage:
                            //               selectTeam.homeTeam!.imageUrl,
                            //           awayTeamImage:
                            //               selectTeam.awayTeam!.imageUrl,
                            //         ),
                            //         Obx(
                            //           () => AnimatedContainer(
                            //               clipBehavior: Clip.hardEdge,
                            //               height: controller.isSearch.value
                            //                   ? 60
                            //                   : 0,
                            //               duration: const Duration(
                            //                   milliseconds: 400),
                            //               decoration: BoxDecoration(
                            //                   color: AppColors.grey,
                            //                   borderRadius:
                            //                       BorderRadius.circular(5)),
                            //               child: OverflowBox(
                            //                 fit: OverflowBoxFit.deferToChild,
                            //                 minHeight: 0,
                            //                 maxHeight: 60,
                            //                 child: Padding(
                            //                   padding: EdgeInsets.only(
                            //                       left: 10.w, right: 10.w),
                            //                   child: AppTextField(
                            //                     fillColor: AppColors.white,
                            //                     labelText: 'Search'.tr,
                            //                     controller: controller
                            //                         .searchController,
                            //                     onChanged: (value) {
                            //                       controller.searchQuery
                            //                           .value = value;
                            //                     },
                            //                   ),
                            //                 ),
                            //               )),
                            //         ),
                            //         verticalSpace(5.h),
                            //         PlayersGrid(selectTeam.homeTeam!.name!,
                            //             selectTeam.awayTeam!.name!)
                            //       ]),
                            // ),
                            // ],
                            //),
                            );
                      });
                    }
                  }),
            ],
          );
        }),
        bottomNavigationBar: const BottomButtonSelectPlayer());
  }
}
