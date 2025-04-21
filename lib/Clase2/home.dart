import 'package:flutter/material.dart';
import 'package:layouts/Clase2/perfecto.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController tedNumero = TextEditingController();
  String resultado = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('numero perfecto')),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            TextField(
              controller: tedNumero,
              decoration: InputDecoration(hintText: "Ingrese un numero"),
            ),
            SizedBox(height: 50),
            Text('$resultado', style: TextStyle(fontSize: 35)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            int n = tedNumero.text.isEmpty ? 0 : int.parse(tedNumero.text);
            Perfecto p = Perfecto(n);
            if (p.esPerfecto()) {
              resultado = "El numero $n es perfecto";
            } else {
              resultado = "El numero $n no es perfecto";
            }
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Widget nodo(Color color) {
    return Container(height: 100, width: 100, color: color);
  }
}
