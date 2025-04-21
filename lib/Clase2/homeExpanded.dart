import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Column')),
      body: Column(
        children: [
          Expanded(flex: 3, child: Container(color: Colors.red)),
          Expanded(flex: 1, child: Container(color: Colors.green)),
          Expanded(flex: 1, child: Container(color: Colors.amber)),
        ],
      ),
    );
  }

  Widget nodo(Color color) {
    return Container(height: 100, width: 100, color: color);
  }
}
