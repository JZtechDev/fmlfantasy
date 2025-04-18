import 'dart:math';
import 'package:fmlfantasy/app/app_images/app_images.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/model/match_center_inner_model.dart';
import 'package:fmlfantasy/ui/helpers/get_initials.dart';
import 'package:fmlfantasy/ui/helpers/replace_svg_with_png.dart';
import 'package:fmlfantasy/ui/views/match_center/controller/match_center_inner_controller.dart';
import 'package:flutter_svg/svg.dart';

class PlayersCard extends GetView<MatchCenterInner> {
  final PlayersBreakDown topPlayers;
  const PlayersCard({super.key, required this.topPlayers});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      double maxWidth = constraints.maxWidth;
      return Column(
        children: [
          Padding(
            padding: EdgeInsets.only(right: 10.w, left: 10.w),
            child: Container(
              height: Get.height * 0.25,
              clipBehavior: Clip.hardEdge,
              width: Get.width,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(5.r),
                border: Border.all(color: AppColors.borderColor),
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Transform.rotate(
                      origin: Offset(maxWidth > 600 ? 95 : 70, 20),
                      angle: pi / 4.5,
                      child: Container(
                        height: maxWidth > 600 ? 350.0 : 250.0,
                        width: maxWidth > 600 ? 90.0 : 50.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          gradient: const LinearGradient(
                            colors: [
                              Color.fromRGBO(219, 231, 255, 0.3),
                              Color.fromRGBO(219, 231, 255, 0.1),
                            ],
                            stops: [0.0, 1.0], //
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Transform.rotate(
                      origin: Offset(
                          maxWidth > 600 ? 90 : 70, maxWidth > 600 ? -70 : -40),
                      angle: pi / 4.5,
                      child: Container(
                        height: maxWidth > 600 ? 350.0 : 250.0,
                        width: maxWidth > 600 ? 90.0 : 50.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          gradient: const LinearGradient(
                            colors: [
                              Color.fromRGBO(219, 231, 255, 0.3),
                              Color.fromRGBO(219, 231, 255, 0.0),
                            ],
                            stops: [0.0, 1.0], //
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 10.w,
                      top: 10.h,
                      right: 10.w,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              topPlayers.teamName ?? '-',
                              style: globalTextStyle2(
                                  fontSize: maxWidth > 600 ? 12.sp : 14.sp,
                                  color: AppColors.dark.withOpacity(0.5)),
                            ),
                            Container(
                              alignment: Alignment.center,
                              height: 22.h,
                              width: 43.w,
                              decoration: BoxDecoration(
                                  color: AppColors.navyBlue,
                                  borderRadius: BorderRadius.circular(5.r)),
                              child: Text(
                                topPlayers.position == null
                                    ? '-'
                                    : getInitials(topPlayers.position!),
                                style: globalTextStyle(
                                    fontSize: maxWidth > 600 ? 10.sp : 12.sp,
                                    color: Colors.white),
                              ),
                            )
                          ],
                        ),
                        verticalSpace(12.h),
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.only(
                                  left: 8.w, right: 8.w, bottom: 5.h, top: 5.h),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.r),
                                color: AppColors.grey,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset(
                                    AppImages.rank,
                                    height: maxWidth > 600 ? 20.h : 17.h,
                                    width: maxWidth > 600 ? 20.w : 17.w,
                                  ),
                                  horizontalSpace(5.w),
                                  Text(
                                      topPlayers.rank == null
                                          ? '-'
                                          : topPlayers.rank!
                                              .toString()
                                              .padLeft(2, '0'),
                                      style: globalTextStyle(
                                          fontSize:
                                              maxWidth > 600 ? 12.sp : 14.sp)),
                                ],
                              ),
                            ),
                            horizontalSpace(10.w),
                            SizedBox(
                              width: Get.width * 0.6,
                              child: Text(
                                topPlayers.name ?? '-',
                                style: globalTextStyle(
                                    fontSize: maxWidth > 600 ? 14.sp : 18.sp,
                                    fontWeight: FontWeight.w600),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ),
                          ],
                        ),
                        // topPlayers.statsBreakDown.isEmpty
                        //     ? const SizedBox()
                        //     : Row(
                        //         mainAxisAlignment: MainAxisAlignment.start,
                        //         crossAxisAlignment: CrossAxisAlignment.start,
                        //         children: topPlayers.statsBreakDown
                        //             .take(3)
                        //             .map((statics) {
                        //           return Padding(
                        //             padding: EdgeInsets.only(right: 30.w),
                        //             child: Column(
                        //                 mainAxisAlignment:
                        //                     MainAxisAlignment.start,
                        //                 crossAxisAlignment:
                        //                     CrossAxisAlignment.start,
                        //                 children: [
                        //                   Text(
                        //                     statics.value == null
                        //                         ? '-'
                        //                         : statics.value!
                        //                             .toStringAsFixed(0)
                        //                             .padLeft(2, '0'),
                        //                     style: globalTextStyle(
                        //                         fontSize: maxWidth > 600
                        //                             ? 12.sp
                        //                             : 14.sp,
                        //                         fontWeight: FontWeight.w600),
                        //                   ),
                        //                   horizontalSpace(5.w),
                        //                   Text(
                        //                     statics.name == null
                        //                         ? '-'
                        //                         : statics.name!
                        //                             .split(' ')
                        //                             .join('\n'),
                        //                     style: globalTextStyle2(
                        //                         fontSize: maxWidth > 600
                        //                             ? 10.sp
                        //                             : 12.sp,
                        //                         color: AppColors.dark
                        //                             .withOpacity(0.5)),
                        //                   )
                        //                 ]),
                        //           );
                        //         }).toList(),
                        //       ),
                        verticalSpace(15.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(bottom: 10.h),
                              alignment: Alignment.center,
                              width: Get.width * 0.3,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: AppColors.grey,
                                borderRadius: BorderRadius.circular(5.r),
                              ),
                              child: Text(
                                topPlayers.fantasyPoints == null
                                    ? '-'
                                    : "${topPlayers.fantasyPoints!.toStringAsFixed(0).padLeft(2, '0')} points",
                                style: globalTextStyle(
                                  fontSize: maxWidth > 600 ? 14.sp : 18.sp,
                                  color: AppColors.navyBlue,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Positioned(
                      right: 0.w,
                      bottom: 0.h,
                      child: SizedBox(
                        width: Get.width * 0.4,
                        child: controller.sportsCode == 'FB'
                            ? topPlayers.imageUrl == null
                                ? Stack(
                                    clipBehavior: Clip.hardEdge,
                                    alignment: Alignment.center,
                                    children: [
                                      topPlayers.jerseyImage == null
                                          ? Image.asset(
                                              excludeFromSemantics: true,
                                              isAntiAlias: true,
                                              AppImages.userPlaceHolder,
                                            )
                                          : topPlayers.jerseyImage!
                                                  .endsWith('svg')
                                              ? SvgPicture.network(
                                                  topPlayers.jerseyImage!,
                                                )
                                              : Image.network(
                                                  topPlayers.jerseyImage!,
                                                ),
                                      topPlayers.jerseyImage == null
                                          ? const SizedBox()
                                          : Positioned(
                                              top: 20.h,
                                              child: Container(
                                                padding: EdgeInsets.only(
                                                  left: 2.w,
                                                  right: 2.w,
                                                  top: 1.h,
                                                  bottom: 1.h,
                                                ),
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                    color: AppColors.white
                                                        .withOpacity(0.9),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            2.r)),
                                                child: Text(
                                                  textAlign: TextAlign.center,
                                                  topPlayers.name!
                                                      .split(' ')
                                                      .last
                                                      .split(' ')
                                                      .last,
                                                  style: globalTextStyle(
                                                      fontSize: 8.sp,
                                                      color: AppColors.dark),
                                                ),
                                              ),
                                            ),
                                      topPlayers.jerseyImage == null
                                          ? const SizedBox()
                                          : Align(
                                              alignment: Alignment.center,
                                              child: Container(
                                                height: 30.h,
                                                width: 30.w,
                                                padding: const EdgeInsets.only(
                                                  top: 5,
                                                  right: 5,
                                                  left: 5,
                                                  bottom: 5,
                                                ),
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                    color: AppColors.white
                                                        .withOpacity(0.9),
                                                    shape: BoxShape.circle),
                                                child: Text(
                                                  textAlign: TextAlign.center,
                                                  topPlayers.fantasyNumnber ??
                                                      '-',
                                                  style: globalTextStyle(
                                                      fontSize: 10.sp,
                                                      color: AppColors.dark),
                                                ),
                                              ),
                                            ),
                                    ],
                                  )
                                : topPlayers.jerseyImage == null
                                    ? Image.asset(
                                        excludeFromSemantics: true,
                                        isAntiAlias: true,
                                        AppImages.userPlaceHolder,
                                      )
                                    : topPlayers.imageUrl!.endsWith('svg')
                                        ? SvgPicture.network(
                                            topPlayers.imageUrl!,
                                            height: 150.h,
                                          )
                                        : Image.network(
                                            topPlayers.imageUrl!,
                                            height: 150.h,
                                          )
                            : topPlayers.imageUrl == null
                                ? Image.asset(
                                    excludeFromSemantics: true,
                                    isAntiAlias: true,
                                    AppImages.userPlaceHolder,
                                  )
                                : topPlayers.imageUrl!.endsWith('svg')
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
                      ))
                ],
              ),
            ),
          ),
          verticalSpace(10.h),
        ],
      );
    });
  }
}
