import 'package:flutter/material.dart';

class BackgroundLogin extends StatelessWidget {
  const BackgroundLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(painter: _BackgroundLoginPainter()),
    );
  }
}

class _BackgroundLoginPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..shader = const LinearGradient(
            colors: [Color(0xFF1E3C72), Color(0xFF1E3C72)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    final path = Path();

    path.lineTo(0, size.height * 0.8);
    path.quadraticBezierTo(
      size.width * 0.1,
      size.height * 0.4,
      size.width * 0.4,
      size.height * 0.8,
    );
    path.quadraticBezierTo(
      size.width * 0.6,
      size.height * 0.6,
      size.width * 0.8,
      size.height * 0.8,
    );
    path.quadraticBezierTo(
      size.width,
      size.height * 0.9,
      size.width,
      size.height * 0.1,
    );
    path.lineTo(size.width, 0);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
