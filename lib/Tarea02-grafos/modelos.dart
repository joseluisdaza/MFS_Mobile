import 'package:flutter/material.dart';

class ModeloNodo {
  double x, y, radio;
  Color color;
  String nombre;

  ModeloNodo(this.x, this.y, this.radio, this.color, this.nombre);
}

class ModeloLinea {
  final ModeloNodo inicio;
  final ModeloNodo fin;
  final Color color;
  final double valor;

  ModeloLinea(this.inicio, this.fin, this.color, this.valor);
}
