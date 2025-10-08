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
      padding: EdgeInsets.symmetric(vertical: 10.h),
      width: Get.width,
      color: AppColors.primaryLight,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.w),
        child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 5.w,
            mainAxisSpacing: 5.h,
            childAspectRatio: 1.2, // Adjust as needed for proper height
          ),
          itemCount: sortedStats.length,
          itemBuilder: (context, index) {
            StatsBreakDown data = sortedStats[index];

            Color containerColor =
                (index < 3) ? AppColors.secondary : AppColors.primaryLight;
            Color textColor =
                (index < 3) ? AppColors.darkGreen : AppColors.white;

            return Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 2.w),
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
          },
        ),
      ),
    );
  }
}
