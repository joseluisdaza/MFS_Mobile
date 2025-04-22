import 'dart:math';

import 'package:flutter/material.dart';
import 'package:layouts/Clase4/formas.dart';
import 'package:layouts/Clase4/path.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double _value = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // formas simples
          // CustomPaint(painter: Recta()),
          // CustomPaint(painter: Circulo()),
          // CustomPaint(painter: Rectangulo(0, 0, 200, 300)),

          // Trofeo creado con Canvas
          CustomPaint(painter: Trofeo(100, 300, 200, 300, _value)),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.amber.shade700,
        child: Row(
          children: [
            Container(
              width: 200,
              height: 100,
              child: Slider(
                min: -pi,
                max: pi,
                value: _value,
                onChanged: (newValue) {
                  setState(() {});
                  _value = newValue;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
