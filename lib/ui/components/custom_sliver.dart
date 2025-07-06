import 'package:fmlfantasy/core/imports/imports.dart';

class CustomSliver extends StatelessWidget {
  final Widget? appBar;
  final double? height;
  const CustomSliver({
    super.key,
    this.appBar,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      toolbarHeight: height ?? 90.h,
      collapsedHeight: height ?? 90.h,
      expandedHeight: height ?? 90.h,
      automaticallyImplyLeading: false,
      pinned: true,
      backgroundColor: Colors.transparent,
      surfaceTintColor: AppColors.backgroud,
      elevation: 0,
      flexibleSpace: appBar,
    );
  }
}
