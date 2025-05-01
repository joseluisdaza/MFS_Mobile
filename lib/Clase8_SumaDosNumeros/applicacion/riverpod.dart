import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:layouts/Clase8_SumaDosNumeros/applicacion/estados.dart';

class ContainerNotifier extends StateNotifier<ContainerState> {
  ContainerNotifier()
    : super(ContainerState(resultado: 0, flagResultado: false));

  void sumar(double? a, double? b) {
    //Solo afecta al parametro resultado y no a las otras variables
    state = state.copyWidth(resultado: a! + b!);
    updateFlag(true);
  }

  void updateFlag(bool flag) {
    state = state.copyWidth(flagResultado: flag);
  }

  void limpiar() {
    state = state.copyWidth(resultado: 0);
    updateFlag(false);
  }
}

//Se crea un objeto que se va a trabajar en el otro lado.
final containerProvider = StateNotifierProvider((ref) => ContainerNotifier());
