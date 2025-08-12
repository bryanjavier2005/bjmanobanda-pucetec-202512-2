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

    final inputStyle = InputDecorationTheme(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      filled: true,
      fillColor: Colors.grey[100],
      labelStyle: const TextStyle(fontWeight: FontWeight.w500),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar Evento'),
        backgroundColor: const Color.fromARGB(255, 90, 184, 247),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Theme(
          data: Theme.of(context).copyWith(
            inputDecorationTheme: inputStyle,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                controller: organizadorController,
                decoration: const InputDecoration(labelText: 'Organizador'),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: contactoController,
                decoration: const InputDecoration(labelText: 'Contacto'),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: ciudadController,
                decoration: const InputDecoration(labelText: 'Ciudad'),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: ubicacionController,
                decoration: const InputDecoration(labelText: 'Ubicación Exacta'),
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
              const SizedBox(height: 28),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.save),
                  label: const Text('Guardar Cambios'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: const Color.fromARGB(255, 8, 225, 127),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
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
                      const SnackBar(
                        content: Text('Evento actualizado exitosamente.'),
                        backgroundColor: Color.fromARGB(255, 5, 8, 222),
                      ),
                    );
                    Navigator.pop(context);
                  },
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: TextButton.icon(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  label: const Text(
                    'Eliminar evento',
                    style: TextStyle(color: Colors.red),
                  ),
                  onPressed: () async {
                    final confirmar = await showDialog<bool>(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        title: const Text('¿Eliminar evento?'),
                        content: const Text(
                          '¿Estás seguro de que deseas eliminar este evento?',
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(ctx, false),
                            child: const Text('Cancelar'),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                            ),
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
                        const SnackBar(
                          content: Text('Evento eliminado.'),
                          backgroundColor: Colors.red,
                        ),
                      );
                      Navigator.pop(context);
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
