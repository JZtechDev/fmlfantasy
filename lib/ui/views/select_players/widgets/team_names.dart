import 'package:fmlfantasy/app/app_colors/app_colors.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/ui/helpers/commons.dart';
import 'package:fmlfantasy/ui/helpers/replace_svg_with_png.dart';
import 'package:fmlfantasy/ui/views/select_players/controller/select_player_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class TeamsContainer extends GetView<SelectPlayerController> {
  final String? homeTeamNme;
  final String? awayTeamName;
  final String? awayTeamImage;
  final String? homeTeamImage;
  final String? homeTeamCode;
  final String? awayTeamCode;

  const TeamsContainer(
      {super.key,
      required this.homeTeamNme,
      required this.awayTeamName,
      required this.awayTeamImage,
      required this.homeTeamImage,
      required this.homeTeamCode,
      required this.awayTeamCode});

  @override
  Widget build(BuildContext context) {
    Get.put(SelectPlayerController());

    return LayoutBuilder(builder: (context, constraints) {
      return Padding(
        padding: EdgeInsets.only(
          left: 10.w,
          right: 10.w,
          top: 10.w,
          bottom: 10.w,
        ),
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(
                        top: 5, bottom: 5, left: 10, right: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.r),
                      color: AppColors.customWhite,
                    ),
                    child: Row(
                      children: [
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
                        horizontalSpace(10.w),
                        SizedBox(
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  homeTeamNme!,
                                  style: globalTextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.primaryVeryDark),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                ),
                                Text(
                                  awayTeamCode!,
                                  style: globalTextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.primaryVeryDark),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                horizontalSpace(5.w),
                Expanded(
                    child: Container(
                  padding: const EdgeInsets.only(
                      top: 5, bottom: 5, left: 10, right: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.r),
                    color: AppColors.customWhite,
                  ),
                  child: Row(
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
                      horizontalSpace(10.w),
                      SizedBox(
                        width: 80.w,
                        child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                textAlign: TextAlign.left,
                                awayTeamName!,
                                style: globalTextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.primaryVeryDark,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                textAlign: TextAlign.left,
                                awayTeamCode ?? '-',
                                style: globalTextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.primaryVeryDark,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ))
              ],
            ),
            // Align(
            //     alignment: Alignment.center,
            //     child: Container(
            //       width: 50,
            //       height: 50,
            //       decoration: BoxDecoration(
            //         color: AppColors.secondary,
            //         shape: BoxShape.circle,
            //         boxShadow: [
            //           BoxShadow(
            //             color: AppColors.primary.withOpacity(0.1),
            //             blurRadius: 5,
            //             offset: const Offset(0, 3),
            //           ),
            //         ],
            //       ),
            //       child: Container(
            //         alignment: Alignment.center,
            //         margin: const EdgeInsets.all(3),
            //         padding: const EdgeInsets.all(5),
            //         decoration: const BoxDecoration(
            //           shape: BoxShape.circle,
            //           color: AppColors.primaryVeryDark,
            //         ),
            //         child: Text('VS',
            //             style: globalTextStyle(
            //                 fontSize: 18.sp,
            //                 fontWeight: FontWeight.w700,
            //                 color: AppColors.secondary)),
            //       ),
            //     )),
          ],
        ),
      );
    });
  }
}
