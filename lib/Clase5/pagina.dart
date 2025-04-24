import 'package:flutter/material.dart';

class Pagina extends StatefulWidget {
  String nombre, foto;
  Pagina({super.key, required this.nombre, required this.foto});

  @override
  State<Pagina> createState() => _PaginaState();
}

class _PaginaState extends State<Pagina> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade100,
      appBar: AppBar(
        title: Text('Pagina de: ${widget.nombre}'),
        backgroundColor: Colors.purple.shade500,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          //Para poder tener las esquinas redondeadas
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            //Se pone Hero para tener una transicion entre dos pantallas.
            //Se le asigna un tag para identificar el widget que se va a mover. que matchee
            child: Hero(
              tag: widget.nombre,
              child: Image.network(
                widget.foto,
                width: double.infinity,
                height: 350,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
