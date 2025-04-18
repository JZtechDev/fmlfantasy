import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/imports/imports.dart';

class ValidationText extends StatelessWidget {
  final String text;
  const ValidationText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Text(
        text,
        style: globalTextStyle2(color: AppColors.errorRed, fontSize: 10.sp),
      ),
    );
  }
}
