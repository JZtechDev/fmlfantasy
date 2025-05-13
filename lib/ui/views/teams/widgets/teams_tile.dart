import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/ui/views/teams/controller/teams_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

class TeamsTile extends StatelessWidget {
  final AllTeams teams;
  const TeamsTile({super.key, required this.teams});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: AppColors.borderColor),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                'assets/icons/publictournament.svg',
                // ignore: deprecated_member_use
                color: AppColors.primary,
                height: 16.h,
                width: 16.w,
              ),
              horizontalSpace(5),
              Text(
                teams.teamRank!,
                style: globalTextStyle(
                  color: AppColors.dark,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
          SizedBox(
            width: Get.width * 0.2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  teams.teamName!,
                  style: globalTextStyle(
                    fontSize: 12.sp,
                  ),
                ),
                Text(
                  teams.matchesPlayed!,
                  style: globalTextStyle2(
                      fontSize: 10.sp,
                      color: AppColors.textGray,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          SizedBox(
            width: Get.width * 0.15,
            child: Text(
              textAlign: TextAlign.center,
              teams.matchesWon.toString(),
              style:
                  globalTextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500),
            ),
          ),
          Text(
            teams.matchLost.toString(),
            style:
                globalTextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500),
          ),
          const Icon(
            CupertinoIcons.chevron_right,
            size: 20,
            color: AppColors.textGray,
          )
        ],
      ),
    );
  }
}
