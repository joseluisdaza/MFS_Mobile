import 'package:flutter/material.dart';

class Director extends StatelessWidget {
  String argumento;

  Director({super.key, required this.argumento});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: Text("Director, data: $argumento"),
      ),
    );
  }
}
