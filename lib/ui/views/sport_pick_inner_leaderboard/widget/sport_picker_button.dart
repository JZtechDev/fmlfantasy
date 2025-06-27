import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:flutter_svg/svg.dart';

// ignore: must_be_immutable
class SportPickerButton extends StatelessWidget {
  SportPickerButton(
      {super.key,
      required this.onPressed,
      required this.title,
      required this.iconPath});

  final VoidCallback onPressed;
  String title;
  String iconPath;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.secondary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.r),
        ),
        padding: EdgeInsets.only(
          top: 13.h,
          bottom: 13.h,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            iconPath,
            height: 18.h,
            width: 18.w,
            color: AppColors.dark,
          ),
          horizontalSpace(5.w),
          Text(
            title,
            style: globalTextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w700,
              color: AppColors.dark,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
