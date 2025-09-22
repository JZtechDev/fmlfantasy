import 'package:fmlfantasy/app/app_images/app_images.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/ui/views/create_contest/controller/private_tournament_controller.dart';
import 'package:fmlfantasy/ui/views/create_contest/widgets/private_tournament_card.dart';
import 'package:flutter_svg/svg.dart';

class SearchPrivateTournament extends SearchDelegate {
  final PrivateTournamentController controller =
      Get.find<PrivateTournamentController>();

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
              ))),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Obx(() {
      final results = controller.tournamentCardList.where((tournament) {
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
                            AppRoutes.createContest,
                            arguments: {
                              'matchID': results[index].matches![0].matchId,
                              'sport': controller.selectedSport.value,
                              'tournamentId': results[index].id,
                              'joinCode': results[index].joinCode,
                              'startDate': results[index].startDate,
                              'endDate': results[index].endDate,
                              'tournament': results[index],
                            },
                          );
                        },
                        child:
                            PrivateTournamentCard(tournament: results[index]),
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
      final suggestions = controller.tournamentCardList.where((tournament) {
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
                          AppRoutes.createContest,
                          arguments: {
                            'matchID': suggestions[index].matches![0].matchId,
                            'sport': controller.selectedSport.value,
                            'tournamentId': suggestions[index].id,
                            'joinCode': suggestions[index].joinCode,
                            'startDate': suggestions[index].startDate,
                            'endDate': suggestions[index].endDate,
                            'tournament': suggestions[index],
                          },
                        );
                      },
                      child:
                          PrivateTournamentCard(tournament: suggestions[index]),
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
