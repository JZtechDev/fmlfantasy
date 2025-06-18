import 'package:fmlfantasy/app/app_sizings.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/ui/views/match_fixtures/controller/match_fixtures_controller.dart';

class LabelAndFilter extends GetView<MatchFixturesController> {
  const LabelAndFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(left: 10.w, right: 10.w, top: 10.w, bottom: 20.h),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                child: Text(
                  'MATCH FIXTURES'.tr,
                  style: globalTextStyle(
                      fontSize: AppSizing.isMobile(context) ? 16.sp : 16.sp,
                      fontWeight: FontWeight.w800),
                  maxLines: 1,
                ),
              ),
              // GestureDetector(
              //     onTap: () {
              //       showSearch(
              //         context: context,
              //         delegate: SearchFictures(),
              //       );
              //     },
              //     child: SvgPicture.asset('assets/icons/screenmenu.svg',
              //         height: 30.h)),
            ],
          ),
        ],
      ),
    );
  }
}
