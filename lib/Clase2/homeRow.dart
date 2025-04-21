import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Column')),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          nodo(Colors.teal),
          nodo(Colors.pink),
          nodo(Colors.blue),
          SizedBox(
            height: double.infinity,
          ), //Para tenerun componente que tenga todo el alto
        ],
      ),
    );
  }

  Widget nodo(Color color) {
    return Container(height: 100, width: 100, color: color);
  }
}
