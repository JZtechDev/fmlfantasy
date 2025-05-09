import 'package:fmlfantasy/app/app_sizings.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/imports/imports.dart';

class ButtonWithArrow extends StatelessWidget {
  final String buttonText;
  final String? iconPath;
  final Color textColor;
  final Color iconColor;
  final double iconHeight;
  final double iconWidth;
  final Color backgroundColor;
  final VoidCallback onPressed;
  final double height;
  final bool isLoading;
  final bool isEnabled;
  final double padding;
  final bool iconBeforeText;
  final double buttonWidth;
  final double buttonTextSize;

  const ButtonWithArrow({
    super.key,
    required this.buttonText,
    this.iconPath,
    this.buttonTextSize = 15,
    this.textColor = AppColors.primaryVeryDark,
    this.iconColor = AppColors.white,
    this.iconHeight = 25,
    this.iconWidth = 25,
    this.backgroundColor = AppColors.secondary,
    required this.onPressed,
    this.height = 48,
    this.isLoading = false,
    required this.isEnabled,
    this.padding = 15,
    this.iconBeforeText = false,
    this.buttonWidth = double.infinity,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Padding(
          padding:
              EdgeInsets.symmetric(horizontal: padding), // Adjusted padding
          child: ElevatedButton(
              onPressed: isEnabled ? onPressed : null,
              style: ElevatedButton.styleFrom(
                disabledBackgroundColor:
                    AppColors.secondary.withValues(alpha: 0.2),
                backgroundColor: backgroundColor,
                padding: EdgeInsets.only(
                  left: 10.w,
                  right: 10.w,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.r),
                  side: const BorderSide(
                    color: AppColors.secondary,
                    width: 1,
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(buttonText,
                      style: globalTextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w900,
                          color: textColor)),
                  Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.primaryDark),
                      color: AppColors.secondary,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(FlutterRemix.arrow_right_s_line,
                        color: AppColors.primaryDark,
                        size: AppSizing.isMobile(context) ? 13.sp : 10.sp),
                  ),
                ],
              )),
        );
      },
    );
  }
}
