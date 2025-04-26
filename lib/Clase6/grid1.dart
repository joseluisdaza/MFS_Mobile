import 'package:flutter/material.dart';

class Grid1 extends StatefulWidget {
  const Grid1({super.key});

  @override
  State<Grid1> createState() => _Grid1State();
}

class _Grid1State extends State<Grid1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("GridView - grid1")),
      body: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        padding: const EdgeInsets.all(5),
        children: [
          Container(
            color: Colors.red,
            child: const Center(
              child: Text("Item 1", style: TextStyle(fontSize: 20)),
            ),
          ),
          Container(
            color: Colors.green,
            child: const Center(
              child: Text("Item 2", style: TextStyle(fontSize: 20)),
            ),
          ),
          Container(
            color: Colors.blue,
            child: const Center(
              child: Text("Item 3", style: TextStyle(fontSize: 20)),
            ),
          ),
          Container(
            color: Colors.yellow,
            child: const Center(
              child: Text("Item 4", style: TextStyle(fontSize: 20)),
            ),
          ),
          Container(
            color: Colors.purple,
            child: const Center(
              child: Text("Item 5", style: TextStyle(fontSize: 20)),
            ),
          ),
          Container(
            color: Colors.green,
            child: const Center(
              child: Text("Item 6", style: TextStyle(fontSize: 20)),
            ),
          ),
          Container(
            color: Colors.brown,
            child: const Center(
              child: Text("Item 7", style: TextStyle(fontSize: 20)),
            ),
          ),
          Container(
            color: Colors.purple,
            child: const Center(
              child: Text("Item 8", style: TextStyle(fontSize: 20)),
            ),
          ),
          Container(
            color: Colors.yellow,
            child: const Center(
              child: Text("Item 9", style: TextStyle(fontSize: 20)),
            ),
          ),
        ],
      ),
    );
  }
}
