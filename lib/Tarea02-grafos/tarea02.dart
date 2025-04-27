import 'dart:math';

import 'package:flutter/material.dart';
import 'package:layouts/Tarea02-grafos/modelos.dart';
import 'package:layouts/Tarea02-grafos/nodo.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int modo = -1;
  List<ModeloNodo> vNodo = [];
  var gran = Random();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GestureDetector(
            onPanDown: (desp) {
              setState(() {
                //Crear el nodo porque hay un toque.

                if (modo == 1) {
                  //TODO: Display a popup to ask for the color, radio and name of the node.

                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      TextEditingController colorController =
                          TextEditingController();
                      TextEditingController radioController =
                          TextEditingController();
                      TextEditingController nameController =
                          TextEditingController();

                      return AlertDialog(
                        title: Text("Detalles del nodo"),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextField(
                              controller: colorController,
                              decoration: InputDecoration(
                                labelText:
                                    "Color (black, red, green, blue, yellow, purple, pink)",
                              ),
                            ),
                            TextField(
                              controller: radioController,
                              decoration: InputDecoration(labelText: "Radio"),
                            ),
                            TextField(
                              controller: nameController,
                              decoration: InputDecoration(labelText: "Nombre"),
                            ),
                          ],
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text("Cancelar"),
                          ),
                          TextButton(
                            onPressed: () {
                              // setState(() {
                              vNodo.add(
                                ModeloNodo(
                                  desp.localPosition.dx,
                                  desp.localPosition.dy,
                                  double.parse(radioController.text),
                                  getColor(colorController.text),
                                  nameController.text,
                                ),
                              );
                              Navigator.of(context).pop();
                              // });
                            },
                            child: Text("Crear"),
                          ),
                        ],
                      );
                    },
                  );

                  // vNodo.add(
                  //   ModeloNodo(
                  //     desp.localPosition.dx,
                  //     desp.localPosition.dy,
                  //     20,
                  //     getColor("random"),
                  //   ),
                  // );
                } else if (modo == 3) {
                  //Eliminar el nodo porque hay un toque.
                  int indice = estaEnNodo(
                    desp.localPosition.dx,
                    desp.localPosition.dy,
                  );
                  if (indice >= 0) {
                    //Si el indice es diferente de -1, significa que hay un nodo en esa posicion.
                    print("Estamos sobre el nodo: $indice");
                    vNodo.removeAt(indice);
                  }
                }
              });
            },
            onPanUpdate: (desp) {
              if (modo == 2) {
                setState(() {
                  //Mover el nodo
                  //Obtenemos la posicion del nodo que se toco.
                  int indice = estaEnNodo(
                    desp.localPosition.dx,
                    desp.localPosition.dy,
                  );
                  if (indice >= 0) {
                    //Si el indice es diferente de -1, significa que hay un nodo en esa posicion.
                    print("Estamos sobre el nodo: $indice");
                    vNodo[indice].x = desp.localPosition.dx;
                    vNodo[indice].y = desp.localPosition.dy;
                  }
                });
              }
            },
            child: CustomPaint(painter: Nodo(vNodo), child: Container()),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CircleAvatar(
              backgroundColor:
                  (modo == 1) ? Colors.green.shade900 : Colors.red.shade900,
              child: IconButton(
                onPressed: () {
                  setState(() {
                    modo = 1;
                  });
                },
                icon: Icon(Icons.add, color: Colors.white),
              ),
            ),

            SizedBox(width: 5),
            CircleAvatar(
              backgroundColor:
                  (modo == 2) ? Colors.green.shade900 : Colors.red.shade900,
              child: IconButton(
                onPressed: () {
                  setState(() {
                    modo = 2;
                  });
                },
                icon: Icon(Icons.move_up_rounded, color: Colors.white),
              ),
            ),

            SizedBox(width: 5),
            CircleAvatar(
              backgroundColor:
                  (modo == 3) ? Colors.green.shade900 : Colors.red.shade900,
              child: IconButton(
                onPressed: () {
                  setState(() {
                    modo = 3;
                  });
                },
                icon: Icon(Icons.delete, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  int estaEnNodo(double xDesplazado, double yDesplazado) {
    int indice = -1;
    for (int i = 0; i < vNodo.length; i++) {
      double xnodo = vNodo[i].x;
      double ynodo = vNodo[i].y;
      double radio = vNodo[i].radio;

      double distancia = sqrt(
        pow(xDesplazado - xnodo, 2) + pow(yDesplazado - ynodo, 2),
      );

      if (distancia <= radio) {
        // Si la distancia es menor o igual al radio, el punto está dentro del nodo
        indice = i;

        break;
      }
    }

    return indice;
  }

  Color getColor(String colorName) {
    if (colorName.isEmpty) {
      return Colors.black; // Default color if name is null or empty
    }

    if (colorName.toLowerCase() == "random") {
      return Color.fromARGB(
        1000,
        gran.nextInt(256),
        gran.nextInt(256),
        gran.nextInt(256),
      );
    }

    if (colorName.toLowerCase() == "red") {
      return Colors.red;
    } else if (colorName.toLowerCase() == "green") {
      return Colors.green;
    } else if (colorName.toLowerCase() == "blue") {
      return Colors.blue;
    } else if (colorName.toLowerCase() == "yellow") {
      return Colors.yellow;
    } else if (colorName.toLowerCase() == "purple") {
      return Colors.purple;
    } else if (colorName.toLowerCase() == "pink") {
      return Colors.pink;
    }

    return Colors.black; // Default color for unrecognized names
  }
}
