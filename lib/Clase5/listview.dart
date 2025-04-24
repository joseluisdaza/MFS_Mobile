import 'package:flutter/material.dart';

class Livi extends StatefulWidget {
  const Livi({super.key});

  @override
  State<Livi> createState() => _LiviState();
}

class _LiviState extends State<Livi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ListView')),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.star),
            title: Text('Mensaje del titulo', style: TextStyle(fontSize: 25)),
            trailing: Icon(Icons.arrow_back_ios),
            subtitle: Text('Subtitulo'),
            onTap: () {
              print('Tocaste el mensaje del titulo');
            },

            onLongPress:
                () => print('Hiciste un toque largo en el mensaje del titulo'),
          ),

          Divider(thickness: 5, indent: 50, color: Colors.blueAccent),

          ListTile(
            leading: Icon(Icons.star),
            title: Text('Producto 2', style: TextStyle(fontSize: 25)),
            trailing: Icon(Icons.arrow_back_ios),
            subtitle: Text('Subtitulo'),
            onTap: () {
              print('Producto 2');
            },

            onLongPress: () => print('toque largo producto 2'),
          ),

          Divider(),
          Text('Este es el final', textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
