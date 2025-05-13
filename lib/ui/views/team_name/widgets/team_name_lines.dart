import 'dart:math';

import 'package:fmlfantasy/app/app_colors/app_colors.dart';
import 'package:flutter/widgets.dart';

class LineContainer extends StatelessWidget {
  const LineContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double maxWidth = constraints.maxWidth;
        return Stack(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Transform.rotate(
                origin: Offset(maxWidth > 600 ? 200.0 : 180,
                    maxWidth > 600 ? -180.0 : -170),
                angle: pi / 4.5, // Rotate 60 degrees clockwise
                child: Container(
                  height: maxWidth > 600
                      ? 500.0
                      : 460.0, // Adjust height of the bar
                  width:
                      maxWidth > 600 ? 130.0 : 80.0, // Adjust width of the bar
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    gradient: LinearGradient(
                      colors: [
                        AppColors.primary.withValues(alpha: 0.25),
                        AppColors.primary.withValues(alpha: 0.2).withValues(
                            alpha: 0.0), // Adjust opacity or color as needed
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Transform.rotate(
                origin: const Offset(30, -30),
                angle: pi / 4.5, // Rotate 60 degrees clockwise
                child: Container(
                  height: maxWidth > 600
                      ? 550.0
                      : 460.0, // Adjust height of the bar
                  width:
                      maxWidth > 600 ? 120.0 : 80.0, // Adjust width of the bar
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    gradient: LinearGradient(
                      colors: [
                        AppColors.primary.withValues(alpha: 0.10),
                        AppColors.primary.withValues(alpha: 0.1).withValues(
                            alpha: 0.0), // Adjust opacity or color as needed
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Transform.rotate(
                origin: const Offset(-100, 20),
                angle: pi / 4.5, // Rotate 60 degrees clockwise
                child: Container(
                  height: maxWidth > 600
                      ? 550.0
                      : 450.0, // Adjust height of the bar
                  width:
                      maxWidth > 600 ? 120.0 : 80.0, // Adjust width of the bar
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    gradient: LinearGradient(
                      colors: [
                        AppColors.primary.withValues(alpha: 0.1),
                        AppColors.primary.withValues(alpha: 0.1).withValues(
                            alpha: 0.0), // Adjust opacity or color as needed
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
