import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:layouts/clase8_Paint/aplicacion/dibujante.dart';
import 'package:layouts/clase8_Paint/aplicacion/riverpod.dart';
import 'package:layouts/clase8_Paint/dominio/modeloNodo.dart';

class InterfazUsuario extends ConsumerWidget {
  const InterfazUsuario({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //Objeto para manipular nuestros estados.
    final containerState = ref.watch(containerProvider);

    return Scaffold(
      // appBar: AppBar(Text(text: "Riverpod -Paint")),
      body: Stack(
        children: [
          CustomPaint(painter: Dibujante(containerState.vNodo)),
          GestureDetector(
            //Capturar el drag o el arrastrar en la pantalla
            onPanUpdate: (desp) {
              ref
                  .read(containerProvider.notifier)
                  .agregarNodo(
                    ModeloNodo(
                      desp.globalPosition.dx,
                      desp.globalPosition.dy,
                      containerState.valorSlider,
                      Colors.green,
                    ),
                  );
            },
          ),
        ],
      ),

      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: [
            Container(
              width: 100,
              height: 50,
              child: Slider(
                min: 1,
                max: 25,
                value: containerState.valorSlider,
                onChanged: (value) {
                  //Actualiza el valor del slider.
                  ref.read(containerProvider.notifier).actualizaSlider(value);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
