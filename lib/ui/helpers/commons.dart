import 'package:fmlfantasy/app/app_colors/app_colors.dart';
import 'package:flutter/material.dart';

Widget verticalSpace(double height) => SizedBox(height: height);
Widget horizontalSpace(double width) => SizedBox(width: width);
Widget circularIndicator() => const CircularProgressIndicator(
      color: AppColors.white,
    );
