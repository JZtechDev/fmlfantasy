import 'package:fmlfantasy/app/app_images/app_images.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
            // horizontalSpace(5),

            // horizontalSpace(20),
            AnimatedContainer(
              duration: const Duration(seconds: 5),
              child: Hero(
                transitionOnUserGestures: true,
                tag: 'logo',
                child: Image.asset(
                  AppImages.logo,
                  width: 120,
                ),
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/new_images/Vector.png',
                  height: 20,
                  width: 20,
                ),
                horizontalSpace(5),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Hi, Vipul',
                        style: globalTextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 12.sp,
                            color: AppColors.white)),
                    GestureDetector(
                      onTap: () async {
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        prefs.remove('token');
                        Get.offAllNamed(AppRoutes.authentication);
                      },
                      child: Text('My Account',
                          style: globalTextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 12.sp,
                              color: AppColors.white)),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(0.06.sh);
}
