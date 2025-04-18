import 'package:fmlfantasy/app/app_images/app_images.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/ui/views/my_draws/controller/my_draws_controller.dart';
import 'package:fmlfantasy/ui/views/my_draws/widget/draws_card.dart';
import 'package:fmlfantasy/ui/views/my_draws/widget/draws_leaderboard_table.dart';
import 'package:flutter_svg/svg.dart';

class SearchDraws extends SearchDelegate {
  final MyDrawsController controller = Get.find<MyDrawsController>();

  @override
  TextStyle? get searchFieldStyle {
    return globalTextStyle2(fontSize: 14.sp, color: AppColors.textGray);
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      appBarTheme: const AppBarTheme(
          surfaceTintColor: AppColors.white,
          foregroundColor: AppColors.textGray,
          backgroundColor: AppColors.white),
      inputDecorationTheme: InputDecorationTheme(
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        hintStyle: globalTextStyle2(fontSize: 14.sp, color: AppColors.textGray),
      ),
    );
  }

  @override
  String get searchFieldLabel => "searchTeams".tr;

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: GestureDetector(
          onTap: () => close(context, null),
          child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.borderColor),
                color: AppColors.grey,
                borderRadius: BorderRadius.circular(5.r),
              ),
              padding: const EdgeInsets.all(7),
              child: SvgPicture.asset(
                AppImages.back,
                //height: 20,
                // width: 20,
              ))),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Obx(() {
      final results = controller.myDrawsTeams.where((tournament) {
        return tournament.homeTeamName!
                .toLowerCase()
                .contains(query.toLowerCase()) ||
            tournament.awayTeamName!
                .toLowerCase()
                .contains(query.toLowerCase());
      }).toList();

      return Obx(
        () => Container(
          color: AppColors.grey,
          child: Column(
            children: [
              verticalSpace(20.h),
              Expanded(
                child: ListView.builder(
                  itemCount: results.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(
                          left: 10.w, right: 10.w, top: 5.h, bottom: 5.h),
                      child: GestureDetector(
                        onTap: () {
                          controller.fetchDrawsDetails(
                              results[index].drawID.toString());
                          Get.to(() => DrawsLeaderboardTable(
                              myDrawsTeams: results[index]));
                        },
                        child: MyDrawsCard(index, results[index]),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Obx(() {
      final suggestions = controller.myDrawsTeams.where((tournament) {
        return tournament.awayTeamName!
                .toLowerCase()
                .contains(query.toLowerCase()) ||
            tournament.homeTeamName!
                .toLowerCase()
                .contains(query.toLowerCase());
      }).toList();
      return Container(
        color: AppColors.grey,
        child: Column(
          children: [
            verticalSpace(10.h),
            verticalSpace(10.h),
            Expanded(
              child: ListView.builder(
                itemCount: suggestions.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(
                        left: 10.w, right: 10.w, top: 5.h, bottom: 5.h),
                    child: GestureDetector(
                      onTap: () {
                        controller.fetchDrawsDetails(
                            suggestions[index].drawID.toString());
                        Get.to(() => DrawsLeaderboardTable(
                            myDrawsTeams: suggestions[index]));
                      },
                      child: MyDrawsCard(index, suggestions[index]),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      );
    });
  }
}
