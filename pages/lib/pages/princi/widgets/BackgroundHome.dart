import 'package:flutter/material.dart';

class BackgroundHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(painter: _HeaderHomePainter()),
    );
  }
}

class _HeaderHomePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz =
        Paint()
          ..shader = const LinearGradient(
            colors: [Color(0xFF1E3C72), Color(0xFF2A5298)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    final path = Path();
    path.lineTo(0, size.height * 0.9);
    path.quadraticBezierTo(size.width * 0.02, size.height * 0.8, size.width,size.height * 0.6);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
