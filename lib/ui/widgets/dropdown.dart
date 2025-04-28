import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppDropdown extends StatelessWidget {
  final List<dynamic> items;
  final String? value;
  final String hint;
  final Color? hintTextColor;
  final Color? selectedTextColor;
  final bool enabled;
  final Color? dropDownUnderTextColor;
  final Color dropdownColor;
  final Color titleColor;
  final Color trailingColor;
  final void Function(String?)? onChanged;
  final String? leftImage;
  final double? fontSize;
  final double buttonHeight;
  final double dropdownWidth;
  final String? Function(String?)? validator; // Add validator parameter

  const AppDropdown({
    super.key,
    required this.items,
    this.dropdownWidth = 200,
    this.selectedTextColor = AppColors.textGray,
    this.hintTextColor = AppColors.secondary,
    this.dropDownUnderTextColor = AppColors.dark,
    this.value,
    this.buttonHeight = 50,
    required this.hint,
    this.onChanged,
    this.enabled = true,
    required this.dropdownColor,
    this.trailingColor = AppColors.secondary,
    required this.titleColor,
    this.leftImage = '',
    this.fontSize,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return FormField<String>(
      validator: validator, // Use validator
      builder: (FormFieldState<String> state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownButtonHideUnderline(
              child: DropdownButton2<String>(
                isExpanded: false, // true
                hint: SizedBox(
                  child: Text(
                    hint,
                    style: globalTextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w800,
                        color: hintTextColor),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                items: items
                    .map(
                      (dynamic item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: globalTextStyle2(
                              fontSize: fontSize ?? 12.sp,
                              fontWeight: FontWeight.w400,
                              color: dropDownUnderTextColor),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    )
                    .toList(),
                value: value,
                onChanged: (newValue) {
                  state.didChange(newValue); // Update the state
                  if (onChanged != null) {
                    onChanged!(newValue);
                  }
                },
                style: globalTextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.white,
                ),
                selectedItemBuilder: (BuildContext context) {
                  return items.map((dynamic item) {
                    return Center(
                      child: Row(
                        children: [
                          SvgPicture.asset(leftImage!),
                          Text(
                            item,
                            style: globalTextStyle2(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color:
                                  selectedTextColor, // Selected item text color
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    );
                  }).toList();
                },
                buttonStyleData: ButtonStyleData(
                  height: buttonHeight,
                  width: double.infinity,
                  padding: EdgeInsets.only(left: 10.w, right: 10.w),
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: AppColors.secondary, width: 1.sp),
                      borderRadius: BorderRadius.circular(5.sp),
                      color: dropdownColor),
                  elevation: 0,
                ),
                iconStyleData: IconStyleData(
                    icon: SvgPicture.asset(
                      'assets/icons/arrow-down.svg',
                      // ignore: deprecated_member_use
                      color: trailingColor,
                    ),
                    iconSize: 14.sp,
                    //iconColor: trailingColor,
                    iconEnabledColor: AppColors.primary,
                    iconDisabledColor: trailingColor),
                dropdownStyleData: DropdownStyleData(
                  padding: EdgeInsets.only(left: 10.sp, right: 10.sp),
                  maxHeight: 200, // Adjust this value as needed
                  width: dropdownWidth,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.sp),
                    color: AppColors.white,
                  ),
                  offset: const Offset(0, 0),
                ),
                menuItemStyleData: MenuItemStyleData(
                  height: 40.h,
                  padding: EdgeInsets.only(left: 10.w, right: 10.w),
                ),
              ),
            ),
            if (state.hasError)
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Text(
                  state.errorText ?? '',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 12.sp,
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
