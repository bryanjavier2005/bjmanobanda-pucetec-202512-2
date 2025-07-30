// lib/views/crear_view.dart

import 'package:flutter/material.dart';

class CrearView extends StatelessWidget {
  const CrearView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController tituloController = TextEditingController();
    final TextEditingController descripcionController = TextEditingController();
    final TextEditingController ubicacionController = TextEditingController();
    final TextEditingController horaInicioController = TextEditingController();
    final TextEditingController horaFinController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Crear Evento'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: tituloController,
              decoration: const InputDecoration(labelText: 'Título del Evento'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: descripcionController,
              decoration: const InputDecoration(labelText: 'Descripción'),
              maxLines: 2,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: ubicacionController,
              decoration: const InputDecoration(labelText: 'Ubicación del Evento'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: horaInicioController,
              decoration: const InputDecoration(labelText: 'Hora de Inicio'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: horaFinController,
              decoration: const InputDecoration(labelText: 'Hora de Fin'),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // temporal
                final titulo = tituloController.text;
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Evento "$titulo" creado (visual)')),
                );
                Navigator.pop(context);
              },
              child: const Text('Guardar Evento'),
            ),
          ],
        ),
      ),
    );
  }
}
