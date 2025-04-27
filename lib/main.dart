import 'package:flutter/material.dart';
// import 'package:layouts/home.dart';
// import 'package:layouts/anipos.dart';
// import 'package:layouts/aniali.dart';
//import 'package:layouts/anirot.dart';
// import 'package:layouts/Tarea01-Pelota/tarea01.dart';
// import 'package:layouts/Clase4/home.dart';
// import 'package:layouts/Clase4/homeGrafo.dart';
// import 'package:layouts/Clase5/home.dart';
// import 'package:layouts/Clase5/fotos.dart';
// import 'package:layouts/Clase5/listview.dart';
// import 'package:layouts/Clase5/livicustom.dart';
// import 'package:layouts/Clase5/livibuilder.dart';
// import 'package:layouts/Clase6/grid1.dart';
// import 'package:layouts/Clase6/grid2.dart';
// import 'package:layouts/Clase6/grid3.dart';
import 'package:layouts/Tarea02-grafos/tarea02.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: Home());

    // return const MaterialApp(home: Fotos());
    // return const MaterialApp(home: Livi());
    // return const MaterialApp(home: Livicustom());
    // return const MaterialApp(home: LiviBuilder());
    // return const MaterialApp(home: Grid1());
    // return const MaterialApp(home: Grid2());
    // return const MaterialApp(home: Grid3());
  }
}
