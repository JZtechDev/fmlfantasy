import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:fmlfantasy/app/app_sizings.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/model/select_player_model.dart';
import 'package:fmlfantasy/ui/views/select_players/controller/select_player_controller.dart';
import 'package:fmlfantasy/ui/views/select_players/widgets/filter_container.dart';
import 'package:fmlfantasy/ui/views/select_players/widgets/player_grid.dart';

class PlayersSection extends GetView<SelectPlayerController> {
  final SelectTeam selectTeam;
  const PlayersSection({super.key, required this.selectTeam});

  @override
  Widget build(BuildContext context) {
    Get.put(SelectPlayerController());
    return SliverToBoxAdapter(
      child: ListView(
          dragStartBehavior: DragStartBehavior.down,
          controller: controller.scrollController,
          shrinkWrap: true,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FilterContainer(
                    homeTeamName: selectTeam.homeTeam!.name,
                    awayTeamName: selectTeam.awayTeam!.name),
                SizedBox(
                  width: Get.width * 0.4,
                  child: Row(
                    children: [
                      SizedBox(
                          width: Get.width * 0.3,
                          height: 30.h,
                          child: TextFormField(
                            controller: controller.searchController,
                            onChanged: (value) {
                              controller.searchQuery.value = value;
                            },
                            style: globalTextStyle2(
                              fontSize:
                                  AppSizing.isMobile(context) ? 12.sp : 8.sp,
                              color: AppColors.secondary,
                              fontWeight: FontWeight.w600,
                            ),
                            decoration: InputDecoration(
                              hoverColor: AppColors.secondary,
                              hintText: 'Search'.tr,
                              hintStyle: globalTextStyle(
                                  fontSize: 12.sp,
                                  color: AppColors.secondary,
                                  fontWeight: FontWeight.w500),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(5.r),
                                  bottomLeft: Radius.circular(5.r),
                                ),
                                borderSide: const BorderSide(
                                    color: AppColors.secondary, width: 1),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(5.r),
                                  bottomLeft: Radius.circular(5.r),
                                ),
                                borderSide: const BorderSide(
                                    color: AppColors.secondary, width: 1),
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(5.r),
                                  bottomLeft: Radius.circular(5.r),
                                ),
                                borderSide: const BorderSide(
                                    color: AppColors.secondary, width: 1),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(5.r),
                                  bottomLeft: Radius.circular(5.r),
                                ),
                                borderSide: const BorderSide(
                                    color: AppColors.secondary, width: 1),
                              ),
                            ),
                          )),
                      Container(
                        width: 40,
                        height: 30.h,
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.secondary),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(5.r),
                            bottomRight: Radius.circular(5.r),
                          ),
                        ),
                        child: Icon(CupertinoIcons.search,
                            color: AppColors.secondary,
                            size: AppSizing.isMobile(context) ? 20.sp : 10.sp),
                      )
                    ],
                  ),
                ),
              ],
            ),

            // Obx(
            //   () => AnimatedContainer(
            //       clipBehavior: Clip.hardEdge,
            //       height: controller.isSearch.value ? 60 : 0,
            //       duration: const Duration(milliseconds: 400),
            //       decoration: BoxDecoration(
            //           color: AppColors.backgroud,
            //           borderRadius: BorderRadius.circular(5)),
            //       child: OverflowBox(
            //         fit: OverflowBoxFit.deferToChild,
            //         minHeight: 0,
            //         maxHeight: 60,
            //         child: Padding(
            //           padding: EdgeInsets.only(left: 10.w, right: 10.w),
            //           child: AppTextField(
            //             labelText: 'Search'.tr,
            //             controller: controller.searchController,
            //             onChanged: (value) {
            //               controller.searchQuery.value = value;
            //             },
            //           ),
            //         ),
            //       )),
            // ),
            // FilterContainer(
            //     homeTeamName: selectTeam.homeTeam!.name!,
            //     awayTeamName: selectTeam.awayTeam!.name!),
            verticalSpace(10),
            PlayersGrid(selectTeam.homeTeam!.name!, selectTeam.awayTeam!.name!)
          ]),
    );
  }
}
