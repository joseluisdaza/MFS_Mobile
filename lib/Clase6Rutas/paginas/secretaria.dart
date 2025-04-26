import 'package:flutter/material.dart';

class Secretaria extends StatelessWidget {
  String argumento;
  Secretaria({super.key, required this.argumento});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: Text("Secretaria, data: $argumento"),
      ),
    );
  }
}
