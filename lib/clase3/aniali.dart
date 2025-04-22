import 'dart:math';

import 'package:flutter/material.dart';

//Animated alignment.
//Este va a tener animaciones y cambiara de lugar.

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double x = 0, y = 1;
  int ballClickedCounter = 0;
  var gran = Random();
  Color colorPorDefecto = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 20,
            left: 20,
            child: Text(
              'Score: $ballClickedCounter',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          AnimatedAlign(
            alignment: Alignment(x, y), //Alignment en el centro
            duration: Duration(milliseconds: 1000),
            curve: Curves.bounceOut, //Para que rebote
            onEnd: () {
              //TAREA,
              //  1. cada vez que se toqueel floating, que aparezca una nueva esperay que esta se mueva de forma randomica.
              // 2. cada vez que se toque el widget, este debe desaparecer y aparecer en otro lugar.
              // 3. cada esfera tenga su propio movimiento o curva, el tipo de curve sea randomico no todas Curves.bounceOut.
              setState(() {});
              //Cuando termine la animacion
              //Vuelve a actualizar la posicion.
              // x = gran.nextDouble() * 2 - 1; //De -1 a 1
              // y = gran.nextDouble() * 2 - 1; //De -1 a 1

              if (y == 1) {
                //Cambia de color a la esfera
                colorPorDefecto = Color.fromARGB(
                  100,
                  gran.nextInt(256),
                  gran.nextInt(256),
                  gran.nextInt(256),
                );
              }

              x = 0;
              y = 1;
            },

            child: GestureDetector(
              onTap: () {
                setState(() {
                  ballClickedCounter++; //Incrementa la cantidad de pelotas golpeadas.
                });
              },
              child: Container(
                width: 70,
                height: 70,
                // color: Colors.black //NO puede haber colorsi esquehay decoration.
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    colors: [Colors.white, colorPorDefecto],
                  ),
                  //Para que se vea redondo
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            // x = gran.nextDouble() * 2 - 1; //De -1 a 1
            // y = gran.nextDouble() * 2 - 1; //De -1 a 1

            x = 0;
            y = -1;
          });
        },
      ),
    );
  }
}
