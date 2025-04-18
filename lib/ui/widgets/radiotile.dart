import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/imports/imports.dart';

class CustomRadioButton extends StatelessWidget {
  final String value;
  final String groupValue;
  final String label;
  final Function(String) onChanged;
  final Color? color;

  const CustomRadioButton({
    super.key,
    required this.value,
    required this.groupValue,
    required this.label,
    required this.onChanged,
    this.color = AppColors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(value),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: AppColors.white,
          border: Border.all(color: AppColors.borderColor, width: 1.w),
          borderRadius: BorderRadius.circular(5.r),
        ),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(right: 10.w),
              height: 15.h,
              width: 15.h,
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                color: AppColors.grey,
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.borderColor,
                  width: 1.w,
                ),
              ),
              child: Container(
                height: 10.h,
                width: 10.h,
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  color: groupValue == value
                      ? AppColors.primary
                      : AppColors.textGray.withValues(alpha: 0.5),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.borderColor,
                    width: 1.w,
                  ),
                ),
              ),
            ),
            Text(
              label,
              style: globalTextStyle2(fontSize: 12.sp),
            ),
          ],
        ),
      ),
    );
  }
}
