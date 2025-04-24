import 'package:flutter/material.dart';

class Tarjeta extends StatefulWidget {
  const Tarjeta({super.key});

  @override
  State<Tarjeta> createState() => _TarjetaState();
}

class _TarjetaState extends State<Tarjeta> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Card')),
      body: Column(
        children: [
          Card(
            shape: BeveledRectangleBorder(
              borderRadius: BorderRadius.circular(25), //con 125 es un rombo
            ),
            color: Colors.red,
            elevation: 10,
            child: Container(width: 200, height: 200),
          ),
        ],
      ),
    );
  }
}
