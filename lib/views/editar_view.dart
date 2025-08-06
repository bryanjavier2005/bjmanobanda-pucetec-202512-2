import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EditarView extends StatelessWidget {
  const EditarView({super.key});

  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    final String eventoId = arguments['id'];
    final Map<String, dynamic> data = arguments['data'];

    final tituloController = TextEditingController(text: data['titulo']);
    final descripcionController = TextEditingController(text: data['descripcion']);
    final organizadorController = TextEditingController(text: data['organizador']);
    final contactoController = TextEditingController(text: data['contacto']);
    final ciudadController = TextEditingController(text: data['ciudad']);
    final ubicacionController = TextEditingController(text: data['ubicacion']);
    final horaInicioController = TextEditingController(text: data['hora_inicio']);
    final horaFinController = TextEditingController(text: data['hora_fin']);

    return Scaffold(
      appBar: AppBar(title: const Text('Editar Evento')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: tituloController,
              decoration: const InputDecoration(labelText: 'Título del Evento'),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: descripcionController,
              decoration: const InputDecoration(labelText: 'Descripción'),
              maxLines: 2,
            ),
            const SizedBox(height: 12),
            TextField(
              controller: organizadorController,
              decoration: const InputDecoration(labelText: 'Organizador'),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: contactoController,
              decoration: const InputDecoration(labelText: 'Contacto'),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: ciudadController,
              decoration: const InputDecoration(labelText: 'Ciudad'),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: ubicacionController,
              decoration: const InputDecoration(labelText: 'Ubicación Exacta'),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: horaInicioController,
              decoration: const InputDecoration(labelText: 'Hora de Inicio'),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: horaFinController,
              decoration: const InputDecoration(labelText: 'Hora de Fin'),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () async {
                await FirebaseFirestore.instance
                    .collection('eventos')
                    .doc(eventoId)
                    .update({
                  'titulo': tituloController.text,
                  'descripcion': descripcionController.text,
                  'organizador': organizadorController.text,
                  'contacto': contactoController.text,
                  'ciudad': ciudadController.text,
                  'ubicacion': ubicacionController.text,
                  'hora_inicio': horaInicioController.text,
                  'hora_fin': horaFinController.text,
                });

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Evento actualizado.')),
                );
                Navigator.pop(context);
              },
              child: const Text('Guardar cambios'),
            ),
            const SizedBox(height: 12),
            TextButton.icon(
              icon: const Icon(Icons.delete, color: Colors.red),
              label: const Text('Eliminar evento', style: TextStyle(color: Colors.red)),
              onPressed: () async {
                final confirmar = await showDialog<bool>(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: const Text('Confirmar eliminación'),
                    content: const Text('¿Estás seguro de que deseas eliminar este evento?'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(ctx, false),
                        child: const Text('Cancelar'),
                      ),
                      ElevatedButton(
                        onPressed: () => Navigator.pop(ctx, true),
                        child: const Text('Eliminar'),
                      ),
                    ],
                  ),
                );

                if (confirmar == true) {
                  await FirebaseFirestore.instance
                      .collection('eventos')
                      .doc(eventoId)
                      .delete();

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Evento eliminado.')),
                  );
                  Navigator.pop(context);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
