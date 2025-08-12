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

    final inputStyle = InputDecorationTheme(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      filled: true,
      fillColor: Colors.grey[100],
      labelStyle: const TextStyle(fontWeight: FontWeight.w500),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('¿Necesitas Crear un Evento?'),
        backgroundColor: const Color.fromARGB(255, 151, 216, 249),
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
              const Center(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Text(
                    'Ingresa toda la Información necesaria',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 58, 75, 183),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
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
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Color.fromARGB(255, 50, 45, 198),
                ),
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
                  labelText: 'Ubicación Exacta (calle principal y secundaria)',
                ),
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
              const SizedBox(height: 30),
              Center(
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.save),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      backgroundColor: const Color.fromARGB(255, 4, 194, 105),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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
                          const SnackBar(
                            content: Text('Por favor completa todos los campos.'),
                          ),
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
                          SnackBar(
                            content: Text('Evento "$titulo" guardado exitosamente!'),
                            backgroundColor: Colors.green,
                          ),
                        );

                        Navigator.pop(context);
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Error al guardar el evento.'),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    },
                    label: const Text('Guardar Evento'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
