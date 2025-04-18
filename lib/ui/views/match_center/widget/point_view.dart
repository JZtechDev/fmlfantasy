// import 'package:fmlfantasy/app/textstyles/textstyle.dart';
// import 'package:fmlfantasy/core/imports/imports.dart';
// import 'package:fmlfantasy/ui/views/match_center/controller/match_center_inner_controller.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';

// class PointView extends GetView<MatchCenterInner> {
//   const PointView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     Get.put(MatchCenterInner());
//     return Container(
//       width: 208.w,
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(2.5.r), color: Colors.white),
//       child: Row(
//         children: [
//           Expanded(
//             flex: 2,
//             child: Container(
//               child: SfCircularChart(
//                 legend: Legend(
//                   toggleSeriesVisibility: false,
//                   orientation: LegendItemOrientation.vertical,
//                   overflowMode: LegendItemOverflowMode.wrap,
//                   alignment: ChartAlignment.near,
//                   isVisible: true,
//                   position: LegendPosition.right,
//                   isResponsive: true,
//                   shouldAlwaysShowScrollbar: false,
//                   legendItemBuilder:
//                       (String name, dynamic series, dynamic point, int index) {
//                     final ChartData data = controller.chartData[index];
//                     List<Color> colors = [
//                       const Color.fromRGBO(0, 166, 251, 1),
//                       const Color.fromRGBO(5, 130, 202, 1),
//                       const Color.fromRGBO(0, 100, 148, 1),
//                       const Color.fromRGBO(0, 53, 84, 1),
//                       const Color.fromRGBO(5, 25, 35, 1),
//                     ];
//                     Color itemColor = colors[index % colors.length];
//                     return Row(
//                       children: [
//                         Container(
//                           width: 12,
//                           height: 12,
//                           decoration: BoxDecoration(
//                             shape: BoxShape.circle,
//                             color: itemColor,
//                           ),
//                         ),
//                         SizedBox(width: 5),
//                         Text(
//                           data.x.toString(),
//                           style: globalTextStyle(
//                             fontSize: 12.sp,
//                             fontWeight: FontWeight.w400,
//                           ),
//                         ),
//                       ],
//                     );
//                   },
//                 ),
//                 series: <CircularSeries>[
//                   DoughnutSeries<ChartData, String>(
//                     dataSource: controller.chartData,
//                     pointColorMapper: (ChartData data, _) => data.color,
//                     xValueMapper: (ChartData data, _) => data.x,
//                     yValueMapper: (ChartData data, _) => data.y,
//                     innerRadius: '80%',
//                     radius: '80%',
//                   ),
//                 ],
//                 annotations: <CircularChartAnnotation>[
//                   CircularChartAnnotation(
//                     widget: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text(
//                           '42',
//                           style: globalTextStyle(
//                             fontSize: 31.sp,
//                             fontWeight: FontWeight.w700,
//                           ),
//                         ),
//                         Text(
//                           'Points',
//                           style: globalTextStyle(
//                               fontSize: 12.sp,
//                               fontWeight: FontWeight.w700,
//                               color: AppColors.textGray),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           Expanded(
//             flex: 1,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 for (int i = 0; i < controller.chartData.length; i++)
//                   legendItemBuilder(
//                       controller.chartData[i].x.toString(), null, null, i),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget legendItemBuilder(
//       String name, dynamic series, dynamic point, int index) {
//     final ChartData data = controller.chartData[index];
//     List<Color> colors = [
//       const Color.fromRGBO(0, 166, 251, 1),
//       const Color.fromRGBO(5, 130, 202, 1),
//       const Color.fromRGBO(0, 100, 148, 1),
//       const Color.fromRGBO(0, 53, 84, 1),
//       const Color.fromRGBO(5, 25, 35, 1),
//     ];
//     Color itemColor = colors[index % colors.length];
//     return Row(
//       children: [
//         Container(
//           width: 12,
//           height: 12,
//           decoration: BoxDecoration(
//             shape: BoxShape.circle,
//             color: itemColor,
//           ),
//         ),
//         SizedBox(width: 5),
//         Text(
//           data.x.toString(),
//           style: globalTextStyle(
//             fontSize: 12.sp,
//             fontWeight: FontWeight.w400,
//           ),
//         ),
//       ],
//     );
//   }
// }
