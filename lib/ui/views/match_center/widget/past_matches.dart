import 'package:fmlfantasy/app/app_sizings.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/model/match_center_model.dart';
import 'package:fmlfantasy/ui/helpers/replace_svg_with_png.dart';
import 'package:fmlfantasy/ui/views/match_center/controller/match_center_inner_controller.dart';
import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class PastMatchesSlider extends StatelessWidget {
  const PastMatchesSlider({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MatchCenterInner());
    return GetBuilder<MatchCenterInner>(builder: (controller) {
      return Container(
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        color: AppColors.primaryVeryDark,
        child: CarouselSlider.builder(
          itemCount: controller.pastMatches.length,
          itemBuilder: (BuildContext context, int index, int realIndex) {
            PastMatches matches = controller.pastMatches[index];
            bool isSelected =
                controller.selectedMatch.matchKey == matches.matchKey;
            return GestureDetector(
                onTap: () {
                  controller.selectMatch(matches);
                },
                child: Container(
                    clipBehavior: Clip.hardEdge,
                    margin: EdgeInsets.only(left: 40.w, right: 40.w),
                    padding: const EdgeInsets.all(1),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: isSelected
                              ? AppColors.primary
                              : AppColors.borderColor),
                      borderRadius: BorderRadius.circular(10.r),
                      color: AppColors.secondary,
                    ),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: AppColors.primaryLight,
                              borderRadius: BorderRadius.circular(10.r)),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      children: [
                                        matches.homeImageUrl == null ||
                                                matches.homeImageUrl!.isEmpty
                                            ? Container()
                                            : controller.sportsCode == 'CR'
                                                ? Image.network(
                                                    replaceSvgWithPng(
                                                        matches.homeImageUrl!),
                                                    height: 35.h,
                                                    width: 35.w,
                                                  )
                                                : matches.homeImageUrl!
                                                        .endsWith('.svg')
                                                    ? SvgPicture.network(
                                                        matches.homeImageUrl!,
                                                        height: 35.h,
                                                        width: 35.w,
                                                      )
                                                    : Image.network(
                                                        matches.homeImageUrl!,
                                                        height: 35.h,
                                                        width: 35.w,
                                                      ),
                                        verticalSpace(10.h),
                                        SizedBox(
                                          width: Get.width * 0.25,
                                          child: Text(
                                            textAlign: TextAlign.center,
                                            matches.home ?? '',
                                            style: globalTextStyle2(
                                              fontSize:
                                                  AppSizing.isMobile(context)
                                                      ? 12.sp
                                                      : 10.sp,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
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
                                    Column(
                                      children: [
                                        matches.awayImageUrl == null ||
                                                matches.awayImageUrl!.isEmpty
                                            ? Container()
                                            : controller.sportsCode == 'CR'
                                                ? Image.network(
                                                    replaceSvgWithPng(
                                                        matches.awayImageUrl!),
                                                    height: 35.h,
                                                    width: 35.w,
                                                  )
                                                : matches.awayImageUrl!
                                                        .endsWith('.svg')
                                                    ? SvgPicture.network(
                                                        matches.awayImageUrl!,
                                                        height: 35.h,
                                                        width: 35.w,
                                                      )
                                                    : Image.network(
                                                        matches.awayImageUrl!,
                                                        height: 35.h,
                                                        width: 35.w,
                                                      ),
                                        verticalSpace(10.h),
                                        SizedBox(
                                          width: Get.width * 0.25,
                                          child: Text(
                                            textAlign: TextAlign.center,
                                            matches.away ?? '',
                                            style: globalTextStyle2(
                                              fontSize:
                                                  AppSizing.isMobile(context)
                                                      ? 12.sp
                                                      : 10.sp,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                )
                              ]),
                        ),
                        verticalSpace(5.h),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                matches.competitionName != null
                                    ? matches.competitionName!
                                        .split(' ')
                                        .where((word) => word.isNotEmpty)
                                        .map((word) => word[0].toUpperCase())
                                        .join()
                                    : '',
                                style: globalTextStyle(
                                  fontSize: AppSizing.isMobile(context)
                                      ? 14.sp
                                      : 8.sp,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.darkGreen,
                                ),
                              ),
                              verticalSpace(5),
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/new_images/calender.png',
                                    height: 15.h,
                                    width: 15.w,
                                    color: AppColors.darkGreen,
                                  ),
                                  horizontalSpace(5.w),
                                  Text(
                                      matches.start != null
                                          ? DateFormat('d MMM hh:mm a').format(
                                              DateTime.parse(
                                                      matches.start ?? '')
                                                  .toLocal())
                                          : '',
                                      style: globalTextStyle2(
                                          fontSize: AppSizing.isTablet(context)
                                              ? 8.sp
                                              : 12.sp,
                                          fontWeight: FontWeight.w700,
                                          color: AppColors.navyBlue),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    )));
          },
          options: CarouselOptions(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            aspectRatio: AppSizing.isMobile(context) ? 25 / 10 : 25 / 8,
            viewportFraction: AppSizing.isMobile(context) ? 0.9 : 0.6,
            padEnds: true,
            initialPage: 0,
            disableCenter: true,
            enableInfiniteScroll: false,
            reverse: false,
            autoPlay: false,
            enlargeCenterPage: false,
            scrollDirection: Axis.horizontal,
            onPageChanged: (index, reason) {},
          ),
        ),
      );
    });
  }
}
