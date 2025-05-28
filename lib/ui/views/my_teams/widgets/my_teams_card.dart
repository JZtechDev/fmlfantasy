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
          child: Column(
            children: [
              Container(
                clipBehavior: Clip.hardEdge,
                width: Get.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5.r),
                    topRight: Radius.circular(5.r),
                  ),
                  color: AppColors.primary,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                          left: 14.w, right: 14.w, top: 10.h, bottom: 10.h),
                      decoration: const BoxDecoration(
                          color: Color.fromRGBO(18, 96, 85, 1)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/new_images/Award.png',
                                  height: 24,
                                  width: 24,
                                  color: AppColors.secondary,
                                ),
                                horizontalSpace(5.w),
                                SizedBox(
                                  width: Get.width * 0.4,
                                  child: Text(
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    myTeams.matchData!.competition ?? '-',
                                    style: globalTextStyle2(
                                        fontSize: 12.sp,
                                        color: AppColors.secondary,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  'assets/new_images/Clock.png',
                                  height: 16.h,
                                  width: 16.w,
                                ),
                                horizontalSpace(5.w),
                                Text(
                                  myTeams.matchData!.status!
                                      .split('_')
                                      .join(' ')
                                      .capitalize!,
                                  style: globalTextStyle(
                                    fontSize: maxWidth > 600 ? 8.sp : 12.sp,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.secondary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    verticalSpace(10.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Container(
                              constraints: BoxConstraints(
                                maxHeight: 40.h,
                                maxWidth: 45.w,
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
                            verticalSpace(5.h),
                            Text(
                              myTeams.matchData!.homeShortName!,
                              style: globalTextStyle(
                                  fontSize: maxWidth > 600 ? 10.sp : 12.sp,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.secondary),
                            ),
                          ],
                        ),
                        Container(
                          alignment: Alignment.center,
                          height: 30.h,
                          width: 30.w,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.backgroud),
                          child: Text(
                            'vs',
                            style: globalTextStyle(
                              fontSize: maxWidth > 600 ? 10.sp : 12.sp,
                              fontWeight: FontWeight.w700,
                              color: AppColors.secondary,
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            Container(
                              constraints: BoxConstraints(
                                maxHeight: 41.h,
                                maxWidth: 45.w,
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
                            verticalSpace(5.h),
                            Text(
                              myTeams.matchData!.awayShortName!,
                              style: globalTextStyle(
                                  fontSize: maxWidth > 600 ? 10.sp : 12.sp,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.secondary),
                            ),
                          ],
                        ),
                      ],
                    ),
                    verticalSpace(10),
                  ],
                ),
              ),
              myTeams.matchData!.status! == 'not_started'
                  ? Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.w, vertical: 10.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10.r),
                          bottomRight: Radius.circular(10.r),
                        ),
                        color: const Color.fromRGBO(18, 96, 85, 1),
                      ),
                      child: Text(
                        'Match Not Started Yet!',
                        style: globalTextStyle2(
                            fontSize: 12.sp,
                            color: AppColors.secondary,
                            fontWeight: FontWeight.w700),
                      ),
                    )
                  : myTeams.matchData!.homeScore == null &&
                          myTeams.matchData!.homeScore == null
                      ? Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.w, vertical: 10.h),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10.r),
                              bottomRight: Radius.circular(10.r),
                            ),
                            color: const Color.fromRGBO(18, 96, 85, 1),
                          ),
                          child: Text(
                            'Something Went Wrong!!',
                            style: globalTextStyle2(
                                fontSize: 12.sp,
                                color: AppColors.secondary,
                                fontWeight: FontWeight.w700),
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
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(10.r),
                                    bottomRight: Radius.circular(10.r),
                                  ),
                                  color: const Color.fromRGBO(18, 96, 85, 1),
                                ),
                                child: Text(
                                  myTeams.matchData!.homeScore.toString(),
                                  style: globalTextStyle2(
                                      fontSize: 12.sp,
                                      color: AppColors.secondary,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            ),
                            horizontalSpace(10.w),
                            Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10.w, vertical: 10.h),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(10.r),
                                    bottomRight: Radius.circular(10.r),
                                  ),
                                  color: const Color.fromRGBO(18, 96, 85, 1),
                                ),
                                child: Text(
                                  myTeams.matchData!.awayScore.toString(),
                                  style: globalTextStyle2(
                                      fontSize: 12.sp,
                                      color: AppColors.secondary,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            )
                          ],
                        )
            ],
          ));
    });
  }
}
