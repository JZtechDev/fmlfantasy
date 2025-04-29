import 'package:fmlfantasy/app/app_images/app_images.dart';
import 'package:fmlfantasy/core/imports/imports.dart';

class AppBarInner extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color backgroundColor;
  final List<Widget>? actions;
  final bool enableBorder;

  const AppBarInner({
    super.key,
    required this.title,
    this.enableBorder = true,
    this.backgroundColor = AppColors.primary, // Default background color
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double appBarHeight = 0.1.sh;

        if (ScreenUtil().screenWidth >= 600) {
          appBarHeight = 0.08.sh;
        }

        return PreferredSize(
          preferredSize: Size.fromHeight(appBarHeight),
          child: AppBar(
            foregroundColor: AppColors.primary,
            surfaceTintColor: AppColors.primary,
            bottom: PreferredSize(
                preferredSize: const Size.fromHeight(1),
                child: Container(
                    decoration: BoxDecoration(
                        border: enableBorder
                            ? const Border(
                                bottom: BorderSide(
                                    color: Colors.transparent, width: 1))
                            : null))),
            centerTitle: true,
            elevation: 0,
            leading: Padding(
              padding: const EdgeInsets.all(8),
              child: GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.primary),
                        color: AppColors.secondary,
                        borderRadius: BorderRadius.circular(5.r),
                      ),
                      padding: const EdgeInsets.all(7),
                      child: Icon(FlutterRemix.arrow_left_s_line,
                          color: AppColors.white, size: 20.sp))),
            ),
            backgroundColor: backgroundColor,
            title: Image.asset(
              AppImages.logo,
              height: 40,
              width: Get.width * 0.3,
            ),
          ),
        );
      },
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(0.06.sh);
}
