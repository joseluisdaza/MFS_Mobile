import 'package:flutter/material.dart';
import 'package:layouts/Clase6_menu_draw/menu_draw.dart'

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp( home: MenuDrawer());
  }
}
