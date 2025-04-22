import 'package:flutter/material.dart';
// import 'package:layouts/home.dart';
// import 'package:layouts/anipos.dart';
// import 'package:layouts/aniali.dart';
//import 'package:layouts/anirot.dart';
// import 'package:layouts/Tarea01-Pelota/tarea01.dart';
// import 'package:layouts/Clase4/home.dart';
import 'package:layouts/Clase4/homeGrafo.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: Home());
  }
}
