// import 'package:flutter/material.dart';
import 'package:get/get.dart';

//Vaa ser un contadorque cambie cuando se haga click en el boton flotante
class ContadorController extends GetxController {
  RxDouble counter = 0.0.obs;

  void incrementar() {
    counter.value++;
  }

  void setCounter() {
    counter.value = 0;
  }
}
