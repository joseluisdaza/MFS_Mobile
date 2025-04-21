import 'dart:math';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int pos = 0;
  List<Color> vColors = [Colors.red, Colors.green, Colors.blue, Colors.teal];

  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context).size;
    List<List<double>> nLimites = [
      [
        0,
        screen.width / 2,
        screen.height / 2,
        0,
        0,
        screen.width,
        screen.height,
        0,
      ],
      [
        0,
        0,
        screen.height / 2,
        screen.width / 2,
        0,
        0,
        screen.height,
        screen.width,
      ],
      [
        screen.height / 2,
        0,
        0,
        screen.width / 2,
        screen.height,
        0,
        0,
        screen.width,
      ],
      [
        screen.height / 2,
        screen.width / 2,
        0,
        0,
        screen.height,
        screen.width,
        0,
        0,
      ],
    ];

    // return Scaffold(body: Stack(children: [cortina(screen, Colors.red)]));
    return Scaffold(
      body: Stack(
        children: [
          //TAREA: crear un esfera que se muestre y crezca en el centro de la pantalla
          //mientras lo otroswidgets se ocultan.
          // AnimatedContainer(
          //   duration: Duration(milliseconds: 1000),
          //   width: 100,
          //   height: 100,
          //   color: Colors.black,
          // ),
          cortina(nLimites[0], vColors, 0),
          cortina(nLimites[1], vColors, 1),
          cortina(nLimites[2], vColors, 2),
          cortina(nLimites[3], vColors, 3),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {});
          pos = (pos + 1) % 2;
        },
        child: Icon(Icons.play_arrow),
      ),
    );
  }

  Widget cortina(nLimits, vcolors, fila) {
    return AnimatedPositioned(
      top: nLimits[0 + pos * 4],
      right: nLimits[1 + pos * 4],
      bottom: nLimits[2 + pos * 4],
      left: nLimits[3 + pos * 4],
      duration: Duration(milliseconds: 1000),
      //GestureDetector captura gestos y eventos en pantallas.
      child: GestureDetector(
        onTap: () {
          //en el toque
          print('Cortina $fila');
          var gran = Random();

          setState(() {
            vColors[fila] = Color.fromARGB(
              1000,
              gran.nextInt(255),
              gran.nextInt(255),
              gran.nextInt(255),
            );
          });
        },
        onPanDown: (desp) {
          // captura el evento del toque y recibe la posicion
          print(' x = ${desp.globalPosition} y = ${desp.localPosition}');
        },
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.white, vColors[fila]],
              begin: Alignment.topLeft,
              end: Alignment(1, 1),
            ),

            // shape: BoxShape.circle,
            // gradient: LinearGradient(
            //   colors: [Colors.red, Colors.blue],
            //   begin: Alignment.topLeft,
            //   end: Alignment.bottomRight,
            // ),
          ),
          // color: vcolors[fila]
        ),
      ),
    );
  }

  //2
  // Widget cortina(nLimits, color) {
  //   return AnimatedPositioned(
  //     top: nLimits[0 + pos * 4],
  //     right: nLimits[1 + pos * 4],
  //     bottom: nLimits[2 + pos * 4],
  //     left: nLimits[3 + pos * 4],
  //     duration: Duration(milliseconds: 1000),
  //     child: Container(color: color),
  //   );
  // }

  //01
  // Widget cortina(screen, color) {
  //   return AnimatedPositioned(
  //     top: 0,
  //     right: screen.width / 2,
  //     bottom: screen.height / 2,
  //     left: 0,
  //     duration: Duration(milliseconds: 1000),
  //     child: Container(color: color),
  //   );
  // }
}
