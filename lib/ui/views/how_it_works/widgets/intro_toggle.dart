import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IntroCardsToggle extends StatelessWidget {
  final VoidCallback onPrevious;
  final VoidCallback onNext;

  const IntroCardsToggle({
    super.key,
    required this.onPrevious,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: onPrevious,
            child: Container(
              height: 40.h,
              width: 40.w,
              alignment: Alignment.center,
              padding: const EdgeInsets.all(5),
              child: Image.asset(
                'assets/new_images/arrow left.png',
                height: 25.h,
                width: 25.w,
              ),
            ),
          ),
          GestureDetector(
            onTap: onNext,
            child: Container(
              height: 40.h,
              width: 40.w,
              alignment: Alignment.center,
              padding: const EdgeInsets.all(5),
              child: Image.asset(
                'assets/new_images/arrow right.png',
                height: 25.h,
                width: 25.w,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
