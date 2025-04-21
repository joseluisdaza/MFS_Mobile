import 'package:flutter/material.dart';

//Column
class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Column')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          nodo(Colors.red),
          nodo(Colors.green),
          nodo(Colors.blue),
          nodo(Colors.pink),
          SizedBox(width: double.infinity),
        ],
      ),
    );
  }

  Widget nodo(Color color) {
    return Container(height: 100, width: 100, color: color);
  }
}
