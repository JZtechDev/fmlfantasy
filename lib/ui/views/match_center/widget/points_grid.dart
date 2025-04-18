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

    return Padding(
      padding: EdgeInsets.only(left: 10.w, right: 10.w),
      child: Wrap(
        spacing: 5.w,
        runSpacing: 5.h,
        children: sortedStats.asMap().entries.map((entry) {
          int index = entry.key;
          StatsBreakDown data = entry.value;

          // Apply a different color for the top 3 highest values
          Color containerColor = (index < 3)
              ? AppColors.primary // Gold for the top 3
              : AppColors.white; // Default color for the rest
          Color textColor = (index < 3)
              ? AppColors.white // White text for the top 3
              : AppColors.navyBlue;

          return Container(
            alignment: Alignment.center,
            height: 70.h,
            width: Get.width * 0.3,
            padding: EdgeInsets.only(left: 2.w, right: 2.w),
            decoration: BoxDecoration(
              color: containerColor,
              borderRadius: BorderRadius.circular(5.r),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  data.value!.toStringAsFixed(0).padLeft(2, "0"),
                  style: globalTextStyle(
                      fontSize: 18.sp,
                      color: textColor,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  textAlign: TextAlign.center,
                  data.name!,
                  style: globalTextStyle2(
                      fontSize: 10.sp,
                      color: textColor,
                      fontWeight: FontWeight.w500),
                )
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
