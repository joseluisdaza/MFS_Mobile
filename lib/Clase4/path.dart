import 'package:flutter/material.dart';

class Trofeo extends CustomPainter {
  double x, y, w, h, angulo;
  // Trofeo(this.x, this.y, this.w, this.h) : super(size: Size(w, h));
  Trofeo(this.x, this.y, this.w, this.h, this.angulo);

  @override
  void paint(Canvas canvas, Size size) {
    var paint =
        Paint()
          ..color = Colors.amber
          ..style = PaintingStyle.fill;

    Paint borde =
        Paint()
          ..color = Colors.amber.shade900
          ..style = PaintingStyle.stroke
          ..strokeWidth = 3; //Grosor del borde

    double xPart = w / 11;
    double yPart = h / 11;
    Path m = Path();

    m.moveTo(x, y);
    m.lineTo(x + 2 * xPart, y + 3 * yPart);
    m.cubicTo(
      x + 3 * xPart,
      y + yPart,
      x + 5 * xPart,
      y + 5 * yPart,
      x + 6 * xPart,
      y + 3 * yPart,
    );
    m.lineTo(x + w, y + 3 * yPart);
    m.lineTo(x + 6 * xPart, y + 8 * yPart);
    m.quadraticBezierTo(x + 6 * xPart, y + h, x + w, y + h);
    m.lineTo(x, y + h);
    m.quadraticBezierTo(x + 4 * xPart, y + 7 * yPart, x, y + 3 * yPart);
    // m.close();

    //Para rotar
    //Para asignar el centro de la rotacion
    canvas.translate(x + w / 2, y + h / 2);
    canvas.rotate(angulo); //en radianes
    canvas.translate(-(x + w / 2), -(y + h / 2));

    //Para trasladar

    canvas.drawPath(m, paint);
    canvas.drawPath(m, borde);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
