import 'package:flutter/material.dart';

class Recta extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Definir una pintura, pincel o brocha de la clase paint.
    Paint pincel =
        Paint()
          //notacion factorizada con el .. por delante
          ..color =
              Colors
                  .green //Color de la linea
          ..style =
              PaintingStyle
                  .stroke //Estilo de la pintura, fill en toda la imagen, stroke solo para losbordes
          ..strokeWidth = 10; //Grosor de la pintura

    canvas.drawLine(Offset(100, 100), Offset(300, 400), pincel);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    //Para que no realize un repintado cuando haya un cambio.
    return false;
  }
}

class Circulo extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint =
        Paint()
          ..color = Colors.purpleAccent
          ..style = PaintingStyle.fill;

    Paint borde =
        Paint()
          ..color = Colors.black
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2; //Grosor del borde

    canvas.drawCircle(Offset(200, 200), 50, paint);
    canvas.drawCircle(Offset(200, 200), 50, borde); //Dibuja el borde
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class Rectangulo extends CustomPainter {
  double x1, y1, x2, y2;

  Rectangulo(this.x1, this.y1, this.x2, this.y2);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint =
        Paint()
          ..color = Colors.greenAccent
          ..style = PaintingStyle.fill;

    // canvas.drawRect(Rect.fromLTWH(50, 50, 100, 200), paint);
    canvas.drawRect(Rect.fromPoints(Offset(x1, y1), Offset(x2, y2)), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
