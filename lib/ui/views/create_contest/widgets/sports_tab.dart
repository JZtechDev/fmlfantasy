import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/model/sports_type.dart';

class SportsTab extends StatelessWidget {
  final List<Sport> sportsList;
  final int selectedIndex;
  final Function(int) onTap;
  final Color backgroundColor;
  final Color selectedColor;
  const SportsTab({
    super.key,
    required this.sportsList,
    required this.selectedIndex,
    required this.onTap,
    this.backgroundColor = AppColors.navyBlue,
    this.selectedColor = AppColors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      double maxWidth = constraints.maxWidth;
      final double containerWidth = maxWidth > 600 ? 25.w : 50.w;
      final double containerHeight = maxWidth > 600 ? 25.h : 40.h;

      return Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(5.r),
          border: Border.all(
            color: AppColors.borderColor,
            width: 1,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            sportsList.length,
            (index) {
              Sport sport = sportsList[index];
              bool isSelected = index == selectedIndex;
              return SingleChildScrollView(
                child: GestureDetector(
                  onTap: () => onTap(index),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.r),
                          color: isSelected ? backgroundColor : selectedColor,
                        ),
                        alignment: Alignment.center,
                        width: containerWidth,
                        height: containerHeight,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              sport.icon,
                              // ignore: deprecated_member_use
                              // color:
                              //     isSelected ? selectedColor : backgroundColor,
                              height: maxWidth > 600 ? 15.h : 20.h,
                            ),
                            verticalSpace(2.h),
                            Text(
                              sport.name!,
                              style: globalTextStyle(
                                  fontSize: 10.sp,
                                  color: isSelected
                                      ? AppColors.white
                                      : AppColors.primary),
                            ),
                          ],
                        ),
                      ),
                      //horizontalSpace(10.w)
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      );
    });
  }
}
