import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/ui/views/my_cric3pick/controller/my_cric3pick_controller.dart';
import 'package:fmlfantasy/ui/views/my_cric3pick/my_crick3_internal_view.dart';
import 'package:fmlfantasy/ui/views/my_cric3pick/widgets/match_card.dart';

class MyCric3picks extends StatelessWidget {
  const MyCric3picks({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MyCric3pickController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
            verticalSpace(20),
            Container(
              alignment: Alignment.center,
              width: Get.width,
              color: AppColors.primaryDark,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'Your Matches',
                  style: globalTextStyle(
                      fontSize: 14.sp,
                      color: AppColors.white,
                      fontWeight: FontWeight.w800),
                ),
              ),
            ),
            GetBuilder<MyCric3pickController>(builder: (controller) {
              return Column(
                children: [
                  ...controller.matchResults.map((e) => GestureDetector(
                        onTap: () =>
                            Get.to(() => MyCrick3Internal(matchResult: e)),
                        child: MatchContainer(
                          match: e,
                        ),
                      ))
                ],
              );
            })
          ],
        ),
      ),
    );
  }
}
