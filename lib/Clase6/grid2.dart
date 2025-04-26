import 'dart:math';

import 'package:flutter/material.dart';

class Grid2 extends StatefulWidget {
  const Grid2({super.key});

  @override
  State<Grid2> createState() => _Grid2State();
}

class _Grid2State extends State<Grid2> {
  final List<int> numbers = List<int>.generate(100, (index) => index + 1);
  var gran = Random();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("GridView.builder")),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, //3 columnas
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: numbers.length, //Cantidad de elementos
        itemBuilder: (context, index) {
          return Card(
            color: Color.fromARGB(
              255,
              gran.nextInt(256),
              gran.nextInt(256),
              gran.nextInt(256),
            ),
            child: Center(
              child: Text(
                "Item ${numbers[index]}",
                style: const TextStyle(fontSize: 20),
              ),
            ),
          );
        },
      ),
    );
  }
}
