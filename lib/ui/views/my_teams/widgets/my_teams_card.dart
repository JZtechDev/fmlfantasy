import 'dart:math';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/model/my_teams_model.dart';
import 'package:fmlfantasy/ui/helpers/replace_svg_with_png.dart';
import 'package:fmlfantasy/ui/views/my_teams/controller/my_teams_controller.dart';
import 'package:flutter_svg/svg.dart';

class MyTeamsCard extends GetView<MyTeamsController> {
  final MyTeamsModel myTeams;
  final int index;
  const MyTeamsCard(this.index, {super.key, required this.myTeams});

  @override
  Widget build(BuildContext context) {
    Get.put(MyTeamsController());
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      final maxWidth = constraints.maxWidth;
      return Padding(
          padding: EdgeInsets.only(left: 10.w, right: 10.w, bottom: 10.h),
          child: Container(
            clipBehavior: Clip.hardEdge,
            padding: const EdgeInsets.all(10),
            width: Get.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.r),
              color: AppColors.white,
              border: Border.all(
                color: AppColors.borderColor,
                width: 2,
              ),
            ),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.bottomRight,
                  child: Transform.rotate(
                    origin: const Offset(60, 10),
                    angle: pi / 4.5,
                    child: Container(
                      height: 150.0,
                      width: 40.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        gradient: const LinearGradient(
                          colors: [
                            Color.fromRGBO(219, 231, 255, 1),
                            Color.fromRGBO(219, 231, 255, 0)
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomRight,
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Transform.rotate(
                    origin: const Offset(-100, 100),
                    angle: pi / 4.5,
                    child: Container(
                      height: 150.0,
                      width: 60.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        gradient: const LinearGradient(
                          colors: [
                            Color.fromRGBO(219, 231, 255, 1),
                            Color.fromRGBO(219, 231, 255, 0)
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomRight,
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Transform.rotate(
                    origin: const Offset(-70, 70),
                    angle: pi / 4.5,
                    child: Container(
                      height: 150.0,
                      width: 60.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        gradient: const LinearGradient(
                          colors: [
                            Color.fromRGBO(219, 231, 255, 1),
                            Color.fromRGBO(219, 231, 255, 0)
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomRight,
                        ),
                      ),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: Get.width * 0.6,
                          child: Text(
                            myTeams.matchData!.competition ?? '-',
                            style: globalTextStyle2(
                                fontSize: 12.sp, color: AppColors.textGray),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          height: 30.h,
                          padding: const EdgeInsets.only(
                            left: 10,
                            right: 10,
                            top: 5,
                            bottom: 5,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.r),
                            color: AppColors.grey,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SvgPicture.asset(
                                'assets/icons/clock.svg',
                                // ignore: deprecated_member_use
                                color: AppColors.errorRed,
                                width: maxWidth > 600 ? 12.w : 15.w,
                                height: maxWidth > 600 ? 12.h : 15.h,
                              ),
                              horizontalSpace(10.w),
                              Text(
                                myTeams.matchData!.status!
                                    .split('_')
                                    .join(' ')
                                    .capitalize!,
                                style: globalTextStyle(
                                  fontSize: maxWidth > 600 ? 8.sp : 10.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.errorRed,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    verticalSpace(20.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Container(
                              constraints: BoxConstraints(
                                maxHeight: 27.h,
                                maxWidth: 35.w,
                              ),
                              child: myTeams.matchData!.homeImageUrl == null
                                  ? Container()
                                  : myTeams.matchData!.homeImageUrl!
                                          .endsWith('.png')
                                      ? Image.network(
                                          myTeams.matchData!.homeImageUrl!,
                                          fit: BoxFit.fill,
                                        )
                                      : controller.selectedSport.value == 'CR'
                                          ? Image.network(
                                              replaceSvgWithPng(myTeams
                                                  .matchData!.homeImageUrl!),
                                              fit: BoxFit.fill,
                                            )
                                          : SvgPicture.network(
                                              myTeams.matchData!.homeImageUrl!
                                                  .toString(),
                                              fit: BoxFit.fill,
                                            ),
                            ),
                            verticalSpace(10.h),
                            Text(
                              myTeams.matchData!.homeShortName!,
                              style: globalTextStyle(
                                fontSize: maxWidth > 600 ? 10.sp : 12.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          'vs',
                          style: globalTextStyle(
                            fontSize: maxWidth > 600 ? 10.sp : 12.sp,
                            fontWeight: FontWeight.w700,
                            color: AppColors.textGray,
                          ),
                        ),
                        Column(
                          children: [
                            Container(
                              constraints: BoxConstraints(
                                maxHeight: 27.h,
                                maxWidth: 35.w,
                              ),
                              child: myTeams.matchData!.awayImageUrl == null
                                  ? Container()
                                  : myTeams.matchData!.awayImageUrl!
                                          .endsWith('.png')
                                      ? Image.network(
                                          myTeams.matchData!.awayImageUrl!,
                                          fit: BoxFit.fill,
                                        )
                                      : controller.selectedSport.value == 'CR'
                                          ? Image.network(
                                              replaceSvgWithPng(myTeams
                                                  .matchData!.awayImageUrl!),
                                              fit: BoxFit.fill,
                                            )
                                          : SvgPicture.network(
                                              myTeams.matchData!.awayImageUrl!
                                                  .toString(),
                                              fit: BoxFit.fill,
                                            ),
                            ),
                            verticalSpace(10.h),
                            Text(
                              myTeams.matchData!.awayShortName!,
                              style: globalTextStyle(
                                fontSize: maxWidth > 600 ? 10.sp : 12.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    verticalSpace(10),
                    myTeams.matchData!.status! == 'not_started'
                        ? Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.w, vertical: 10.h),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.r),
                              border: Border.all(
                                color: AppColors.borderColor,
                              ),
                            ),
                            child: Text(
                              'Match Not Started Yet!',
                              style: globalTextStyle(
                                  fontSize: maxWidth > 600 ? 10.sp : 12.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.errorRed),
                            ),
                          )
                        : myTeams.matchData!.homeScore == null &&
                                myTeams.matchData!.homeScore == null
                            ? Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10.w, vertical: 10.h),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.r),
                                  border: Border.all(
                                    color: AppColors.borderColor,
                                  ),
                                ),
                                child: Text(
                                  'Something Went Wrong!!',
                                  style: globalTextStyle(
                                      fontSize: maxWidth > 600 ? 10.sp : 12.sp,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.errorRed),
                                ),
                              )
                            : Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      alignment: Alignment.center,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10.w, vertical: 10.h),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(5.r),
                                        border: Border.all(
                                          color: AppColors.borderColor,
                                        ),
                                      ),
                                      child: Text(
                                        myTeams.matchData!.homeScore.toString(),
                                        style:
                                            globalTextStyle2(fontSize: 12.sp),
                                      ),
                                    ),
                                  ),
                                  horizontalSpace(5.w),
                                  Expanded(
                                    child: Container(
                                      alignment: Alignment.center,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10.w, vertical: 10.h),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(5.r),
                                        border: Border.all(
                                          color: AppColors.borderColor,
                                        ),
                                      ),
                                      child: Text(
                                        myTeams.matchData!.awayScore.toString(),
                                        style:
                                            globalTextStyle2(fontSize: 12.sp),
                                      ),
                                    ),
                                  )
                                ],
                              )
                  ],
                ),
              ],
            ),
          ));
    });
  }
}
