import 'package:fmlfantasy/app/app_colors/app_colors.dart';
import 'package:fmlfantasy/app/app_images/app_images.dart';
import 'package:fmlfantasy/ui/views/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class AppBarGeneral extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color backgroundColor;
  final List<Widget>? actions;
  final bool enableBorder;

  const AppBarGeneral({
    super.key,
    required this.title,
    this.enableBorder = true,
    this.backgroundColor = AppColors.white, // Default background color
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
            foregroundColor: AppColors.white,
            surfaceTintColor: AppColors.white,
            bottom: PreferredSize(
                preferredSize: const Size.fromHeight(1),
                child: Container(
                    decoration: BoxDecoration(
                        border: enableBorder
                            ? const Border(
                                bottom: BorderSide(
                                    color: AppColors.borderColor, width: 1))
                            : null))),
            centerTitle: true,
            elevation: 0,
            leading: Padding(
              padding: const EdgeInsets.all(8),
              child: GestureDetector(
                  onTap: () {
                    Get.back();
                    HomeController homeController = Get.find();
                    homeController.onInit();
                  },
                  child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.borderColor),
                        color: AppColors.grey,
                        borderRadius: BorderRadius.circular(5.r),
                      ),
                      padding: const EdgeInsets.all(7),
                      child: SvgPicture.asset(
                        AppImages.back,
                      ))),
            ),
            backgroundColor: backgroundColor,
            title: SvgPicture.asset(
              AppImages.logo,
              height: 40,
            ),
          ),
        );
      },
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(0.06.sh);
}
