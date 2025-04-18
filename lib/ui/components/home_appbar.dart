import 'package:fmlfantasy/app/app_images/app_images.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/imports/imports.dart';

RxBool isLogin = false.obs;

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color backgroundColor;
  final List<Widget>? actions;

  final double? iconheight;
  final double? iconwidth;

  const HomeAppBar({
    super.key,
    required this.title,
    this.backgroundColor = AppColors.primary,
    this.actions,
    this.iconheight = 13.5,
    this.iconwidth = 19.5,
  });

  @override
  Widget build(BuildContext context) {
    double appBarHeight = 0.1.sh;

    if (ScreenUtil().screenWidth >= 600) {
      appBarHeight = 0.08.sh;
    }

    return PreferredSize(
      preferredSize: Size.fromHeight(appBarHeight),
      child: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: backgroundColor,
        surfaceTintColor: backgroundColor,
        foregroundColor: AppColors.white,
        centerTitle: false,
        elevation: 0,
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1), child: Container()),
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Image.asset(
                AppImages.logo,
                width: 120,
              ),
            ),
            horizontalSpace(20),
            Text('Hi, Superstar Vipul',
                style: globalTextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 12.sp,
                    color: AppColors.white)),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Icon(FlutterRemix.logout_circle_r_line,
                color: AppColors.white, size: 25.sp),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(0.06.sh);
}
