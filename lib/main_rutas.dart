import 'package:flutter/material.dart';
import 'package:layouts/Clase6Rutas/data.dart';
import 'package:layouts/Clase6Rutas/paginas/compras.dart';
import 'package:layouts/Clase6Rutas/paginas/director.dart';
import 'package:layouts/Clase6Rutas/paginas/gerente.dart';
import 'package:layouts/Clase6Rutas/paginas/rutas.dart';
import 'package:layouts/Clase6Rutas/paginas/secretaria.dart';
import 'package:layouts/Clase6Rutas/paginas/ventas.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});
  String usuarioActivo = 'gerente';

  @override
  Widget build(BuildContext context) {
    // return const MaterialApp(home: Home());

    // return const MaterialApp(home: Fotos());
    // return const MaterialApp(home: Livi());
    // return const MaterialApp(home: Livicustom());
    // return const MaterialApp(home: LiviBuilder());
    // return const MaterialApp(home: Grid1());
    // return const MaterialApp(home: Grid2());
    return MaterialApp(
      initialRoute: '/',
      //Para rutas estaticas
      routes: {
        // '/': (context) => const Rutas(),
        '/': (context) => Rutas(),
        '/ventas': (context) => const Ventas(),
        '/compras': (context) => const Compras(),
        // '/director': (context) => Director(argumento: "DIRECTOR: Samuelito"),
        // '/gerente': (context) =>  Gerente(argumento: "GERENTE: Paolita",),
        // '/secretaria': (context) =>  Secretaria(argumento: "Secretaria: Lunita",),
      },

      //Para rutas dinamicas
      onGenerateRoute: (settings) {
        if (settings.name == '/usuarios') {
          final MisArgumentos args =
              settings.arguments.toString() as MisArgumentos;

          if (usuarioActivo == 'director') {
            return MaterialPageRoute(
              builder: (context) => Director(argumento: args.argumento),
            );
          } else if (usuarioActivo == 'gerente') {
            return MaterialPageRoute(
              builder: (context) => Gerente(argumento: args.argumento),
            );
          } else if (usuarioActivo == 'secretaria') {
            return MaterialPageRoute(
              builder: (context) => Secretaria(argumento: args.argumento),
            );
          }
        }
        return null;
      },
    );
  }
}
