import 'package:flutter/material.dart';

class MenuDraw extends StatefulWidget {
  const MenuDraw({super.key});

  @override
  State<MenuDraw> createState() => _MenuDrawState();
}

class _MenuDrawState extends State<MenuDraw> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Menu Principal - Drawer")),

      drawer: Drawer(
        child: Container(
          color: Colors.purpleAccent,
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                accountName: Text("Empresa"),
                accountEmail: Text("empresa@unodos.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.green,
                  child: Text("JTA"),
                ),
              ),

              ListTile(
                leading: Icon(Icons.person),
                title: Text(
                  'Compras',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
                onTap: () {
                  Navigator.pop(context); // Cierra el menú
                  Navigator.pushNamed(
                    context,
                    "/compras",
                  ); // Navega a la página de compras
                },
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text('Ventas'),
                style: TextStyle(color: Colors.white),
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text('Gerente'),
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
