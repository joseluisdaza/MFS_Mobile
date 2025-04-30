import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _tecNombre = TextEditingController();
  TextEditingController _tecCosto = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Formularios')),
      body: Column(
        children: [
          Form(
            key: _formKey,
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  //Campo nombre con su validacion
                  TextFormField(
                    controller: _tecNombre,
                    decoration: InputDecoration(
                      labelText: 'Nombre',
                      hintText: 'Ingrese su nombre',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingrese su nombre';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _tecCosto,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Costo',
                      hintText: 'Ingrese el costo',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingrese el costo';
                      }

                      if (double.tryParse(value) == null) {
                        return 'Por favor ingrese un número válido';
                      }

                      return null;
                    },
                  ),

                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Si el formulario es válido, muestra un snackbar en la parte inferior
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Nombre: ${_tecNombre.text}')),
                        );
                      } else {
                        // Si el formulario no es válido, muestra un snackbar en la parte inferior
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Error en el formulario')),
                        );
                      }
                    },
                    child: Text("Grabar"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
