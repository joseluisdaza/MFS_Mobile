import 'package:flutter/material.dart';
//cards.

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Card')),
      body: Column(
        children: [
          //ROMBO
          Card(
            shape: BeveledRectangleBorder(
              borderRadius: BorderRadius.circular(125), //con 125 es un rombo
            ),
            color: Colors.red,
            elevation: 10,
            child: Container(width: 200, height: 200),
          ),

          //Rectangulo
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30), //con 125 es un rombo
            ),
            color: Colors.amber,
            elevation: 10,
            child: Container(width: 300, height: 200),
          ),

          //hoja
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(150),
                bottomLeft: Radius.circular(180),
              ), //con 125 es un rombo
            ),
            color: Colors.green.shade900,
            elevation: 20,
            child: Container(width: 300, height: 200),
          ),
        ],
      ),
    );
  }
}
