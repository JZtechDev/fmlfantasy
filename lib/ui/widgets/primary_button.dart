import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PrimaryButton extends StatelessWidget {
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

  const PrimaryButton({
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
        double buttonHeight = constraints.maxWidth > 600 ? 40.h : 40.h;
        return Padding(
          padding:
              EdgeInsets.symmetric(horizontal: padding), // Adjusted padding
          child: SizedBox(
            height: buttonHeight,
            width: buttonWidth,
            child: ElevatedButton(
              onPressed: isEnabled ? onPressed : null,
              style: ElevatedButton.styleFrom(
                disabledBackgroundColor:
                    AppColors.secondary.withValues(alpha: 0.2),
                backgroundColor: backgroundColor,
                padding: EdgeInsets.only(
                    left: 10.w, right: 10.w, top: 5.h, bottom: 5.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.r),
                  side: const BorderSide(
                    color: AppColors.secondary,
                    width: 1,
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: iconPath != null
                    ? iconBeforeText == true
                        ? MainAxisAlignment.start
                        : MainAxisAlignment.spaceBetween
                    : MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (iconPath != null && iconBeforeText)
                    Container(
                      margin: EdgeInsets.only(right: 10.w),
                      height: 30,
                      width: 30,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.white.withValues(
                          alpha: (0.1),
                        ),
                      ),
                      child: SvgPicture.asset(
                        iconPath!,
                        height: iconHeight,
                        width: iconWidth,
                        // ignore: deprecated_member_use
                        color: iconColor,
                      ),
                    ),
                  isLoading
                      ? circularIndicator()
                      : Text(
                          buttonText,
                          style: globalTextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: buttonTextSize,
                            color: isEnabled
                                ? textColor
                                : AppColors.primary.withValues(alpha: 0.5),
                          ),
                        ),
                  if (iconPath != null && !iconBeforeText)
                    Container(
                      height: 30,
                      width: 30,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.white.withValues(alpha: 0.1),
                      ),
                      child: iconPath!.endsWith('.svg')
                          ? SvgPicture.asset(
                              iconPath!,
                              height: iconHeight,
                              width: iconWidth,
                              // ignore: deprecated_member_use
                              color: iconColor,
                            )
                          : Image.asset(
                              iconPath!,
                              height: iconHeight,
                              width: iconWidth,
                              // ignore: deprecated_member_use
                            ),
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
