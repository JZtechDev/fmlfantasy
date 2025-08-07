import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/ui/helpers/local_time.dart';
import 'package:fmlfantasy/ui/views/cric3picks/controller/cric3_controller.dart';

class Cric3PickView extends StatelessWidget {
  const Cric3PickView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Cric3Controller>(
      init: Cric3Controller(), // only initialized once
      builder: (controller) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 60),
                    child: Text(
                      'Choose Match',
                      style: globalTextStyle(
                        fontSize: 18.sp,
                        color: AppColors.secondary,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ),
                verticalSpace(10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        'assets/new_images/arrow left.png',
                        height: 25.h,
                        width: 25.w,
                      ),
                      Image.asset(
                        'assets/new_images/arrow right.png',
                        height: 25.h,
                        width: 25.w,
                      ),
                    ],
                  ),
                ),
                verticalSpace(20),
                GridView.builder(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                    childAspectRatio: 0.9,
                  ),
                  itemCount: controller.tournaments.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final tournament = controller.tournaments[index];
                    return GestureDetector(
                      onTap: () {
                        controller.onTournamentSelected(tournament);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.primary,
                        ),
                        child: Column(
                          children: [
                            Container(
                              // height: 50,
                              width: double.infinity,
                              padding: const EdgeInsets.all(10),
                              decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                  ),
                                  border: Border(
                                    bottom: BorderSide(
                                        width: 1, color: AppColors.white),
                                  ),
                                  color: AppColors.primaryDark),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    'assets/icons/calender.png',
                                    height: 20,
                                    width: 20,
                                    color: AppColors.secondary,
                                  ),
                                  horizontalSpace(10),
                                  Text(
                                    formatEndDateTime(DateTime.parse(
                                                tournament.endDate.toString())
                                            .toLocal())
                                        .split(', ')
                                        .join(
                                            '\n'), //,controller.tournaments[index].name,
                                    style: globalTextStyle(
                                      fontSize: 14.sp,
                                      color: AppColors.secondary,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            verticalSpace(10),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    tournament.matches![0].home!,
                                    style: globalTextStyle(
                                      fontSize: 14.sp,
                                      color: AppColors.secondary,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    textAlign: TextAlign.center,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  verticalSpace(10),
                                  Container(
                                    // margin: EdgeInsets.only(top: 10.h),
                                    padding: const EdgeInsets.all(10),
                                    decoration: const BoxDecoration(
                                        color: AppColors.backgroud,
                                        shape: BoxShape.circle),
                                    child: Text(
                                      'vs',
                                      style: globalTextStyle2(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 12.sp,
                                          color: AppColors.secondary),
                                    ),
                                  ),
                                  verticalSpace(10),
                                  Text(
                                    tournament.matches![0].away!,
                                    style: globalTextStyle(
                                      fontSize: 14.sp,
                                      color: AppColors.secondary,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    textAlign: TextAlign.center,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
