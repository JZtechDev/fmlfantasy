import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/model/match_center_inner_model.dart';

class PointsGrid extends StatelessWidget {
  final PlayersBreakDown playersdata;
  const PointsGrid({super.key, required this.playersdata});

  @override
  Widget build(BuildContext context) {
    // Sort stats by value in descending order (highest first)
    List<StatsBreakDown> sortedStats = List.from(playersdata.statsBreakDown)
      ..sort((a, b) => b.value!.compareTo(a.value!));

    return Container(
      padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
      width: Get.width,
      color: AppColors.primaryLight,
      child: Padding(
        padding: EdgeInsets.only(left: 3.w, right: 3.w),
        child: Wrap(
          spacing: 5.w,
          runSpacing: 5.h,
          children: sortedStats.asMap().entries.map((entry) {
            int index = entry.key;
            StatsBreakDown data = entry.value;

            Color containerColor =
                (index < 3) ? AppColors.secondary : AppColors.primaryLight;
            Color textColor =
                (index < 3) ? AppColors.darkGreen : AppColors.white;

            return Container(
              alignment: Alignment.center,
              height: 70.h,
              width: Get.width * 0.3,
              padding: EdgeInsets.only(left: 2.w, right: 2.w),
              decoration: BoxDecoration(
                color: containerColor,
                borderRadius: BorderRadius.circular(5.r),
                border: Border.all(
                  color: AppColors.secondary,
                  width: 1.5,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    data.value!.toStringAsFixed(0).padLeft(2, "0"),
                    style: globalTextStyle(
                        fontSize: 24.sp,
                        color: textColor,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    data.name!,
                    style: globalTextStyle2(
                        fontSize: 12.sp,
                        color: textColor,
                        fontWeight: FontWeight.w700),
                  )
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
