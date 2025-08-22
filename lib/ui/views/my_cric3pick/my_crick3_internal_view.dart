import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/ui/views/my_cric3pick/controller/my_cric3pick_controller.dart';
import 'package:fmlfantasy/ui/views/my_cric3pick/models/my_crick3_model.dart';

class MyCrick3Internal extends StatelessWidget {
  final MatchResult matchResult;
  const MyCrick3Internal({super.key, required this.matchResult});

  @override
  Widget build(BuildContext context) {
    Get.put(MyCric3pickController());
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 70),
            child: Text(
              'My Cric3picks',
              style: globalTextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: AppColors.secondary),
            ),
          ),
          Text(
            'Check the results here',
            style: globalTextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: AppColors.white),
          ),
          verticalSpace(20),
          Container(
            alignment: Alignment.center,
            width: Get.width,
            color: AppColors.primaryDark,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'The Winners',
                style: globalTextStyle(
                    fontSize: 14.sp,
                    color: AppColors.white,
                    fontWeight: FontWeight.w800),
              ),
            ),
          ),
          verticalSpace(20),
          Wrap(
            children: [
              ...matchResult.winningCombination.map((e) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 90.w,
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: 90.w,
                            height: 90.h,
                            decoration: BoxDecoration(
                              color: AppColors.primary,
                              border: Border.all(
                                  color: matchResult.yourCric3Picks.contains(e)
                                      ? AppColors.secondary
                                      : Colors.transparent,
                                  width: 3),
                            ),
                            child: Image.asset(
                              e.headshot,
                              width: 37.w,
                              height: 56.h,
                            ),
                          ),
                          verticalSpace(5),
                          Row(
                            children: [
                              Container(
                                color: AppColors.darkGreen,
                                height: 32.w,
                                width: 43.w,
                                alignment: Alignment.center,
                                child: Image.asset(
                                  'assets/new_images/trophy-2.png',
                                  height: 18,
                                ),
                              ),
                              horizontalSpace(4),
                              Container(
                                color: AppColors.darkGreen,
                                height: 32.w,
                                width: 43.w,
                                alignment: Alignment.center,
                                child: Image.asset(
                                  'assets/new_images/trophy-2.png',
                                  height: 18,
                                ),
                              )
                            ],
                          ),
                          verticalSpace(5),
                          Text(
                            e.name,
                            style: globalTextStyle(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w700,
                                color: AppColors.white),
                          )
                        ],
                      ),
                    ),
                  ))
            ],
          ),
          verticalSpace(20),
          Container(
            alignment: Alignment.center,
            width: Get.width,
            color: AppColors.primaryDark,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'Your Picks',
                style: globalTextStyle(
                    fontSize: 14.sp,
                    color: AppColors.white,
                    fontWeight: FontWeight.w800),
              ),
            ),
          ),
          verticalSpace(20),
          Wrap(
            children: [
              ...matchResult.yourCric3Picks.map((e) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 90.w,
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: 90.w,
                            height: 90.h,
                            decoration: BoxDecoration(
                              color: AppColors.primary,
                              border: Border.all(
                                  color:
                                      matchResult.winningCombination.contains(e)
                                          ? AppColors.secondary
                                          : Colors.transparent,
                                  width: 3),
                            ),
                            child: Image.asset(
                              e.headshot,
                              width: 37.w,
                              height: 56.h,
                            ),
                          ),
                          verticalSpace(5),
                          Row(
                            children: [
                              Container(
                                color: AppColors.darkGreen,
                                height: 32.w,
                                width: 43.w,
                                alignment: Alignment.center,
                                child: Image.asset(
                                  'assets/new_images/trophy-2.png',
                                  height: 18,
                                ),
                              ),
                              horizontalSpace(4),
                              Container(
                                color: AppColors.darkGreen,
                                height: 32.w,
                                width: 43.w,
                                alignment: Alignment.center,
                                child: Image.asset(
                                  'assets/new_images/trophy-2.png',
                                  height: 18,
                                ),
                              )
                            ],
                          ),
                          verticalSpace(5),
                          Text(
                            textAlign: TextAlign.center,
                            e.name,
                            style: globalTextStyle(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w700,
                                color: AppColors.white),
                          )
                        ],
                      ),
                    ),
                  ))
            ],
          )
        ],
      ),
    );
  }
}
