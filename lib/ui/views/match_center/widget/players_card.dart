import 'package:fmlfantasy/app/app_images/app_images.dart';
import 'package:fmlfantasy/app/app_sizings.dart';
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
          Container(
            height: Get.height * 0.25,
            clipBehavior: Clip.hardEdge,
            width: Get.width,
            decoration: BoxDecoration(
                color: AppColors.primaryLight,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5.r),
                  topRight: Radius.circular(5.r),
                )),
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.only(left: 10.w, right: 10.w, top: 10.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            topPlayers.teamName ?? '-',
                            style: globalTextStyle2(
                                fontWeight: FontWeight.w700,
                                fontSize: maxWidth > 600 ? 12.sp : 12.sp,
                                color: AppColors.white),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 5),
                            decoration: BoxDecoration(
                                color: AppColors.backgroud,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(5.r),
                                )),
                            child: Text(
                              getInitials(topPlayers.position!),
                              style: globalTextStyle(
                                  fontSize: AppSizing.isTablet(context)
                                      ? 8.sp
                                      : 12.sp,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                    verticalSpace(20.h),
                    Container(
                      width: Get.width * 0.35,
                      decoration: BoxDecoration(
                          color: AppColors.backgroud,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10.r),
                              bottomRight: Radius.circular(10.r))),
                      child: Padding(
                        padding: const EdgeInsets.all(7),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(AppImages.star, height: 20, width: 20),
                            horizontalSpace(5.w),
                            Text(
                              'Star Player',
                              style: globalTextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                    verticalSpace(15.h),
                    Padding(
                      padding: EdgeInsets.only(left: 10.w),
                      child: Text(
                        topPlayers.name ?? '-',
                        style: globalTextStyle(
                            fontSize: 18.sp,
                            color: AppColors.secondary,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.w),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            topPlayers.fantasyPoints!.toStringAsFixed(2),
                            style: globalTextStyle(
                                fontSize: 24.sp,
                                color: AppColors.secondary,
                                fontWeight: FontWeight.w700),
                          ),
                          horizontalSpace(5.w),
                          Text(
                            'Points',
                            style: globalTextStyle(
                                fontSize: 16.sp,
                                color: AppColors.secondary,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Positioned(
                    right: 0.w,
                    bottom: 0.h,
                    child: Hero(
                      tag: topPlayers.assetCode!,
                      transitionOnUserGestures: true,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 1000),
                        curve: Curves.easeInOut,
                        constraints:
                            const BoxConstraints(maxHeight: 171, maxWidth: 155),
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
                                                        .withValues(alpha: 0.9),
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
                                                        .withValues(alpha: 0.9),
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
                      ),
                    ))
              ],
            ),
          ),
        ],
      );
    });
  }
}
