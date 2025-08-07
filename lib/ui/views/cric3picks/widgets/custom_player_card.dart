import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/ui/helpers/replace_svg_with_png.dart';
import 'package:fmlfantasy/ui/views/cric3picks/helper/enums.dart';

class CustomPlayerCard extends StatelessWidget {
  final dynamic player;
  final double widthFactor;
  final Color borderColor;
  final Color backgroundColor;
  final Color textColor;

  const CustomPlayerCard({
    super.key,
    required this.player,
    this.widthFactor = 0.5,
    this.borderColor = AppColors.secondary,
    this.backgroundColor = AppColors.secondary,
    this.textColor = AppColors.dark,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 10),
          alignment: Alignment.center,
          width: Get.width * widthFactor,
          padding: const EdgeInsets.all(10.0),
          height: 110,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
            border: Border.all(color: borderColor, width: 1),
          ),
          child: Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: player.imageUrl == null || player.imageUrl!.isEmpty
                        ? const SizedBox.shrink()
                        : player.imageUrl!.contains('.svg')
                            ? Image.network(
                                replaceSvgWithPng(player.imageUrl!),
                                height: 80,
                                width: 80,
                              )
                            : Image.network(
                                player.imageUrl!,
                                height: 80,
                                width: 80,
                                fit: BoxFit.cover,
                              ),
                  ),
                  Positioned(
                      right: 0,
                      top: 0,
                      child: Image.asset(
                        getPlayerPositionFromString(player.position).imagePath,
                        height: 30,
                        width: 30,
                      ))
                ],
              ),
            ],
          ),
        ),
        Container(
          width: Get.width * widthFactor,
          padding: const EdgeInsets.symmetric(vertical: 4),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(12),
              bottomRight: Radius.circular(12),
            ),
          ),
          child: Text(
            player.fullName ?? '',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: globalTextStyle(
              fontSize: 14.sp,
              color: textColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
