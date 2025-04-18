import 'package:fmlfantasy/app/app_sizings.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/ui/views/my_contest/controller/my_contest_controller.dart';
import 'package:flutter_svg/svg.dart';

class Label extends GetView<MyContestController> {
  const Label({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.w, bottom: 0.h),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'My Contests'.tr,
                style: globalTextStyle(
                    fontSize: AppSizing.isMobile(context) ? 28.sp : 16.sp,
                    fontWeight: FontWeight.w600),
              ),
              GestureDetector(
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
