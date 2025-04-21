import 'package:flutter/material.dart';

class Dos extends StatelessWidget {
  const Dos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        title: Text("Pagina Dos"),
        backgroundColor: Colors.green.shade900,
      ),
    );
  }
}
