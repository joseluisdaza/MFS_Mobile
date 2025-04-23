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
  var gran = Random();
  int level = 1;
  int maxLevel = 4;
  int maxPelotas = 10;

  Color colorPorDefecto = Colors.red;
  Color colorClickeado = Colors.black;
  List<Widget> pelotas = [];
  int ballClickedCounter = 0;
  int score = 0;

  double getRandomDouble() {
    return gran.nextDouble() * 2 - 1; //De -1 a 1
  }

  int getSpeed() {
    return 2550 - (level * 500); // Velocidad de movimiento de las pelotas
  }

  void resetPelotas() {
    pelotas.clear(); // Limpiar la lista de pelotas
    ballClickedCounter = 0; // Reiniciar el contador de clics
  }

  void onPelotaClicked() {
    setState(() {
      ballClickedCounter++;
      score += 1 * level; // Aumentar el puntaje según el nivel
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 20,
            left: 20,
            child: Text(
              'Level: $level Score: $score',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ...pelotas, // Agrega las pelotas a la pantalla
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            if (ballClickedCounter >= maxPelotas) {
              // Si se alcanzó el máximo de pelotas, reiniciar
              resetPelotas();
              level++;
            }

            if (level <= maxLevel) {
              int newSpeed = getSpeed();
              for (int i = 0; i < maxPelotas; i++) {
                pelotas.add(
                  Pelota(
                    key: UniqueKey(),
                    speed: newSpeed,
                    onPelotaClicked: onPelotaClicked,
                  ),
                );
              }
            }
          });
        },
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}

class Pelota extends StatefulWidget {
  final Function onPelotaClicked; // Callback para el clic en la pelota
  final int speed;

  const Pelota({super.key, required this.speed, required this.onPelotaClicked});

  @override
  State<Pelota> createState() => _PelotaState();
}

class _PelotaState extends State<Pelota> {
  final Random gran = Random();
  double posX = 0, posY = 1;
  bool isClicked = false; // Para saber si la pelota fue clickeada
  Color colorPorDefecto = Colors.red;

  @override
  void initState() {
    super.initState();
    _moveRandomly(); // Comienza el movimiento aleatorio de la pelota.
  }

  void _moveRandomly() {
    Future.delayed(Duration(milliseconds: widget.speed), () {
      setState(() {
        if (isClicked) {
          posY = 1; // Cambia la posición Y para que desaparezca
        } else {
          posX = gran.nextDouble() * 2 - 1; // De -1 a 1
          posY = gran.nextDouble() * 2 - 1; // De -1 a 1
          _moveRandomly(); // Llama a la función nuevamente para continuar el movimiento.
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedAlign(
      alignment: Alignment(posX, posY), // Alignment en el centro
      duration: Duration(milliseconds: widget.speed),
      // curve: Curves.bounceOut, // Para que rebote
      child: GestureDetector(
        onTap: () {
          widget.onPelotaClicked(); // Llama a la función de callback
          setState(() {
            isClicked = true;
            colorPorDefecto = Colors.black;
          });
        },
        child: Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            gradient: RadialGradient(colors: [Colors.white, colorPorDefecto]),
            // Para que se vea redondo
            borderRadius: BorderRadius.circular(100),
          ),
        ),
      ),
    );
  }
}
