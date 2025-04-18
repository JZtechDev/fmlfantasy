import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'controller/play_sportypick_controller.dart';

class LeaderboardSportyplay extends StatelessWidget {
  const LeaderboardSportyplay({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(PlaySportypickController());
    return Scaffold(
      appBar: const AppBarGeneral(title: 'Leaderboard Sportyplay'),
      backgroundColor: AppColors.grey,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpace(10),
            Text(
              'Leaderboard',
              style:
                  globalTextStyle(fontWeight: FontWeight.bold, fontSize: 28.sp),
            ),
            verticalSpace(20),
            GetBuilder<PlaySportypickController>(builder: (controller) {
              return Container(
                width: Get.width,
                padding: const EdgeInsets.all(010.0),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Last Week\'s Leaderboard',
                      style: globalTextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16.sp),
                    ),
                    verticalSpace(10),
                    SizedBox(
                      width: Get.width,
                      child: DataTable(
                        headingRowHeight: 40,
                        dividerThickness: 0,
                        columns: [
                          DataColumn(
                            label: Text(
                              'Rank',
                              style: globalTextStyle2(
                                  fontWeight: FontWeight.bold, fontSize: 14),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Name',
                              style: globalTextStyle2(
                                  fontWeight: FontWeight.bold, fontSize: 14),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Points',
                              style: globalTextStyle2(
                                  fontWeight: FontWeight.bold, fontSize: 14),
                            ),
                          ),
                        ],
                        // Row data
                        rows: controller.dummyLeaderboard.map((entry) {
                          return DataRow(cells: [
                            DataCell(
                              Text(
                                entry.rank ?? '',
                                style: globalTextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold),
                                // style: TextStyle(
                                //   color: controller
                                //       .getRankColor(int.parse(entry.rank ?? '0')),
                                //   fontWeight: FontWeight.bold,
                              ),
                            ),
                            DataCell(Text(
                              entry.name ?? '',
                              style: globalTextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold),
                            )),
                            DataCell(
                              Text(
                                entry.points ?? '',
                                style: globalTextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ]);
                        }).toList(),
                        // Table styling
                        headingRowColor:
                            MaterialStateProperty.all(AppColors.grey),
                        border: TableBorder.all(
                          color: Colors.transparent,
                          width: 1,
                        ),
                        headingTextStyle: globalTextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
