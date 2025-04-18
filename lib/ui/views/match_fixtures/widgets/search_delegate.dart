import 'package:fmlfantasy/app/app_images/app_images.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/ui/views/match_fixtures/controller/match_fixtures_controller.dart';
import 'package:fmlfantasy/ui/views/match_fixtures/widgets/fictures_card.dart';
import 'package:flutter_svg/svg.dart';

class SearchFictures extends SearchDelegate {
  final MatchFixturesController controller =
      Get.find<MatchFixturesController>();

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
      final results = controller.fixtures.where((tournament) {
        return tournament.name!.toLowerCase().contains(query.toLowerCase());
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
                          Get.toNamed(
                            AppRoutes.lotoView,
                            arguments: {
                              'matchID': results[index].matches![0].matchCode,
                              'sport': controller.selectedSport.value,
                              'tournamentId': results[index].id,
                              'joinCode': results[index].joinCode,
                            },
                          );
                        },
                        child: FixturesCard(tournament: results[index]),
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
      final suggestions = controller.fixtures.where((tournament) {
        return tournament.name!.toLowerCase().contains(query.toLowerCase());
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
                        Get.toNamed(
                          AppRoutes.lotoView,
                          arguments: {
                            'matchID': suggestions[index].matches![0].matchCode,
                            'sport': controller.selectedSport.value,
                            'tournamentId': suggestions[index].id,
                            'joinCode': suggestions[index].joinCode,
                          },
                        );
                      },
                      child: FixturesCard(tournament: suggestions[index]),
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
