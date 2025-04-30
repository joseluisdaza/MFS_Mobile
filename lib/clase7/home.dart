import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int f = 0;
  String resultado = '';

  void fibos() async {
    int a = -1, b = 1, n = 50;
    while (n > 0) {
      setState(() {
        f = a + b;
        n--;
        a = b;
        b = f;
        //Wait 1 second
      });
      await pausa(1000);
    }
  }

  Future<void> pausa(tiempo) async {
    await Future.delayed(Duration(milliseconds: tiempo));
  }

  void naturales() async {
    int n = 100;
    int x = 1;
    for (x = 1; x <= n; x++) {
      await pausa(500);
      setState(() {
        resultado = resultado + x.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Fibonacci Asynchronous")),
      body: Stack(
        children: [
          Align(
            alignment: Alignment(1, -1),
            child: Text(resultado, style: TextStyle(fontSize: 50)),
          ),
          Center(child: Text(f.toString(), style: TextStyle(fontSize: 50))),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          naturales();
          fibos();
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}
