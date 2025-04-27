import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:layouts/Tarea02-grafos/modelos.dart';

class Nodo extends CustomPainter {
  List<ModeloNodo> vNodo;
  List<ModeloLinea> vLineas = [];

  Nodo(this.vNodo, this.vLineas);

  @override
  void paint(Canvas canvas, Size size) {
    // Paint paint = Paint()..style = PaintingStyle.fill;

    // vNodo.forEach((ele) {
    //   paint.color = ele.color;
    //   canvas.drawCircle(Offset(ele.x, ele.y), ele.radio, paint);
    //   canvas.drawParagraph(Paragraph().., Offset(ele.x, ele.y));

    // });

    Paint paint = Paint()..style = PaintingStyle.fill;

    vNodo.forEach((ele) {
      // Draw the circle
      paint.color = ele.color;
      canvas.drawCircle(Offset(ele.x, ele.y), ele.radio, paint);

      // Draw the text (ele.nombre)
      final textStyle = TextStyle(
        color: Colors.black,
        fontSize: 14,
        fontWeight: FontWeight.bold,
      );
      final textSpan = TextSpan(
        text: ele.nombre, // The name of the node
        style: textStyle,
      );
      final textPainter = TextPainter(
        text: textSpan,
        textDirection: TextDirection.ltr,
      );
      textPainter.layout(); // Layout the text
      final textOffset = Offset(
        ele.x - textPainter.width / 2, // Center the text horizontally
        ele.y - textPainter.height / 2, // Center the text vertically
      );
      textPainter.paint(canvas, textOffset);
    });

    // Draw lines
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 2.0;
    paint.color = Colors.black;

    vLineas.forEach((linea) {
      canvas.drawLine(
        Offset(linea.inicio.x, linea.inicio.y),
        Offset(linea.fin.x, linea.fin.y),
        paint,
      );

      // Draw the value of the line
      final textStyle = TextStyle(
        color: Colors.blue,
        fontSize: 12,
        fontWeight: FontWeight.bold,
      );
      final textSpan = TextSpan(
        text: linea.valor.toStringAsFixed(1),
        style: textStyle,
      );
      final textPainter = TextPainter(
        text: textSpan,
        textDirection: TextDirection.ltr,
      );
      textPainter.layout();
      final midX = (linea.inicio.x + linea.fin.x) / 2;
      final midY = (linea.inicio.y + linea.fin.y) / 2;
      final textOffset = Offset(
        midX - textPainter.width / 2,
        midY - textPainter.height / 2,
      );
      textPainter.paint(canvas, textOffset);
    });
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
