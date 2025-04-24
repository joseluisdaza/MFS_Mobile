import 'package:flutter/material.dart';

class Livicustom extends StatefulWidget {
  const Livicustom({super.key});

  @override
  State<Livicustom> createState() => _LivicustomState();
}

class _LivicustomState extends State<Livicustom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Listview.custom')),

      //Genera una lista infinita de elementos.
      body: ListView.custom(
        childrenDelegate: SliverChildBuilderDelegate(
          (context, index) {
            return ListTile(
              leading: Icon(Icons.person),
              title: Text(
                'Elemento $index',
                style: const TextStyle(fontSize: 25),
              ),
            );
          },
          //Esto es importante para que no sea una lista infinita sino tenga un limite.
          childCount: 20,
        ),
      ),
    );
  }
}
