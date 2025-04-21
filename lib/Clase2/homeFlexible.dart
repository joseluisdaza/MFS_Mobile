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
          Container(width: double.infinity, height: 100, color: Colors.red),
          Expanded(child: Container(color: Colors.teal)),
          Flexible(
            child: Container(color: Colors.purple, height: 100),
            fit: FlexFit.loose, //deja de actuar como flecible y actuacomo flex
          ),
          Flexible(child: Container(color: Colors.amberAccent)),
        ],
      ),
    );
  }

  Widget nodo(Color color) {
    return Container(height: 100, width: 100, color: color);
  }
}
