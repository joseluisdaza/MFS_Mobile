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
  List<ModeloLinea> vLineas = [];
  ModeloNodo? nodoInicio;
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
                if (modo != 4) {
                  nodoInicio = null;
                }

                if (modo == 1) {
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
                              setState(() {
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
                              });

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
                } else if (modo == 4) {
                  int indice = estaEnNodo(
                    desp.localPosition.dx,
                    desp.localPosition.dy,
                  );

                  if (indice >= 0) {
                    if (nodoInicio == null) {
                      nodoInicio = vNodo[indice];
                    } else {
                      ModeloNodo nodoFin = vNodo[indice];

                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          TextEditingController valorController =
                              TextEditingController();
                          return AlertDialog(
                            title: Text("Valor/Peso"),
                            content: TextField(
                              controller: valorController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                labelText: "Valor/Peso de la arista",
                              ),
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
                                  double valor =
                                      double.tryParse(valorController.text) ??
                                      0.0;
                                  vLineas.add(
                                    ModeloLinea(
                                      nodoInicio!,
                                      nodoFin,
                                      Colors.grey.shade500,
                                      valor,
                                    ),
                                  );

                                  nodoInicio = null;
                                  Navigator.of(context).pop();
                                },
                                child: Text("Crear"),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  }
                }
              });
            },

            onPanUpdate: (desp) {
              if (modo != 4) {
                nodoInicio = null;
              }

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
            child: CustomPaint(
              painter: Nodo(vNodo, vLineas),
              child: Container(),
            ),
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

            SizedBox(width: 5),
            CircleAvatar(
              backgroundColor:
                  (modo == 4) ? Colors.green.shade900 : Colors.red.shade900,
              child: IconButton(
                onPressed: () {
                  setState(() {
                    modo = 4;
                  });
                },
                icon: Icon(Icons.linear_scale, color: Colors.white),
              ),
            ),

            SizedBox(width: 5),
            CircleAvatar(
              backgroundColor: Colors.blue,
              child: IconButton(
                onPressed: () {
                  findShortestPath(context);
                },
                icon: Icon(Icons.route, color: Colors.white),
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

  //Solution for the problem of traveler
  Map<ModeloNodo, List<MapEntry<ModeloNodo, double>>> buildGraph() {
    Map<ModeloNodo, List<MapEntry<ModeloNodo, double>>> graph = {};

    for (var nodo in vNodo) {
      graph[nodo] = [];
    }

    for (var linea in vLineas) {
      graph[linea.inicio]?.add(MapEntry(linea.fin, linea.valor));
      graph[linea.fin]?.add(
        MapEntry(linea.inicio, linea.valor),
      ); // Undirected graph
    }

    return graph;
  }

  List<ModeloNodo> dijkstra(
    ModeloNodo start,
    ModeloNodo end,
    Map<ModeloNodo, List<MapEntry<ModeloNodo, double>>> graph,
  ) {
    Map<ModeloNodo, double> distances = {};
    Map<ModeloNodo, ModeloNodo?> previous = {};
    Set<ModeloNodo> visited = {};
    // PriorityQueue<MapEntry<ModeloNodo, double>> queue = PriorityQueue(
    //   (a, b) => a.value.compareTo(b.value),
    // );

    List<MapEntry<ModeloNodo, double>> queue = [];

    // Add an element to the queue
    queue.add(MapEntry(start, 0));

    // Sort the queue based on the value
    queue.sort((a, b) => a.value.compareTo(b.value));

    // Initialize distances
    for (var nodo in graph.keys) {
      distances[nodo] = double.infinity;
      previous[nodo] = null;
    }
    distances[start] = 0;

    queue.add(MapEntry(start, 0));

    while (queue.isNotEmpty) {
      // Remove the first element (lowest value)
      // var current = queue.removeFirst().key;
      var current = queue.removeAt(0).key;

      if (current == end) break; // Stop if we reach the destination

      if (visited.contains(current)) continue;
      visited.add(current);

      for (var neighbor in graph[current]!) {
        var neighborNode = neighbor.key;
        var weight = neighbor.value;

        if (visited.contains(neighborNode)) continue;

        double newDistance = distances[current]! + weight;
        if (newDistance < distances[neighborNode]!) {
          distances[neighborNode] = newDistance;
          previous[neighborNode] = current;
          queue.add(MapEntry(neighborNode, newDistance));
        }
      }
    }

    // Reconstruct the shortest path
    List<ModeloNodo> path = [];
    ModeloNodo? currentNode = end;
    while (currentNode != null) {
      path.insert(0, currentNode);
      currentNode = previous[currentNode];
    }

    return path;
  }

  void findShortestPath(BuildContext context) {
    ModeloNodo? startNode;
    ModeloNodo? endNode;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Encuentra la ruta mas corta"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DropdownButton<ModeloNodo>(
                value: startNode,
                hint: Text("Nodo inicio"),
                items:
                    vNodo.map((nodo) {
                      return DropdownMenuItem(
                        value: nodo,
                        child: Text(nodo.nombre),
                      );
                    }).toList(),
                onChanged: (value) {
                  setState(() {
                    startNode = value;
                  });
                },
              ),
              DropdownButton<ModeloNodo>(
                value: endNode,
                hint: Text("Nodo Final"),
                items:
                    vNodo.map((nodo) {
                      return DropdownMenuItem(
                        value: nodo,
                        child: Text(nodo.nombre),
                      );
                    }).toList(),
                onChanged: (value) {
                  setState(() {
                    endNode = value;
                  });
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                if (startNode != null && endNode != null) {
                  var graph = buildGraph();
                  var path = dijkstra(startNode!, endNode!, graph);

                  var distancia = 0.0;
                  for (var i = 0; i < path.length - 1; i++) {
                    var nodoActual = path[i];
                    var siguienteNodo = path[i + 1];

                    // Find the weight of the edge between nodoActual and siguienteNodo
                    var arista = vLineas.firstWhere(
                      (linea) =>
                          (linea.inicio == nodoActual &&
                              linea.fin == siguienteNodo) ||
                          (linea.inicio == siguienteNodo &&
                              linea.fin == nodoActual),
                      orElse:
                          () => ModeloLinea(
                            nodoActual,
                            siguienteNodo,
                            Colors.black,
                            0.0,
                          ),
                    );
                    distancia += arista.valor;
                  }

                  String mensaje =
                      '${path.map((nodo) => nodo.nombre).join(" -> ")} \n distancia: $distancia';

                  Navigator.of(context).pop();

                  // Display the result
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text("Camino mas corto"),
                        content: Text(
                          // path.map((nodo) => nodo.nombre).join(" -> "),
                          mensaje,
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text("OK"),
                          ),
                        ],
                      );
                    },
                  );
                }
                // Navigator.of(context).pop();
              },
              child: Text("Find"),
            ),
          ],
        );
      },
    );
  }
}
