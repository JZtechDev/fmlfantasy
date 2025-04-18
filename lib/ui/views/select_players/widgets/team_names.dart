import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/ui/helpers/commons.dart';
import 'package:fmlfantasy/ui/helpers/replace_svg_with_png.dart';
import 'package:fmlfantasy/ui/views/select_players/controller/select_player_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class TeamNames extends GetView<SelectPlayerController> {
  final String? homeTeamNme;
  final String? awayTeamName;
  final String? awayTeamImage;
  final String? homeTeamImage;

  const TeamNames(
      {super.key,
      required this.homeTeamNme,
      required this.awayTeamName,
      required this.awayTeamImage,
      required this.homeTeamImage});

  @override
  Widget build(BuildContext context) {
    Get.put(SelectPlayerController());

    return LayoutBuilder(builder: (context, constraints) {
      double homeTeamTextSize = constraints.maxWidth > 600 ? 14.h : 14.sp;
      return Padding(
        padding: EdgeInsets.only(
          left: 10.w,
          right: 10.w,
          top: 10.w,
          bottom: 10.w,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                children: [
                  SizedBox(
                    //height: homeTeamTextSize,
                    width: Get.width * 0.3,
                    child: Center(
                      child: Text(
                        homeTeamNme!,
                        style: globalTextStyle(
                          fontSize: homeTeamTextSize,
                          fontWeight: FontWeight.w600,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  Container(
                    constraints: BoxConstraints(
                      maxHeight: 45.h,
                      maxWidth: 45.w,
                      minHeight: 45.h,
                      minWidth: 45.w,
                    ),
                    child: homeTeamImage == null
                        ? Container()
                        : homeTeamImage!.endsWith('.png')
                            ? Image.network(
                                homeTeamImage!,
                              )
                            : controller.sportName == 'CR'
                                ? Image.network(
                                    replaceSvgWithPng(homeTeamImage!),
                                  )
                                : SvgPicture.network(
                                    homeTeamImage!,
                                  ),
                  ),
                ],
              ),
            ),
            horizontalSpace(10.w),
            Expanded(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  constraints: BoxConstraints(
                    maxHeight: 45.h,
                    maxWidth: 45.w,
                    minHeight: 45.h,
                    minWidth: 45.w,
                  ),
                  child: awayTeamImage == null
                      ? Container()
                      : awayTeamImage!.endsWith('.png')
                          ? Image.network(
                              awayTeamImage!,
                            )
                          : controller.sportName == 'CR'
                              ? Image.network(
                                  replaceSvgWithPng(awayTeamImage!),
                                )
                              : SvgPicture.network(
                                  awayTeamImage!,
                                ),
                ),
                SizedBox(
                  width: 80.w,
                  child: Center(
                    child: Text(
                      textAlign: TextAlign.left,
                      awayTeamName!,
                      style: globalTextStyle(
                        fontSize: homeTeamTextSize,
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ))
          ],
        ),
      );
    });
  }
}
