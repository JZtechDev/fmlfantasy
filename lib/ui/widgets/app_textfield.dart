import 'package:fmlfantasy/app/app_sizings.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:flutter/services.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String labelText;
  final bool obscureText;
  final bool? suffixIcon;
  final Widget? prefixIcon;
  final Icon? suffixIconData;
  final Icon? prefixIconData;
  final bool? isPasswordVisible;
  final double? borderRadius;
  final Color? fillColor;
  final Color? textColor;
  final String? preText;
  final Function(String)? onChanged;
  final Function()? onVisibilityToggle;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final bool? readOnly;
  final List<TextInputFormatter>? inputFormatters;

  const AppTextField({
    super.key,
    this.controller,
    this.readOnly = false,
    required this.labelText,
    this.keyboardType,
    this.obscureText = false,
    this.suffixIcon = false,
    this.preText,
    this.isPasswordVisible,
    this.onVisibilityToggle,
    this.inputFormatters,
    this.validator,
    this.borderRadius,
    this.fillColor,
    this.textColor,
    this.prefixIcon,
    this.onChanged,
    this.suffixIconData,
    this.prefixIconData,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      double maxWidth = constraints.maxWidth;
      return TextFormField(
        cursorColor: AppColors.dark,
        readOnly: readOnly!,
        onChanged: onChanged,
        obscureText: obscureText,
        keyboardType: keyboardType,
        inputFormatters: inputFormatters,
        controller: controller,
        validator: validator,
        style: globalTextStyle2(
          fontSize: AppSizing.isMobile(context) ? 12.sp : 8.sp,
          color: textColor ?? AppColors.dark,
          fontWeight: FontWeight.w600,
        ),
        decoration: InputDecoration(
          filled: true,
          prefixText: preText,
          fillColor: fillColor ?? AppColors.white,
          labelStyle: globalTextStyle2(
            fontSize: AppSizing.isMobile(context) ? 12.sp : 14.sp,
            color: textColor ?? AppColors.dark,
            fontWeight: FontWeight.w500,
          ),
          hintStyle: globalTextStyle2(
            fontSize: AppSizing.isMobile(context) ? 12.sp : 12.sp,
            color: textColor ?? AppColors.dark,
            fontWeight: FontWeight.w500,
          ),
          hintText: labelText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 5.0.r),
            borderSide: const BorderSide(color: AppColors.secondary, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 5.0.r),
            borderSide: const BorderSide(color: AppColors.secondary, width: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 5.0.r),
            borderSide: const BorderSide(color: AppColors.secondary, width: 1),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 5.0.r),
            borderSide: const BorderSide(
              color: AppColors.errorRed,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 5.0.r),
            borderSide: const BorderSide(
              color: AppColors.errorRed,
            ),
          ),
          contentPadding: EdgeInsets.only(
            left: maxWidth > 600 ? 10.w : 15.w,
            right: maxWidth > 600 ? 10.w : 15.w,
            top: maxWidth > 600 ? 8.h : 13.h,
            bottom: maxWidth > 600 ? 8.h : 13.h,
          ),
          prefixIcon: prefixIcon, //prefixIcon == true ? prefixIconData : null
          suffixIcon: suffixIcon == false
              ? null
              : obscureText == true
                  ? GestureDetector(
                      onTap: onVisibilityToggle,
                      child: const Icon(
                        FlutterRemix.eye_off_line,
                      ),
                    )
                  : GestureDetector(
                      onTap: onVisibilityToggle,
                      child: const Icon(FlutterRemix.eye_line),
                    ),
        ),
      );
    });
  }
}
