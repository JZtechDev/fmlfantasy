import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/ui/components/skeleton.dart';

class SkeletonStatisticsPlayerGrid extends StatelessWidget {
  const SkeletonStatisticsPlayerGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeleton(
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 10,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, mainAxisSpacing: 25, mainAxisExtent: 159.w),
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.only(
              top: 5,
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: AppColors.borderColor)),
            child: Column(
              children: [
                Container(
                  height: 80.h,
                  width: 103.w,
                  decoration: BoxDecoration(
                    color: AppColors.grey,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                verticalSpace(5.h),
                Container(
                  padding:
                      EdgeInsets.only(left: 10.w, right: 10.h, bottom: 10.h),
                  alignment: Alignment.center,
                  width: 103.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: AppColors.grey,
                  ),
                  child: Text(
                    'Player Name',
                    style: globalTextStyle2(
                      fontSize: 3.sp,
                      color: AppColors.dark,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                verticalSpace(2.h),
                Text(
                  'Player Name',
                  style: globalTextStyle2(
                    fontSize: 12.sp,
                    color: AppColors.dark,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  'Team Name',
                  style: globalTextStyle2(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textGray),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
