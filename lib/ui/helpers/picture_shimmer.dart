import 'package:fmlfantasy/app/app_images/app_images.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/ui/components/skeleton.dart';

class PictureShimmer extends StatelessWidget {
  const PictureShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeleton(child: Image.asset(AppImages.userPlaceHolder));
  }
}

class AvatarShimmer extends StatelessWidget {
  const AvatarShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeleton(
        child: Container(
      height: 40.h,
      padding: const EdgeInsets.all(20),
      decoration:
          const BoxDecoration(shape: BoxShape.circle, color: AppColors.grey),
      child: Image.asset(
        AppImages.userPlaceHolder,
        color: Colors.black,
      ),
    ));
  }
}
