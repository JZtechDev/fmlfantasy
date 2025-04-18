import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shimmer/shimmer.dart';

class SvgPlaceholder extends StatelessWidget {
  const SvgPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: Colors.white,
        ),
        width: 200.0,
        height: 200.0,
        child: SvgPicture.asset(
          'assets/images/placeholder.svg',
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
