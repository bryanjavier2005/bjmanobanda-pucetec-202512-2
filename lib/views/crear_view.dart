import 'package:flutter/material.dart';
import '../services/firestore_service.dart';

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
              decoration: const InputDecoration(labelText: 'Hora de Inicio (Ej: 14:00)'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: horaFinController,
              decoration: const InputDecoration(labelText: 'Hora de Fin (Ej: 16:30)'),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () async {
                final titulo = tituloController.text;
                final descripcion = descripcionController.text;
                final ubicacion = ubicacionController.text;
                final horaInicio = horaInicioController.text;
                final horaFin = horaFinController.text;

                if (titulo.isEmpty || descripcion.isEmpty || ubicacion.isEmpty || horaInicio.isEmpty || horaFin.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Por favor completa todos los campos.')),
                  );
                  return;
                }

                try {
                  await FirestoreService().agregarEvento(
                    titulo: titulo,
                    descripcion: descripcion,
                    ubicacion: ubicacion,
                    horaInicio: horaInicio,
                    horaFin: horaFin,
                  );

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Evento "$titulo" guardado exitosamente.')),
                  );

                  Navigator.pop(context);
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Error al guardar el evento.')),
                  );
                }
              },
              child: const Text('Guardar Evento'),
            ),
          ],
        ),
      ),
    );
  }
}
