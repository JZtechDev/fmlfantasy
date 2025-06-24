import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/model/my_draws_model.dart';
import 'package:fmlfantasy/ui/helpers/local_time.dart';
import 'package:fmlfantasy/ui/helpers/replace_svg_with_png.dart';
import 'package:fmlfantasy/ui/views/my_draws/controller/my_draws_controller.dart';
import 'package:flutter_svg/svg.dart';

class MyDrawsCard extends GetView<MyDrawsController> {
  final DrawTeamsModel myDraws;
  final int index;
  const MyDrawsCard(
    this.index,
    this.myDraws, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(MyDrawsController());
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      final DateTime endDate = DateTime.parse(myDraws.matchStartsAt.toString());
      final String formattedDifference = formatEndDateTime(endDate.toLocal());
      final maxWidth = constraints.maxWidth;
      return Obx(() {
        return Container(
          margin: EdgeInsets.only(bottom: 10.h),
          clipBehavior: Clip.hardEdge,
          width: Get.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.r),
            color: const Color.fromRGBO(18, 96, 85, 1),
          ),
          child: Column(
            children: [
              verticalSpace(10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/new_images/calender.png',
                    color: AppColors.secondary,
                    width: maxWidth > 600 ? 24.w : 20.w,
                    height: maxWidth > 600 ? 24.h : 20.h,
                  ),
                  horizontalSpace(10.w),
                  Text(
                    formattedDifference,
                    style: globalTextStyle(
                      fontSize: maxWidth > 600 ? 8.sp : 14.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.secondary,
                    ),
                  ),
                ],
              ),
              verticalSpace(20.h),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                    color: AppColors.primary,
                    border: Border(
                      top: BorderSide(color: AppColors.borderColor, width: 1),
                    )),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          constraints: BoxConstraints(
                            maxHeight: 27.h,
                            maxWidth: 35.w,
                          ),
                          child: myDraws.homeTeamImageUrl == null
                              ? Container()
                              : myDraws.homeTeamImageUrl!.endsWith('.svg')
                                  ? controller.selectedSport.value == 'CR'
                                      ? Image.network(
                                          replaceSvgWithPng(
                                              myDraws.homeTeamImageUrl!),
                                        )
                                      : SvgPicture.network(
                                          myDraws.homeTeamImageUrl!,
                                        )
                                  : Image.network(myDraws.homeTeamImageUrl!,
                                      height: 45.h, width: 45.w),
                        ),
                        verticalSpace(10.h),
                        SizedBox(
                          width: Get.width * 0.3,
                          child: Text(
                            textAlign: TextAlign.center,
                            myDraws.homeTeamName!,
                            style: globalTextStyle(
                                fontSize: maxWidth > 600 ? 12.sp : 14.sp,
                                fontWeight: FontWeight.w600,
                                color: AppColors.secondary),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 10.h),
                          padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                              color: AppColors.backgroud,
                              shape: BoxShape.circle),
                          child: Text(
                            'vs',
                            style: globalTextStyle2(
                                fontWeight: FontWeight.w700,
                                fontSize: 12.sp,
                                color: AppColors.secondary),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          constraints: BoxConstraints(
                            maxHeight: 27.h,
                            maxWidth: 35.w,
                          ),
                          child: myDraws.awayTeamImageUrl == null
                              ? Container()
                              : myDraws.awayTeamImageUrl!.endsWith('.svg')
                                  ? controller.selectedSport.value == 'CR'
                                      ? Image.network(
                                          replaceSvgWithPng(
                                              myDraws.awayTeamImageUrl!),
                                        )
                                      : SvgPicture.network(
                                          myDraws.awayTeamImageUrl!,
                                        )
                                  : Image.network(myDraws.awayTeamImageUrl!,
                                      height: 45.h, width: 45.w),
                        ),
                        verticalSpace(10.h),
                        SizedBox(
                          width: Get.width * 0.3,
                          child: Text(
                            textAlign: TextAlign.center,
                            myDraws.awayTeamName!,
                            style: globalTextStyle(
                                fontSize: maxWidth > 600 ? 12.sp : 14.sp,
                                fontWeight: FontWeight.w600,
                                color: AppColors.secondary),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              verticalSpace(10.h),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/new_images/medal.png',
                          height: 20,
                          width: 20,
                          fit: BoxFit.cover,
                        ),
                        horizontalSpace(20),
                        // Text(
                        //   maxLines: 1,
                        //   overflow: TextOverflow.ellipsis,
                        //   myDraws.homeTeamName!.split(' ').join('\n'),
                        //   style: globalTextStyle2(
                        //       fontSize: 14.sp, fontWeight: FontWeight.w700),
                        // ),
                        Text(
                          'won'.tr,
                          style: globalTextStyle(
                              fontSize: 12.sp,
                              color: AppColors.white,
                              fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                    horizontalSpace(20.w),
                    const SizedBox(
                      height: 20,
                      child: VerticalDivider(
                        thickness: 1,
                        color: AppColors.white,
                      ),
                    ),
                    horizontalSpace(20.w),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Total Winnings'.tr,
                            style: globalTextStyle2(
                                fontSize: 14.sp,
                                color: AppColors.white,
                                fontWeight: FontWeight.w600),
                          ),
                          horizontalSpace(10.w),
                          Text(
                            '\$500',
                            style: globalTextStyle(
                                fontSize: 24.sp, fontWeight: FontWeight.w700),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              verticalSpace(10.h),
            ],
          ),
        );
      });
    });
  }
}
