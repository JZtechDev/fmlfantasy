import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/ui/widgets/app_textfield.dart';
import 'package:fmlfantasy/ui/widgets/primary_button.dart';

// ignore: must_be_immutable, camel_case_types
class CustomAlertDialog extends StatelessWidget {
  final String title;
  final String textFieldLabel;
  final TextEditingController controller = TextEditingController();
  final Function(String) onChanged;

  CustomAlertDialog({
    super.key,
    required this.title,
    required this.textFieldLabel,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.r)),
      ),
      title: Text(title,
          style: globalTextStyle(
              fontSize: 18.sp,
              color: AppColors.dark) // Replace with globalTextStyle if defined
          ),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            AppTextField(
                labelText: textFieldLabel,
                controller: controller,
                onChanged: onChanged),
          ],
        ),
      ),
      actions: <Widget>[
        PrimaryButton(
            buttonText: 'Search',
            onPressed: () {
              Navigator.of(context).pop();
            },
            isEnabled: true),
      ],
    );
  }
}
