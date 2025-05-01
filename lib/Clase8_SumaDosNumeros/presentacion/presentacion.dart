import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:layouts/Clase8_SumaDosNumeros/applicacion/riverpod.dart';

class Presentacion extends ConsumerWidget {
  Presentacion({super.key});

  TextEditingController tecN1 = TextEditingController();
  TextEditingController tecN2 = TextEditingController();

  //WidgetRef es el medio de acceso.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //variable quenospermite acceder a los datos.
    //Este hace referencia a la variable creada en el archivo aplicacion/riverpod.dart
    final containerState = ref.watch(containerProvider);

    return Scaffold(
      appBar: AppBar(title: Text("RiverPod - Clean Architecture")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          //Para que seamas rico usar un formulario para hacer validaciones.
          children: [
            TextField(
              controller: tecN1,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Ingresa el primer numero',
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 20),

            TextField(
              controller: tecN2,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Ingresa el segundo numero',
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    ref
                        .read(containerProvider.notifier)
                        .sumar(
                          double.tryParse(tecN1.text),
                          double.tryParse(tecN2.text),
                        );
                  },
                  child: Text('Sumar'),
                ),

                SizedBox(width: 20),

                ElevatedButton(
                  onPressed: () {
                    ref.read(containerProvider.notifier).limpiar();
                    tecN1.text = "";
                    tecN2.text = "";
                  },
                  child: Text('Nuevo'),
                ),
              ],
            ),

            SizedBox(height: 20),

            //Para no mostrar el componente.
            (containerState.flagResultado)
                ? Text(
                  containerState.resultado.toString(),
                  style: TextStyle(fontSize: 50, color: Colors.blue),
                )
                : SizedBox(),
          ],
        ),
      ),
    );
  }
}
