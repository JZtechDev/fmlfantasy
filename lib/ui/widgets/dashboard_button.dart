import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/imports/imports.dart';

class DashboardButton extends StatelessWidget {
  const DashboardButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.offAllNamed(AppRoutes.dashboardView);
      },
      child: Container(
        width: 110,
        padding: const EdgeInsets.all(7),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: AppColors.secondary,
        ),
        child: Row(
          children: [
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.primaryDark),
                color: AppColors.secondary,
                shape: BoxShape.circle,
              ),
              child: Icon(FlutterRemix.arrow_left_s_line,
                  color: AppColors.primaryDark, size: 13.sp),
            ),
            horizontalSpace(5),
            Text('DASHBOARD',
                style: globalTextStyle(
                    color: AppColors.primaryDark,
                    fontSize: 11,
                    fontWeight: FontWeight.w800)),
          ],
        ),
      ),
    );
  }
}
