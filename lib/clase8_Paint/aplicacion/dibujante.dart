import 'package:flutter/material.dart';
import 'package:layouts/clase8_Paint/dominio/modeloNodo.dart';

class Dibujante extends CustomPainter {
  List<ModeloNodo> vNodo;
  Dibujante(this.vNodo);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..style = PaintingStyle.fill;

    //refrescar todos los puntos.
    vNodo.forEach((ele) {
      paint.color = ele.color;
      canvas.drawCircle(Offset(ele.x, ele.y), ele.radio, paint);
    });
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
