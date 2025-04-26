import 'package:flutter/material.dart';

class Gerente extends StatelessWidget {
  String argumento;
  Gerente({super.key, required this.argumento});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: Text("Gerente, data: $argumento"),
      ),
    );
  }
}
