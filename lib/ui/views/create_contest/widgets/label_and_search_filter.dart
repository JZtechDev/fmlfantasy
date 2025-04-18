import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/ui/views/create_contest/controller/private_tournament_controller.dart';
import 'package:fmlfantasy/ui/views/create_contest/widgets/search_private_tournament.dart';
import 'package:flutter_svg/svg.dart';

class LabelAndSearchFilter extends GetView<PrivateTournamentController> {
  const LabelAndSearchFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(left: 20.w, right: 20.w, top: 20.w, bottom: 20.h),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Tournaments'.tr,
                style: globalTextStyle(
                    fontSize: 32.sp, fontWeight: FontWeight.w600),
              ),
              GestureDetector(
                  onTap: () {
                    showSearch(
                      context: context,
                      delegate: SearchPrivateTournament(),
                    );
                  },
                  child: SvgPicture.asset('assets/icons/screenmenu.svg',
                      height: 30.h)),
            ],
          ),
          verticalSpace(10.h),
          const Divider(
            color: AppColors.borderColor,
            thickness: 1.0,
          )
        ],
      ),
    );
  }
}
