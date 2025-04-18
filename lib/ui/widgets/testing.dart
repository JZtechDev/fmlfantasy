import 'dart:developer';

import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';

import '../../core/imports/imports.dart';

class AppDropdownWithTopLabel extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final List<String> dropdownItems;
  final void Function(String?)? onChanged;
  const AppDropdownWithTopLabel(
      {super.key,
      required this.controller,
      required this.labelText,
      required this.dropdownItems,
      this.onChanged,
      required List<String> items});

  @override
  State<AppDropdownWithTopLabel> createState() => _DropdownWithIconState();
}

class _DropdownWithIconState extends State<AppDropdownWithTopLabel> {
  final FocusNode _focusNode = FocusNode();
  final RxBool _isFocused = false.obs;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(functionCheckFocus);
  }

  void functionCheckFocus() {
    _isFocused.value = _focusNode.hasFocus;
    log(_isFocused.value.toString());
    return;
  }

  @override
  void dispose() {
    _focusNode.removeListener(functionCheckFocus);
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Obx(
          () => Text(
            widget.labelText,
            style: globalTextStyle(
                fontSize: 12,
                color: _isFocused.value ? AppColors.dark : AppColors.primary),
          ),
        ),
        verticalSpace(10.h),
        Obx(() {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: DropdownButtonHideUnderline(
              child: DropdownButton2<String>(
                isDense: true,
                focusNode: _focusNode,
                isExpanded: false,
                hint: SizedBox(
                  child: Text(
                    widget.labelText,
                    style: globalTextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color:
                            _isFocused.value ? AppColors.dark : AppColors.grey),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                items: widget.dropdownItems
                    .map(
                      (dynamic item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: globalTextStyle2(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.dark),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    )
                    .toList(),
                value: widget.controller.text,
                onChanged: (newValue) {
                  widget.controller.text = newValue.toString();
                },
                style: globalTextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: _isFocused.value ? AppColors.dark : AppColors.white,
                ),
                selectedItemBuilder: (BuildContext context) {
                  return widget.dropdownItems.map((dynamic item) {
                    return Center(
                      child: Row(
                        children: [
                          Text(
                            item,
                            style: globalTextStyle2(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: _isFocused.value
                                  ? AppColors.dark
                                  : AppColors.white, // Selected item text color
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    );
                  }).toList();
                },
                buttonStyleData: ButtonStyleData(
                  height: 40,
                  width: double.infinity,
                  padding: EdgeInsets.only(left: 10.w, right: 10.w),
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: AppColors.borderColor, width: 1.sp),
                      borderRadius: BorderRadius.circular(5.sp),
                      color: _isFocused.value
                          ? AppColors.white
                          : AppColors.primary),
                  elevation: 0,
                ),
                iconStyleData: IconStyleData(
                    icon: _isFocused.value
                        ? const Icon(
                            CupertinoIcons.chevron_up,
                            color: AppColors.dark,
                          )
                        : const Icon(
                            CupertinoIcons.chevron_down,
                            size: 14,
                            color: AppColors.white,
                          ),
                    iconSize: 14.sp,
                    //iconColor: trailingColor,
                    iconEnabledColor: AppColors.primary,
                    iconDisabledColor: AppColors.primary),
                dropdownStyleData: DropdownStyleData(
                  padding: EdgeInsets.only(left: 10.sp, right: 10.sp),
                  maxHeight: 200, // Adjust this value as needed
                  width: Get.width * 0.95,
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
          );
        }),
      ],
    );
  }
}
