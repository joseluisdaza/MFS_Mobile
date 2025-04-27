import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:layouts/Tarea02-grafos/modelos.dart';

class Nodo extends CustomPainter {
  List<ModeloNodo> vNodo;
  Nodo(this.vNodo);

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
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
