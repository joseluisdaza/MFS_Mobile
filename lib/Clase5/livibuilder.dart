import 'package:flutter/material.dart';
import 'package:layouts/Clase5/pagina.dart';
import 'package:layouts/Clase5/repository/data.dart';

class LiviBuilder extends StatefulWidget {
  const LiviBuilder({super.key});

  @override
  State<LiviBuilder> createState() => _LiviBuilderState();
}

class _LiviBuilderState extends State<LiviBuilder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade100,
      appBar: AppBar(
        title: const Text('Listview.builder'),
        backgroundColor: Colors.purple.shade500,
      ),
      body: ListView.builder(
        //Asignamos el tamanio en funcion al tamanio de personas.
        itemCount: personas.length,
        itemBuilder: (context, index) {
          final persona = personas[index];
          return Card(
            elevation: 5,
            color: Colors.purple.shade200,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: ListTile(
              //Hero es para hacer una transicion entre dos pantallas.
              //Se le asigna un tag para identificar el widget que se va a mover.
              leading: Hero(
                tag: persona['nombre']!,
                child: CircleAvatar(
                  //Se pone ! para que no de error si no hay foto.
                  backgroundImage: NetworkImage(persona['fotoUrl']!),
                ),
              ),

              title: Text(persona['nombre']!, style: TextStyle(fontSize: 20)),
              titleAlignment: ListTileTitleAlignment.center,
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                setState(() {
                  //Navegar a una pagina, Llamar a una pagina,como en el ejemplo del menu.
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return Pagina(
                          nombre: persona['nombre']!,
                          foto: persona['fotoUrl']!,
                        );
                      },
                    ),
                  );
                });
              },
            ),
          );
        },
      ),
    );
  }
}
