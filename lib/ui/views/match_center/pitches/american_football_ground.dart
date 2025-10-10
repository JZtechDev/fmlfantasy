import 'dart:math' as math;

import 'package:flutter_svg/svg.dart';
import 'package:fmlfantasy/app/app_sizings.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/config/global_instances.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/new_model/match_center_inner_new.dart';
import 'package:fmlfantasy/ui/helpers/replace_svg_with_png.dart';

class AmericanFootballGround extends StatelessWidget {
  final List<PlayerMatchStatistic> data;
  const AmericanFootballGround({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 10.w, right: 10.w),
        width: Get.width,
        child: Stack(alignment: Alignment.center, children: [
          Positioned.fill(
              child: Container(
            decoration: const BoxDecoration(color: AppColors.primaryLight),
            child: Image.asset(
              'assets/images/nfl-pitch.png',
              width: Get.width,
              fit: BoxFit.contain,
            ),
          )),
          Wrap(
            spacing: 20.w,
            runSpacing: 30.h,
            alignment: WrapAlignment.center,
            children: data.map((player) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    selectedSPort.value == 'FB'
                        ? player.headshotImageUrl == null ||
                                player.headshotImageUrl.isEmpty
                            ? player.headshotImageUrl == null ||
                                    player.headshotImageUrl.isEmpty
                                ? Container()
                                : player.headshotImageUrl.endsWith('.svg')
                                    ? SvgPicture.network(
                                        player.headshotImageUrl,
                                        height: 25.h,
                                        width: 25.w,
                                      )
                                    : Image.network(
                                        player.headshotImageUrl,
                                        height: 25.h,
                                        width: 25.w,
                                      )
                            : player.headshotImageUrl == null ||
                                    player.headshotImageUrl.isEmpty
                                ? Container()
                                : player.headshotImageUrl.endsWith('.svg')
                                    ? SvgPicture.network(
                                        player.headshotImageUrl,
                                        height: 25.h,
                                        width: 25.w,
                                      )
                                    : Image.network(
                                        player.headshotImageUrl,
                                        height: 25.h,
                                        width: 25.w,
                                      )
                        : player.headshotImageUrl == null ||
                                player.headshotImageUrl.isEmpty
                            ? Container()
                            : player.headshotImageUrl.endsWith('.svg')
                                ? selectedSPort.value == 'CR'
                                    ? Image.network(
                                        replaceSvgWithPng(
                                            player.headshotImageUrl),
                                        height: 25.h,
                                      )
                                    : SvgPicture.network(
                                        player.headshotImageUrl,
                                        height: 25.h,
                                        width: 25.w,
                                      )
                                : Image.network(
                                    player.headshotImageUrl,
                                    height: 25.h,
                                    width: 25.w,
                                  ),
                    verticalSpace(5.h),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 5),
                      decoration: BoxDecoration(
                        color: AppColors.dark,
                        borderRadius: BorderRadius.circular(5.r),
                      ),
                      child: Text(
                        player.name,
                        style: globalTextStyle(
                          fontSize: AppSizing.isMobile(context) ? 10.sp : 10.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ]));
  }
}
