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

    final lapiz2 = Paint();
    lapiz2.color = Color.fromARGB(255, 255, 255, 255);
    lapiz2.style = PaintingStyle.stroke;
    lapiz2.strokeWidth = 10.0;

    final linea1 = Path();
    linea1.quadraticBezierTo(
      size.width * 0.2, 
      size.height * 0.1, 
      size.width * 0.3, 
      size.height * 1
      );
    
    canvas.drawPath(linea1, lapiz2);


    final linea2 = Path();
    linea2.moveTo(size.width, 0);
    linea2.quadraticBezierTo(
      size.width * 0.8, 
      size.height * 0.1, 
      size.width * 0.7, 
      size.height * 1
      );
    
    canvas.drawPath(linea2, lapiz2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}