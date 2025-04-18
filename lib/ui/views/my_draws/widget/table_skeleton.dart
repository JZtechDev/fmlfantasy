import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/ui/components/skeleton.dart';

class TableSkeleton extends StatelessWidget {
  const TableSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeleton(
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 5,
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.only(bottom: 10.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.r),
              border: Border.all(color: AppColors.borderColor),
            ),
            child: Row(
              children: [
                Container(
                  width: 10.w,
                  height: 40.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2.5.r),
                      color: AppColors.navyBlue),
                ),
                horizontalSpace(10.w),
                Expanded(
                  child: Text("${index + 1}",
                      style: globalTextStyle(fontSize: 10.sp)),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
