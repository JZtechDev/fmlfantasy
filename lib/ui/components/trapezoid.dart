import 'package:fmlfantasy/core/imports/imports.dart';

class TrapezoidClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    // Top-left: Start at (20, 0) to make top edge wider
    path.moveTo(20, 0);
    // Top-right: End at (width - 20, 0)
    path.lineTo(size.width - 20, 0);
    // Bottom-right: Slant to (width - 40, height) for narrower bottom
    path.lineTo(size.width - 40, size.height);
    // Bottom-left: Slant to (40, height)
    path.lineTo(40, size.height);
    path.quadraticBezierTo(size.width - 5, 50, 50, 50);
    // Close the path back to top-left
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
