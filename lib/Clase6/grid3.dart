import 'dart:math';

import 'package:flutter/material.dart';

class Grid3 extends StatefulWidget {
  const Grid3({super.key});

  @override
  State<Grid3> createState() => _Grid3State();
}

class _Grid3State extends State<Grid3> {
  List<List<int>> data = [];
  //   [1],
  //   [2, 3, 4],
  //   [5, 6, 7, 8, 9, 0],
  //   [10, 11, 12, 13, 14, 15, 16],
  //   [17, 18, 19, 20, 21, 22, 23, 24],
  //   [25, 26, 27, 28, 29, 30, 31, 32],
  //   [33, 34, 35, 36, 37, 38],
  //   [39],
  //   [40, 41, 42, 43, 44, 45],
  //   [46, 47, 48, 49, 50, 51, 52],
  //   [53, 54, 55, 56, 57, 58],
  //   [59, 60, 61, 62],
  //   [63, 64],
  //   [65],
  // ];

  var gran = Random();
  void cargarDatos() {
    int nFilas = gran.nextInt(5) + 1;

    for (int i = 0; i < nFilas; i++) {
      var v = List.generate(
        1 + gran.nextInt(10),
        (index) => gran.nextInt(10) + 1,
      );
      data.add(v);
    }
  }

  //Este metodo se llama una vez cuando se crea el widget.
  //Es el lugar ideal para cargar datos desde una base de datos o una API.
  @override
  void initState() {
    super.initState();
    cargarDatos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("ListView Avanzado - grid3")),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          final rowItem = data[index];
          final scrollable = rowItem.length > 3;

          return Padding(
            padding: EdgeInsets.all(5),
            child:
                scrollable
                    ? SizedBox(
                      height: 100,
                      child: ListView.builder(
                        itemCount: rowItem.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, idx) {
                          return Container(
                            //circulares a lo horizontal
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              gradient: RadialGradient(
                                colors: [Colors.white, Colors.greenAccent],
                              ),
                            ),
                            child: Center(
                              child: Text(
                                "${rowItem[idx]}",
                                style: const TextStyle(fontSize: 20),
                              ),
                            ),
                          );
                        },
                      ),
                    )
                    : Row(
                      children:
                          rowItem.map((item) {
                            return Expanded(
                              child: Container(
                                height: 100,
                                margin: EdgeInsets.symmetric(
                                  horizontal: 5,
                                  vertical: 10,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: RadialGradient(
                                    colors: [Colors.white, Colors.blueAccent],
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    item.toString(),
                                    style: TextStyle(fontSize: 25),
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                    ),
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            cargarDatos();
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
