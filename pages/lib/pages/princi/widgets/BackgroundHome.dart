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
    final lapiz = Paint();
    lapiz.shader = const LinearGradient(
      colors: [Color(0xFF1E3C72), Color(0xFF2A5298)],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    final path = Path();
    path.lineTo(0, size.height * 0.9);
    path.quadraticBezierTo(
      size.width * 0.5, 
      size.height * 0.3, 
      size.width,
      size.height * 0.9
    );
    path.lineTo(size.width, 0);

    canvas.drawPath(path, lapiz);

    final lapizRelleno = Paint();
    lapizRelleno.color = Colors.white.withOpacity(0.3);
    lapizRelleno.style = PaintingStyle.fill;

    final linea1 = Path();
    linea1.moveTo(0, 0);
    linea1.quadraticBezierTo(
      size.width * 0.2, 
      size.height * 0.1, 
      size.width * 0.3, 
      size.height * 1
    );
    linea1.lineTo(0, size.height);
    linea1.lineTo(0, 0);
    
    canvas.drawPath(linea1, lapizRelleno);

    final linea2 = Path();
    linea2.moveTo(size.width, 0);
    linea2.quadraticBezierTo(
      size.width * 0.8, 
      size.height * 0.1, 
      size.width * 0.7, 
      size.height * 1
    );
    linea2.lineTo(size.width, size.height);
    linea2.lineTo(size.width, 0);
    
    canvas.drawPath(linea2, lapizRelleno);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}