import 'package:fmlfantasy/app/app_sizings.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/ui/helpers/replace_svg_with_png.dart';
import 'package:fmlfantasy/ui/views/home/controller/home_controller.dart';
import 'package:fmlfantasy/model/tournament_model.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fmlfantasy/ui/widgets/primary_button.dart';
import 'package:intl/intl.dart';

class TournamentCardSlider extends GetView<HomeController> {
  final Tournaments tournament;

  const TournamentCardSlider({super.key, required this.tournament});

  String formatEndDateTime(DateTime endDate) {
    final DateTime now = DateTime.now().toLocal();
    if (endDate.isBefore(now)) {
      return 'Ended';
    }
    return DateFormat('dd MMM yyyy, hh:mm a').format(endDate);
  }

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    final DateTime endDate = DateTime.parse(tournament.startDate.toString());
    final String formattedDifference = formatEndDateTime(endDate.toLocal());
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        return Stack(
          children: [
            Container(
              clipBehavior: Clip.hardEdge,
              margin: const EdgeInsets.symmetric(vertical: 5),
              padding: EdgeInsets.only(
                  top: 10.h, left: 10.w, right: 10.w, bottom: 20.h),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('Tournament Name Here',
                              style: globalTextStyle(
                                  fontSize: width > 500 ? 8.sp : 12.sp,
                                  fontWeight: FontWeight.w600)),
                          Row(
                            children: [
                              SvgPicture.asset(
                                'assets/icons/clock.svg',
                                height: 15.h,
                                color: AppColors.secondary,
                              ),
                              horizontalSpace(5.w),
                              Text(
                                formattedDifference,
                                style: globalTextStyle(
                                  fontSize: width > 500 ? 8.sp : 12.sp,
                                  color: AppColors.secondary,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      verticalSpace(10.h),
                      Row(
                        children: [
                          Container(
                            constraints: BoxConstraints(
                              maxHeight: 15.h,
                              minHeight: 15.h,
                              maxWidth: 15.w,
                              minWidth: 15.w,
                            ),
                            child: tournament.matches![0].homeImageUrl == null
                                ? Container()
                                : tournament.matches![0].homeImageUrl!
                                        .endsWith('.svg.png')
                                    ? Container()
                                    : tournament.matches![0].homeImageUrl!
                                            .endsWith('svg')
                                        ? controller.selectedSport.value ==
                                                    'CR' ||
                                                controller
                                                        .selectedSport.value ==
                                                    'FB'
                                            ? Image.network(
                                                replaceSvgWithPng(tournament
                                                    .matches![0].homeImageUrl
                                                    .toString()),
                                                fit: BoxFit.fill,
                                              )
                                            : SvgPicture.network(
                                                tournament
                                                    .matches![0].homeImageUrl
                                                    .toString(),
                                                fit: BoxFit.fill,
                                              )
                                        : Image.network(
                                            tournament.matches![0].homeImageUrl
                                                .toString(),
                                            fit: BoxFit.fill,
                                          ),
                          ),
                          horizontalSpace(5.w),
                          Text(
                            textAlign: TextAlign.start,
                            tournament.matches![0].home.toString(),
                            style: globalTextStyle(
                                fontSize: width > 500 ? 10.sp : 14.sp,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                              constraints: BoxConstraints(
                                maxHeight: 15.h,
                                minHeight: 15.h,
                                maxWidth: 15.w,
                                minWidth: 15.w,
                              ),
                              child: tournament.matches![0].awayImageUrl == null
                                  ? Container()
                                  : tournament.matches![0].awayImageUrl!
                                          .endsWith('.svg.png')
                                      ? Container()
                                      : tournament.matches![0].awayImageUrl!
                                              .endsWith('svg')
                                          ? controller.selectedSport.value ==
                                                      'CR' ||
                                                  controller.selectedSport
                                                          .value ==
                                                      'FB'
                                              ? Image.network(
                                                  replaceSvgWithPng(tournament
                                                      .matches![0].awayImageUrl
                                                      .toString()),
                                                  fit: BoxFit.fill,
                                                )
                                              : SvgPicture.network(
                                                  tournament.matches![0]
                                                      .awayImageUrl!,
                                                  fit: BoxFit.fill,
                                                )
                                          : Image.network(
                                              tournament
                                                  .matches![0].awayImageUrl!,
                                              fit: BoxFit.fill,
                                            )),
                          horizontalSpace(5.w),
                          Text(
                            textAlign: TextAlign.start,
                            tournament.matches![0].away.toString(),
                            style: globalTextStyle(
                                fontSize: width > 500 ? 10.sp : 14.sp,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                      verticalSpace(10.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                              width: Get.width * 0.4,
                              child: Row(
                                children: [
                                  Image.asset(
                                    'assets/new_images/Award.png',
                                    height: 28,
                                    width: 28,
                                    color: AppColors.secondary,
                                  ),
                                  horizontalSpace(10.w),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'prizePool'.tr,
                                        style: globalTextStyle2(
                                            fontSize:
                                                width > 500 ? 8.sp : 12.sp,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      Text(
                                        tournament.prize == 0
                                            ? 'Free Entry'
                                            : '\$${tournament.prize}',
                                        textAlign: TextAlign.left,
                                        style: globalTextStyle(
                                            fontSize:
                                                width > 500 ? 12.sp : 16.sp,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                          PrimaryButton(
                              buttonWidth: Get.width * 0.4,
                              backgroundColor: AppColors.secondary,
                              buttonText: 'Join for \$${tournament.prize}',
                              onPressed: () {
                                Get.toNamed(AppRoutes.selectPlayers,
                                    arguments: {
                                      'matchID':
                                          tournament.matches![0].matchCode,
                                      'sport': controller.selectedSport.value,
                                      'tournamentId': tournament.id
                                    });
                              },
                              isEnabled: true)
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
