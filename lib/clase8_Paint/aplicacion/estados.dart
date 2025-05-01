import 'package:flutter/material.dart';

import 'package:layouts/clase8_Paint/dominio/modeloNodo.dart';

class ContainerState {
  final List<ModeloNodo> vNodo;
  final int modo;
  final double valorSlider;
  ContainerState({
    required this.vNodo,
    required this.modo,
    required this.valorSlider,
  });

  ContainerState copyWith({
    List<ModeloNodo>? vNodo,
    int? modo,
    double? valorSlider,
  }) {
    return ContainerState(
      vNodo: vNodo ?? this.vNodo,
      modo: modo ?? this.modo,
      valorSlider: valorSlider ?? this.valorSlider,
    );
  }
}
