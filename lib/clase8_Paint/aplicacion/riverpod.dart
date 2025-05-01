import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:layouts/clase8_Paint/aplicacion/estados.dart';
import 'package:layouts/clase8_Paint/dominio/modeloNodo.dart';

class ContainerNotifier extends StateNotifier<ContainerState> {
  ContainerNotifier()
    : super(ContainerState(vNodo: [], modo: -1, valorSlider: 1));

  void agregarNodo(ModeloNodo nodo) {
    //[...state.vNodo] significa agrega todo lo que tine state.vNodo
    state = state.copyWith(vNodo: [...state.vNodo, nodo]);
  }

  void actualizaSlider(double valor) {
    state = state.copyWith(valorSlider: valor);
  }
}

final containerProvider =
    StateNotifierProvider<ContainerNotifier, ContainerState>(
      (ref) => ContainerNotifier(),
    );
