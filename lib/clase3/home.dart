import 'dart:math';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool flag = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('AnimatedContainer')),
      body: Align(
        alignment: Alignment(-1, -1),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 1000),
          width: 250,
          height: 250,
          color: Colors.green,
          transform: Matrix4.rotationY(flag ? pi : 0),
          curve: Curves.bounceInOut,

          transformAlignment: Alignment(-1, -1),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            flag = !flag;
          });
        },
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}
