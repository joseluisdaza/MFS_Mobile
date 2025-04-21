import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Column')),
      body: Stack(
        children: [
          Align(alignment: Alignment(-1, -1), child: nodo(Colors.green)),
          Align(alignment: Alignment(0, -1), child: nodo(Colors.yellow)),
          Align(alignment: Alignment(1, -1), child: nodo(Colors.red)),
          Align(alignment: Alignment(-1, 0), child: nodo(Colors.blue.shade200)),
          Align(alignment: Alignment(0, 0), child: nodo(Colors.blue.shade500)),
          Align(alignment: Alignment(1, 0), child: nodo(Colors.blue.shade900)),
          Align(
            alignment: Alignment(-1, 1),
            child: nodo(Colors.brown.shade100),
          ),
          Align(alignment: Alignment(0, 1), child: nodo(Colors.brown.shade500)),
          Align(alignment: Alignment(1, 1), child: nodo(Colors.brown.shade900)),
        ],
      ),
    );
  }

  Widget nodo(Color color) {
    return Container(height: 100, width: 100, color: color);
  }
}
