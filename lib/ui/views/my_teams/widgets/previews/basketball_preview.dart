import 'dart:math' as math;

import 'package:flutter_svg/svg.dart';
import 'package:fmlfantasy/app/app_sizings.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/config/global_instances.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/model/my_teams_players_model.dart';
import 'package:fmlfantasy/ui/helpers/replace_svg_with_png.dart';

class BasketballPreview extends StatelessWidget {
  final List<MyTeamPlayersModel> data;
  const BasketballPreview({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: Get.width,
        height: Get.height,
        child: Stack(alignment: Alignment.center, children: [
          Positioned.fill(
              child: Container(
            decoration: const BoxDecoration(
              color: Color.fromRGBO(132, 91, 69, 1),
            ),
          )),
          Positioned(
              top: 10.h,
              left: 40.w,
              right: 40.w,
              child: Image.asset(
                'assets/new_images/basketball_court.png',
                width: Get.width,
                height: Get.height * 0.2,
              )),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.w),
            child: Align(
              alignment: Alignment.center,
              child: Image.asset('assets/new_images/mid-line.png'),
            ),
          ),
          Positioned(
            bottom: 10.h,
            left: 40.w,
            right: 40.w,
            child: Transform.rotate(
              angle: 180 * math.pi / 180,
              child: Transform.scale(
                scaleX: -1,
                child: Image.asset(
                  'assets/new_images/basketball_court.png',
                  width: Get.width,
                  height: Get.height * 0.2,
                ),
              ),
            ),
          ),
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
                        ? player.imageUrl == null || player.imageUrl!.isEmpty
                            ? player.jerseyImageUrl == null ||
                                    player.jerseyImageUrl!.isEmpty
                                ? Container()
                                : player.jerseyImageUrl!.endsWith('.svg')
                                    ? SvgPicture.network(
                                        player.jerseyImageUrl!,
                                        height: 25.h,
                                        width: 25.w,
                                      )
                                    : Image.network(
                                        player.jerseyImageUrl!,
                                        height: 25.h,
                                        width: 25.w,
                                      )
                            : player.imageUrl == null ||
                                    player.imageUrl!.isEmpty
                                ? Container()
                                : player.imageUrl!.endsWith('.svg')
                                    ? SvgPicture.network(
                                        player.imageUrl!,
                                        height: 25.h,
                                        width: 25.w,
                                      )
                                    : Image.network(
                                        player.imageUrl!,
                                        height: 25.h,
                                        width: 25.w,
                                      )
                        : player.imageUrl == null || player.imageUrl!.isEmpty
                            ? Container()
                            : player.imageUrl!.endsWith('.svg')
                                ? selectedSPort.value == 'CR'
                                    ? Image.network(
                                        replaceSvgWithPng(player.imageUrl!),
                                        height: 25.h,
                                      )
                                    : SvgPicture.network(
                                        player.imageUrl!,
                                        height: 25.h,
                                        width: 25.w,
                                      )
                                : Image.network(
                                    player.imageUrl!,
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
                        player.name ?? '-',
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
