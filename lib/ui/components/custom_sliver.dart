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
      toolbarHeight: 100.h,
      collapsedHeight: 100.h,
      expandedHeight: 100.h,
      automaticallyImplyLeading: false,
      pinned: true,
      backgroundColor: Colors.transparent,
      surfaceTintColor: AppColors.backgroud,
      elevation: 0,
      flexibleSpace: appBar,
    );
  }
}
