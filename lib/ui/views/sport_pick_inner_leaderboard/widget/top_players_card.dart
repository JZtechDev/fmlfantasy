import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fmlfantasy/app/app_colors/app_colors.dart';
import 'package:fmlfantasy/app/app_images/app_images.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/ui/helpers/commons.dart';
import 'package:get/get_core/src/get_main.dart';

class TopPlayersCardLeaderboard extends StatelessWidget {
  final String? imageUrl;
  final String? name;
  final String? team;
  final String rank;

  const TopPlayersCardLeaderboard({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.team,
    required this.rank,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
            height: Get.height * 0.2,
            width: Get.width * 0.44,
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.r),
                topRight: Radius.circular(10.r),
              ),
              border: Border.all(color: AppColors.secondary),
            ),
            child: Stack(
              children: [
                Align(
                    alignment: Alignment.bottomCenter,
                    child: _buildPlayerImage()),
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    width: 50,
                    height: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppColors.secondary,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10.r),
                        bottomRight: Radius.circular(10.r),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/new_images/trophy.png',
                          height: 15,
                        ),
                        Text(
                          rank,
                          style: globalTextStyle2(
                              fontSize: 12.sp, color: AppColors.dark),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )),
        verticalSpace(2.h),
        _buildRankBadge(),
        verticalSpace(2.h),
      ],
    );
  }

  Widget _buildPlayerImage() {
    if (imageUrl == null || imageUrl!.isEmpty) {
      return Image.asset(AppImages.userPlaceHolder, height: 90.h);
    } else if (imageUrl!.endsWith('.svg')) {
      return SvgPicture.network(imageUrl!, height: 90.h);
    } else {
      return Image.network(imageUrl!, height: 90.h);
    }
  }

  Widget _buildRankBadge() {
    return Container(
      width: Get.width * 0.44,
      alignment: Alignment.center,
      padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10.r),
          bottomRight: Radius.circular(10.r),
        ),
        color: AppColors.secondary,
      ),
      child: Column(
        children: [
          SizedBox(
            width: Get.width * 0.4,
            child: Text(
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              name ?? '',
              style: globalTextStyle2(fontSize: 12.sp, color: AppColors.dark),
            ),
          ),
          SizedBox(
            width: Get.width * 0.4,
            child: Text(
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              team ?? '',
              style: globalTextStyle2(fontSize: 10.sp, color: AppColors.dark),
            ),
          ),
        ],
      ),
    );
  }
}
