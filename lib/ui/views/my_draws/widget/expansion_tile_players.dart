import 'package:fmlfantasy/app/app_images/app_images.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:flutter_svg/svg.dart';

class ExpansionTilePlayers extends StatelessWidget {
  final String playerName;
  final String playerPosition;
  final String playerImageUrl;
  final String playerTeam;
  final String rank;
  const ExpansionTilePlayers({
    super.key,
    required this.playerName,
    required this.playerPosition,
    required this.playerTeam,
    required this.playerImageUrl,
    required this.rank,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: Get.width * 0.28,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: AppColors.grey,
                  borderRadius: BorderRadius.circular(5.r),
                ),
                child: playerImageUrl.isEmpty
                    ? Image.asset(
                        AppImages.userPlaceHolder,
                        height: 75,
                      )
                    : playerImageUrl.endsWith('.svg')
                        ? SvgPicture.asset(
                            playerImageUrl,
                            height: 75,
                          )
                        : Image.network(
                            playerImageUrl,
                            height: 75,
                          ),
              ),
              horizontalSpace(2.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.grey,
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 5.h, horizontal: 6.w),
                          decoration: BoxDecoration(
                            color: AppColors.grey,
                            borderRadius: BorderRadius.circular(5.r),
                          ),
                          child: Column(
                            children: [
                              SvgPicture.asset(
                                  'assets/icons/publictournament.svg',
                                  height: 15.h),
                              verticalSpace(5.h),
                              Text(
                                rank,
                                style: globalTextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.dark),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  verticalSpace(2.h),
                  Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 2.h, horizontal: 6.w),
                    decoration: BoxDecoration(
                      color: AppColors.grey,
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                    child: Text(
                      playerPosition,
                      style: globalTextStyle(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.dark),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        Text(
          playerName.isEmpty ? '-' : playerName,
          style: globalTextStyle2(fontSize: 10.sp),
        ),
        SizedBox(
          width: Get.width * 0.28,
          child: Text(
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            playerTeam.isEmpty ? '-' : playerTeam,
            style: globalTextStyle2(fontSize: 10.sp, color: AppColors.textGray),
          ),
        )
      ],
    );
  }
}
