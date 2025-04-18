import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/ui/views/players/controller/players_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

class PlayersTile extends StatelessWidget {
  final Player player;
  const PlayersTile({super.key, required this.player});

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
                player.rank!,
                style: globalTextStyle(
                  color: AppColors.dark,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
          SizedBox(
            width: Get.width * 0.3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  player.name!,
                  style: globalTextStyle(
                    fontSize: 12.sp,
                  ),
                ),
                Text(
                  player.position!,
                  style: globalTextStyle2(
                      fontSize: 10.sp,
                      color: AppColors.textGray,
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
          Text(
            player.country!,
            style: globalTextStyle(
              fontSize: 12.sp,
            ),
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
