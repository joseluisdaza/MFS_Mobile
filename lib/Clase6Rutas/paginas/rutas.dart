import 'package:flutter/material.dart';
import 'package:layouts/Clase6Rutas/data.dart';

class Rutas extends StatefulWidget {
  const Rutas({super.key});

  @override
  State<Rutas> createState() => _RutasState();
}

class _RutasState extends State<Rutas> {
  TextEditingController tedParametro = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Menu Principal"),
        backgroundColor: Colors.blue.shade900,
      ),

      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  Navigator.pushNamed(context, "/compras");
                });
              },
              child: Text("Compras"),
            ),

            ElevatedButton(
              onPressed: () {
                setState(() {
                  Navigator.pushNamed(context, "/ventas");
                });
              },
              child: Text("Ventas"),
            ),

            TextField(
              controller: tedParametro,
              decoration: InputDecoration(hintText: "Ingresa el Argumento"),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  "/gerente",
                  arguments: MisArgumentos(argumento: tedParametro.text),
                );
              },
              child: Text("Gerente"),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  "/secretaria",
                  arguments: MisArgumentos(argumento: tedParametro.text),
                );
              },
              child: Text("Secretaria"),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  "/director",
                  arguments: MisArgumentos(argumento: tedParametro.text),
                );
              },
              child: Text("Director"),
            ),
          ],
        ),
      ),
    );
  }
}
