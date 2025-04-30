import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:layouts/Clase7_Patrones/controller.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final ContadorController controller = Get.put(ContadorController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GetX Patron"),
        actions: [
          IconButton(
            onPressed: () {
              controller.setCounter();
            },
            icon: Icon(Icons.clear),
          ),
        ],
      ),
      body: Obx(() => Center(child: Text("Contador: ${controller.counter}"))),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.incrementar();
        },
      ),
    );
  }
}
