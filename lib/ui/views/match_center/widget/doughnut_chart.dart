import 'package:fmlfantasy/app/app_sizings.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/model/match_center_inner_model.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DoughnutChart extends StatelessWidget {
  final PlayersBreakDown playersdata;
  const DoughnutChart({super.key, required this.playersdata});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      double maxWidth = constraints.maxWidth;
      return Container(
        clipBehavior: Clip.antiAlias,
        margin: EdgeInsets.only(left: 10.w, right: 10.w),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(5.r),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              bottom: maxWidth > 600 ? 95 : 75,
              right: 0,
              child: Image.asset(
                'assets/images/BG.png',
                width: Get.width,
                fit: BoxFit.fill,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.w, right: 10.w),
              child: SizedBox(
                height: Get.height * 0.25,
                child: SfCircularChart(
                  tooltipBehavior:
                      TooltipBehavior(activationMode: ActivationMode.singleTap),
                  centerX: '50%',
                  centerY: '30%',
                  series: <CircularSeries>[
                    DoughnutSeries<FantasyPointsBreakDown, String>(
                      dataSource:
                          playersdata.fantasyPointsBreakDown.take(4).toList(),
                      pointColorMapper:
                          (FantasyPointsBreakDown data, int index) {
                        List<Color> colors = [
                          const Color.fromRGBO(0, 166, 251, 1),
                          const Color.fromRGBO(5, 130, 202, 1),
                          const Color.fromRGBO(0, 100, 148, 1),
                          const Color.fromRGBO(0, 53, 84, 1),
                          const Color.fromRGBO(5, 25, 35, 1),
                          // Add more colors if needed
                        ];
                        // Return the color based on the index
                        return colors[index % colors.length];
                      },
                      xValueMapper: (FantasyPointsBreakDown data, _) =>
                          data.name,
                      yValueMapper: (FantasyPointsBreakDown data, _) =>
                          data.value,
                      strokeWidth: 1,
                      innerRadius: '80%',
                      radius: '70%',
                    ),
                  ],
                  annotations: <CircularChartAnnotation>[
                    CircularChartAnnotation(
                      widget: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          verticalSpace(20.h),
                          Text(
                            playersdata.fantasyPoints!
                                .toStringAsFixed(0)
                                .padLeft(0, "2"),
                            style: globalTextStyle(
                              fontSize: maxWidth > 600 ? 23.sp : 31.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            'Fantasy Points'.tr,
                            style: globalTextStyle(
                                fontSize:
                                    AppSizing.isMobile(context) ? 8.sp : 8.sp,
                                fontWeight: FontWeight.w700,
                                color: AppColors.textGray),
                          ),
                          // verticalSpace(50),
                        ],
                      ),
                      radius: '0%', // Center of the doughnut
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: maxWidth > 600 ? 0 : 10,
              left: 30,
              right: 30,
              child: Container(
                // Add a container to control size
                constraints: const BoxConstraints(
                  maxWidth: 300, // Set a maximum width if needed
                ),
                child: Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 5.w,
                  runSpacing: 5.h,
                  children: playersdata.fantasyPointsBreakDown
                      .asMap()
                      .entries
                      .take(4)
                      .map((entry) {
                    int index = entry.key;
                    var data = entry.value;

                    List<Color> colors = [
                      const Color.fromRGBO(0, 166, 251, 1),
                      const Color.fromRGBO(5, 130, 202, 1),
                      const Color.fromRGBO(0, 100, 148, 1),
                      const Color.fromRGBO(0, 53, 84, 1),
                      const Color.fromRGBO(5, 25, 35, 1),
                    ];

                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize:
                          MainAxisSize.min, // Ensures Row uses minimal width
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: maxWidth > 600 ? 8.sp : 12.sp,
                          height: maxWidth > 600 ? 8.sp : 12.sp,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: colors[index %
                                colors.length], // Assign color from list
                          ),
                        ),
                        SizedBox(width: 5.w), // Horizontal spacing
                        Text(
                          data.name.toString(),
                          style: globalTextStyle(
                            fontSize: maxWidth > 600 ? 8.sp : 12.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(width: 10), // Horizontal spacing
                      ],
                    );
                  }).toList(),
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}
