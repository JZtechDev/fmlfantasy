import 'package:fmlfantasy/app/app_images/app_images.dart';
import 'package:fmlfantasy/app/app_sizings.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/ui/views/home/controller/home_controller.dart';
import 'package:fmlfantasy/ui/views/home/widgets/tournament_card.dart';
import 'package:fmlfantasy/ui/widgets/primary_button.dart';
import 'package:flutter_svg/svg.dart';

class SearchTournament extends SearchDelegate {
  final HomeController controller = Get.find<HomeController>();

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
        hintStyle: globalTextStyle2(
            fontSize: AppSizing.isMobile(context) ? 14.sp : 12.sp,
            color: AppColors.textGray),
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
      final results = controller.isPublicSelected.value
          ? controller.tournaments.where((tournament) {
              return tournament.name!
                  .toLowerCase()
                  .contains(query.toLowerCase());
            }).toList()
          : controller.privateTournaments.where((tournament) {
              return tournament.name!
                  .toLowerCase()
                  .contains(query.toLowerCase());
            }).toList();

      return Obx(
        () => Container(
          color: AppColors.grey,
          child: Column(
            children: [
              verticalSpace(20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(
                    () => Expanded(
                      child: PrimaryButton(
                        buttonText: 'publicButton'.tr,
                        onPressed: () {
                          controller.isPublicSelected.value = true;
                        },
                        isEnabled: true,
                        backgroundColor: controller.isPublicSelected.value
                            ? AppColors.primary
                            : AppColors.dark,
                        buttonWidth: 150,
                      ),
                    ),
                  ),
                  Expanded(
                    child: PrimaryButton(
                      buttonText: 'privateButton'.tr,
                      onPressed: () {
                        controller.isPublicSelected.value = false;
                      },
                      isEnabled: true,
                      backgroundColor: !controller.isPublicSelected.value
                          ? AppColors.primary
                          : AppColors.dark,
                      buttonWidth: 150,
                    ),
                  ),
                ],
              ),
              verticalSpace(10.h),
              const Divider(color: AppColors.borderColor),
              verticalSpace(10.h),
              Expanded(
                child: ListView.builder(
                  itemCount: results.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(
                          left: 10.w, right: 10.w, top: 5.h, bottom: 5.h),
                      child: GestureDetector(
                        onTap: () {
                          Get.toNamed(AppRoutes.selectPlayers, arguments: {
                            'matchID': results[index].matches![0].matchCode,
                            'sport': controller.selectedSport.value,
                            'tournamentId': results[index].id
                          });
                        },
                        child: TournamentCard(tournament: results[index]),
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
      final suggestions = controller.isPublicSelected.value
          ? controller.tournaments.where((tournament) {
              return tournament.name!
                  .toLowerCase()
                  .contains(query.toLowerCase());
            }).toList()
          : controller.privateTournaments.where((tournament) {
              return tournament.name!
                  .toLowerCase()
                  .contains(query.toLowerCase());
            }).toList();

      return Obx(
        () => Container(
          color: AppColors.grey,
          child: Column(
            children: [
              verticalSpace(10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: PrimaryButton(
                      textColor: controller.isPublicSelected.value
                          ? AppColors.white
                          : AppColors.dark,
                      buttonText: 'publicButton'.tr,
                      onPressed: () {
                        controller.isPublicSelected.value = true;
                      },
                      isEnabled: true,
                      backgroundColor: controller.isPublicSelected.value
                          ? AppColors.primary
                          : AppColors.grey,
                      buttonWidth: 150.w,
                    ),
                  ),
                  Expanded(
                    child: PrimaryButton(
                      textColor: controller.isPublicSelected.value
                          ? AppColors.dark
                          : AppColors.white,
                      buttonText: 'privateButton'.tr,
                      onPressed: () {
                        controller.isPublicSelected.value = false;
                      },
                      isEnabled: true,
                      backgroundColor: !controller.isPublicSelected.value
                          ? AppColors.primary
                          : AppColors.grey,
                      buttonWidth: 150,
                    ),
                  ),
                ],
              ),
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
                          Get.toNamed(AppRoutes.selectPlayers, arguments: {
                            'matchID': suggestions[index].matches![0].matchCode,
                            'sport': controller.selectedSport.value,
                            'tournamentId': suggestions[index].id
                          });
                        },
                        child: TournamentCard(tournament: suggestions[index]),
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
}
