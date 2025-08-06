import 'package:flutter/material.dart';
import '../services/firestore_service.dart';

class CrearView extends StatelessWidget {
  const CrearView({super.key});

  @override
  Widget build(BuildContext context) {
    final tituloController = TextEditingController();
    final descripcionController = TextEditingController();
    final organizadorController = TextEditingController();
    final contactoController = TextEditingController();
    final ciudadController = TextEditingController();
    final ubicacionExactaController = TextEditingController();
    final horaInicioController = TextEditingController();
    final horaFinController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Necesitas Crear Algun Evento?'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Ingresa toda la Informacion necesaria',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
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
              controller: organizadorController,
              decoration: const InputDecoration(labelText: 'Nombre del Organizador'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: contactoController,
              decoration: const InputDecoration(labelText: 'Contacto (Teléfono)'),
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 24),
            const Text(
              'Ubicación del Evento',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: ciudadController,
              decoration: const InputDecoration(labelText: 'Ciudad'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: ubicacionExactaController,
              decoration: const InputDecoration(
                  labelText: 'Ubicación Exacta (calle principal y secundaria)'),
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
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  final titulo = tituloController.text;
                  final descripcion = descripcionController.text;
                  final organizador = organizadorController.text;
                  final contacto = contactoController.text;
                  final ciudad = ciudadController.text;
                  final ubicacionExacta = ubicacionExactaController.text;
                  final horaInicio = horaInicioController.text;
                  final horaFin = horaFinController.text;

                  if (titulo.isEmpty ||
                      descripcion.isEmpty ||
                      organizador.isEmpty ||
                      contacto.isEmpty ||
                      ciudad.isEmpty ||
                      ubicacionExacta.isEmpty ||
                      horaInicio.isEmpty ||
                      horaFin.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Por favor completa todos los campos.')),
                    );
                    return;
                  }

                  try {
                    await FirestoreService().agregarEvento(
                      titulo: titulo,
                      descripcion: descripcion,
                      organizador: organizador,
                      contacto: contacto,
                      ciudad: ciudad,
                      ubicacionExacta: ubicacionExacta,
                      horaInicio: horaInicio,
                      horaFin: horaFin,
                    );

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Evento "$titulo" guardado exitosamente!.')),
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
            ),
          ],
        ),
      ),
    );
  }
}
