import 'package:flutter/material.dart';

class Fotos extends StatefulWidget {
  const Fotos({super.key});

  @override
  State<Fotos> createState() => _FotosState();
}

class _FotosState extends State<Fotos> {
  String url = 'https://randomuser.me/api/portraits/women/1.jpg';
  bool? valueCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Card y fotos')),
      body: Center(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          color: Colors.teal.shade100,
          elevation: 10,
          child: Container(
            width: 300,
            height: 300,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment(0, 0),
                  child: Container(
                    width: 150,
                    height: 150,
                    child: Image.asset('assets/images/image1.png'),
                  ),
                ),

                Align(
                  alignment: Alignment(-1, -1),
                  child: CircleAvatar(backgroundImage: NetworkImage(url)),
                ),

                //Agregar un checkbox en la parte inferior derecha
                Align(
                  alignment: Alignment(1, 1),
                  child: Checkbox(
                    value: valueCheck,
                    onChanged: (value) {
                      setState(() {
                        // valueCheck = value!;
                        valueCheck = value;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
