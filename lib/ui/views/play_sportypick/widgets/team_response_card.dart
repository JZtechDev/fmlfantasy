import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/model/my_draws_model.dart';
import 'package:fmlfantasy/ui/helpers/local_time.dart';
import 'package:fmlfantasy/ui/helpers/replace_svg_with_png.dart';
import 'package:fmlfantasy/ui/views/play_sportypick/controller/play_sportypick_responses_controller.dart';
import 'package:flutter_svg/svg.dart';

class TeamResponseCard extends GetView<PlaySportypickResponsesController> {
  final DrawTeamsModel myDraws;
  final int index;
  const TeamResponseCard(
    this.index,
    this.myDraws, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(PlaySportypickResponsesController());
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      final DateTime endDate = DateTime.parse(myDraws.matchStartsAt.toString());
      final String formattedDifference = formatEndDateTime(endDate.toLocal());
      final maxWidth = constraints.maxWidth;
      return Obx(() {
        return Container(
          margin: EdgeInsets.only(bottom: 10.h),
          padding: EdgeInsets.all(10.w),
          clipBehavior: Clip.hardEdge,
          width: Get.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.r),
            border: Border.all(
              color: AppColors.primaryLight,
              width: 2,
            ),
            color: AppColors.backgroud,
          ),
          child: Column(
            children: [
              Container(
                clipBehavior: Clip.hardEdge,
                width: Get.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.r),
                  color: AppColors.primary,
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 10,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            clipBehavior: Clip.hardEdge,
                            width: Get.width * 0.6,
                            padding: EdgeInsets.only(
                                left: 5.w, right: 5.w, top: 5.h, bottom: 5.h),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.r),
                              color: AppColors.secondary,
                            ),
                            child: Text(
                              myDraws.competition!,
                              textAlign: TextAlign.center,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: globalTextStyle2(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.darkGreen),
                            ),
                          ),
                          Text(
                            formattedDifference,
                            style: globalTextStyle(
                              fontSize: maxWidth > 600 ? 8.sp : 10.sp,
                              fontWeight: FontWeight.w800,
                              color: AppColors.secondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        verticalSpace(50.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  constraints: BoxConstraints(
                                    maxHeight: 50.h,
                                    maxWidth: 50.w,
                                  ),
                                  child: myDraws.homeTeamImageUrl == null
                                      ? Container()
                                      : myDraws.homeTeamImageUrl!
                                              .endsWith('.svg')
                                          ? controller.selectedSport.value ==
                                                  'CR'
                                              ? Image.network(
                                                  replaceSvgWithPng(myDraws
                                                      .homeTeamImageUrl!),
                                                )
                                              : SvgPicture.network(
                                                  myDraws.homeTeamImageUrl!,
                                                )
                                          : Image.network(
                                              myDraws.homeTeamImageUrl!,
                                              height: 45.h,
                                              width: 45.w),
                                ),
                                verticalSpace(10.h),
                                SizedBox(
                                  width: Get.width * 0.3,
                                  child: Text(
                                    textAlign: TextAlign.center,
                                    myDraws.homeTeamName!,
                                    style: globalTextStyle(
                                      fontSize: maxWidth > 600 ? 12.sp : 14.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                SizedBox(
                                  height: 50.h,
                                  width: 1,
                                  child: const VerticalDivider(
                                    color: AppColors.lightGreen,
                                  ),
                                )
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  constraints: BoxConstraints(
                                    maxHeight: 50.h,
                                    maxWidth: 50.w,
                                  ),
                                  child: myDraws.awayTeamImageUrl == null
                                      ? Container()
                                      : myDraws.awayTeamImageUrl!
                                              .endsWith('.svg')
                                          ? controller.selectedSport.value ==
                                                  'CR'
                                              ? Image.network(
                                                  replaceSvgWithPng(myDraws
                                                      .awayTeamImageUrl!),
                                                )
                                              : SvgPicture.network(
                                                  myDraws.awayTeamImageUrl!,
                                                )
                                          : Image.network(
                                              myDraws.awayTeamImageUrl!,
                                              height: 45.h,
                                              width: 45.w),
                                ),
                                verticalSpace(10.h),
                                SizedBox(
                                  width: Get.width * 0.3,
                                  child: Text(
                                    textAlign: TextAlign.center,
                                    myDraws.awayTeamName!,
                                    style: globalTextStyle(
                                      fontSize: maxWidth > 600 ? 12.sp : 14.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        verticalSpace(10.h),
                      ],
                    ),
                  ],
                ),
              ),
              verticalSpace(10.h),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      alignment: Alignment.bottomLeft,
                      height: 55.h,
                      padding: EdgeInsets.only(
                        left: 10.w,
                        right: 10.w,
                        top: 5.h,
                        bottom: 5.h,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5.r),
                          bottomLeft: Radius.circular(5.r),
                        ),
                        color: const Color.fromRGBO(77, 134, 126, 1),
                      ),
                      child: Text(
                        '${myDraws.homeTeamName}',
                        style: globalTextStyle(
                          fontSize: maxWidth > 600 ? 10.sp : 12.sp,
                          fontWeight: FontWeight.w700,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ),
                  horizontalSpace(1),
                  Expanded(
                    flex: 2,
                    child: Container(
                      height: 55.h,
                      padding: EdgeInsets.only(
                        left: 10.w,
                        right: 10.w,
                        top: 5.h,
                        bottom: 5.h,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(5.r),
                          bottomRight: Radius.circular(5.r),
                        ),
                        color: const Color.fromRGBO(217, 217, 217, 1),
                      ),
                      child: Column(
                        children: [
                          Text(
                            '\$1200',
                            style: globalTextStyle(
                                fontSize: 22.sp,
                                color: AppColors.dark,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            'Total Winnings',
                            style: globalTextStyle(
                              fontSize: maxWidth > 600 ? 10.sp : 12.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.dark,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      });
    });
  }
}
