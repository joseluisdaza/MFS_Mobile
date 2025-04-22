import 'package:flutter/material.dart';
import 'package:layouts/paginas/cuatro.dart';
import 'package:layouts/paginas/dos.dart';
import 'package:layouts/paginas/tres.dart';
import 'package:layouts/paginas/uno.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool flagMenu = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animated rotation')),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.center, //Alignment(0,0)
            child: AnimatedRotation(
              turns: flagMenu ? 1 : 0,
              duration: Duration(milliseconds: 1000),
              child: AnimatedContainer(
                duration: Duration(milliseconds: 1000),
                width: flagMenu ? 300 : 0,
                height: flagMenu ? 300 : 0,
                // color: Colors.amber,
                child: Stack(
                  children: [
                    nodo(Colors.red, 0, -1, "A"),
                    nodo(Colors.green, 1, 0, "B"),
                    nodo(Colors.blue, 0, 1, "C"),
                    nodo(Colors.pink, -1, 0, "D"),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            flagMenu = !flagMenu;
          });
        },
      ),
    );
  }

  Widget nodo(Color color, double x, double y, String msg) {
    return Align(
      alignment: Alignment(x, y), //Alignment(0,0)
      child: GestureDetector(
        onTap: () {
          setState(() {
            print('msg $msg');
            switch (msg) {
              case "A":
                //Llamar a otra pagina, cuando se llama semaneja estructurade pila.
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Uno()),
                );
                break;
              case "B":
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Dos()),
                );

                break;
              case "C":
                // Navigator.pushNamed(context, '/tres');
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Tres()),
                );
                break;
              case "D":
                // Navigator.pushNamed(context, '/cuatro');
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Cuatro()),
                );
                break;
            }
            //Llamar a otra pagina cuando se presione el nodo.
          });
        },

        child: Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            gradient: RadialGradient(colors: [Colors.white, color]),
            // shape: BoxShape.circle,
            borderRadius: BorderRadius.circular(35),
          ),
          child: Center(
            child: Text(
              msg,
              style: TextStyle(color: Colors.black, fontSize: 45),
            ),
          ),
        ),
      ),
    );
  }
}
