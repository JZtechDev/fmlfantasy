import 'package:fmlfantasy/core/imports/imports.dart';

class CustomSliver extends StatelessWidget {
  final Widget? appBar;
  const CustomSliver({
    super.key,
    this.appBar,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      toolbarHeight: 90.h,
      collapsedHeight: 90.h,
      expandedHeight: 90.h,
      automaticallyImplyLeading: false,
      pinned: true,
      backgroundColor: Colors.transparent,
      surfaceTintColor: AppColors.backgroud,
      elevation: 0,
      flexibleSpace: appBar,
    );
  }
}
