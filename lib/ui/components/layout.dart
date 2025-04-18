import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/ui/components/drawer.dart';
import 'package:fmlfantasy/ui/components/home_appbar.dart';
import 'package:fmlfantasy/ui/components/custom_sliver.dart';
import 'package:fmlfantasy/ui/views/dashboard/controller/dashboard_controller.dart';

class CustomLayout extends StatelessWidget {
  final Widget child;
  final Widget appBar;

  const CustomLayout({super.key, required this.child, required this.appBar});

  @override
  Widget build(BuildContext context) {
    Get.put(DashboardController());
    return Scaffold(
      drawer: const DrawerView(),
      extendBody: false,
      resizeToAvoidBottomInset: false,
      appBar: const HomeAppBar(title: 'Fml Fantasy'),
      body: CustomScrollView(
        slivers: [
          CustomSliver(appBar: appBar),
          SliverToBoxAdapter(
            child: Column(
              children: [
                child,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
