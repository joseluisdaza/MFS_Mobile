import 'dart:async';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String estado = 'Esperando...';
  final Completer<void> _eventoCompleto = Completer<void>();

  Future<void> _esperandoEvento() async {
    await _eventoCompleto.future;
    setState(() {
      estado = 'Evento recibido';
    });
  }

  void _activarEvento() {
    if (!_eventoCompleto.isCompleted) {
      _eventoCompleto.complete();
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _esperandoEvento();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Asincrono sin time')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text('estado: $estado', style: TextStyle(fontSize: 25)),
          (estado == 'Esperando...') ? CircularProgressIndicator() : SizedBox(),
          Divider(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _activarEvento();
        },
      ),
    );
  }
}
