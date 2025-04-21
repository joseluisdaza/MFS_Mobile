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
  Color colorPorDefecto = Colors.red;
  Color colorClickeado = Colors.black;
  List<Widget> pelotas = [];

  double getRandomDouble() {
    return gran.nextDouble() * 2 - 1; //De -1 a 1
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: pelotas),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            pelotas.add(Pelota(key: UniqueKey()));
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class Pelota extends StatefulWidget {
  const Pelota({super.key});

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
    Future.delayed(Duration(milliseconds: 1000), () {
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
      duration: Duration(milliseconds: 1000),
      // curve: Curves.bounceOut, // Para que rebote
      child: GestureDetector(
        onTap: () {
          // Cuando se le de click a la pelota
          print('Pelota clickeada');
          setState(() {
            isClicked = true;
            colorPorDefecto = Colors.black;
          });

          // final parentState = context.findAncestorStateOfType<_HomeState>();
          // if (parentState != null) {
          //   parentState.setState(() {
          //     parentState.pelotas.removeWhere(
          //       (pelota) => pelota.key == widget.key,
          //     );
          //   });
          // }

          // setState(() {
          //   // posY = 1; // Cambiar la posición Y para que desaparezca
          //   (context.findAncestorStateOfType<_HomeState>()?.pelotas ?? [])
          //       .remove(widget);
          // });
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
