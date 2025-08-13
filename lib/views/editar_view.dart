import 'package:flutter/material.dart';
import '../services/firestore_service.dart';

class EditarView extends StatefulWidget {
  final String id;
  final Map<String, dynamic> data;

  const EditarView({super.key, required this.id, required this.data});

  @override
  State<EditarView> createState() => _EditarViewState();
}

class _EditarViewState extends State<EditarView> {
  final tituloController = TextEditingController();
  final descripcionController = TextEditingController();
  final organizadorController = TextEditingController();
  final contactoController = TextEditingController();
  final ubicacionExactaController = TextEditingController();
  final fechaController = TextEditingController();
  final horaInicioController = TextEditingController();
  final horaFinController = TextEditingController();

  String? ciudadSeleccionada;

  DateTime? selectedDate;
  TimeOfDay? startTime;
  TimeOfDay? endTime;

  final List<String> ciudades = [
    'Ibarra', 'Esmeraldas', 'Quito', 'Guayaquil', 'Cuenca',
    'Manta', 'Tulcán', 'Loja', 'Machala', 'Otavalo', 'Quevedo'
  ];

  @override
  void initState() {
    super.initState();
    tituloController.text = widget.data['titulo'] ?? '';
    descripcionController.text = widget.data['descripcion'] ?? '';
    organizadorController.text = widget.data['organizador'] ?? '';
    contactoController.text = widget.data['contacto'] ?? '';
    ciudadSeleccionada = widget.data['ciudad'];
    ubicacionExactaController.text = widget.data['ubicacionExacta'] ?? '';
    fechaController.text = widget.data['fecha'] ?? '';
    horaInicioController.text = widget.data['horaInicio'] ?? '';
    horaFinController.text = widget.data['horaFin'] ?? '';
  }

  Future<void> _pickDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        selectedDate = picked;
        fechaController.text = '${picked.day}/${picked.month}/${picked.year}';
      });
    }
  }

  Future<void> _pickTime({required bool inicio}) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: inicio
          ? (startTime ?? TimeOfDay.now())
          : (endTime ?? TimeOfDay.now()),
    );
    if (picked != null) {
      setState(() {
        final formatted = '${picked.hour.toString().padLeft(2, '0')}:${picked.minute.toString().padLeft(2, '0')}';
        if (inicio) {
          startTime = picked;
          horaInicioController.text = formatted;
        } else {
          endTime = picked;
          horaFinController.text = formatted;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final inputStyle = InputDecorationTheme(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      filled: true,
      fillColor: const Color.fromARGB(255, 246, 233, 208),
      labelStyle: const TextStyle(fontWeight: FontWeight.w500),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar Evento'),
        backgroundColor: const Color.fromARGB(255, 0, 255, 170),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Theme(
          data: Theme.of(context).copyWith(inputDecorationTheme: inputStyle),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  'Edita la información del evento',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                  controller: tituloController,
                  decoration:
                      const InputDecoration(labelText: 'Título del Evento')),
              const SizedBox(height: 16),
              TextField(
                  controller: descripcionController,
                  decoration:
                      const InputDecoration(labelText: 'Descripción'),
                  maxLines: 2),
              const SizedBox(height: 16),
              TextField(
                  controller: organizadorController,
                  decoration: const InputDecoration(
                      labelText: 'Nombre del Organizador')),
              const SizedBox(height: 16),
              TextField(
                  controller: contactoController,
                  decoration: const InputDecoration(
                      labelText: 'Contacto (Teléfono)'),
                  keyboardType: TextInputType.phone),
              const SizedBox(height: 24),
              const Text(
                'Ubicación del Evento',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Color.fromARGB(255, 0, 0, 0)),
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField<String>(
                value: ciudadSeleccionada,
                decoration: const InputDecoration(labelText: 'Ciudad'),
                items: ciudades
                    .map((ciudad) => DropdownMenuItem(
                          value: ciudad,
                          child: Text(ciudad),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    ciudadSeleccionada = value;
                  });
                },
              ),
              const SizedBox(height: 16),
              TextField(
                  controller: ubicacionExactaController,
                  decoration: const InputDecoration(
                      labelText:
                          'Ubicación Exacta (calle principal y secundaria/ o referencias)')),
              const SizedBox(height: 24),
              TextField(
                controller: fechaController,
                decoration: const InputDecoration(
                  labelText: 'Fecha del Evento',
                  suffixIcon: Icon(Icons.calendar_today),
                ),
                readOnly: true,
                onTap: _pickDate,
              ),
              const SizedBox(height: 16),
              TextField(
                controller: horaInicioController,
                decoration: const InputDecoration(
                  labelText: 'Hora de Inicio',
                  suffixIcon: Icon(Icons.access_time),
                ),
                readOnly: true,
                onTap: () => _pickTime(inicio: true),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: horaFinController,
                decoration: const InputDecoration(
                  labelText: 'Hora de Fin',
                  suffixIcon: Icon(Icons.access_time),
                ),
                readOnly: true,
                onTap: () => _pickTime(inicio: false),
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.save),
                  label: const Text('Actualizar Evento'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: const Color.fromARGB(255, 0, 255, 68),
                    foregroundColor:
                        const Color.fromARGB(255, 20, 0, 241),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    textStyle: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () async {
                    if (tituloController.text.isEmpty || descripcionController.text.isEmpty || organizadorController.text.isEmpty || contactoController.text.isEmpty ||
                        ciudadSeleccionada == null || ubicacionExactaController.text.isEmpty || fechaController.text.isEmpty || horaInicioController.text.isEmpty ||                                                                 
                        horaFinController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text(
                                'Por favor completa todos los campos.'),
                            backgroundColor: Colors.red),
                      );
                      return;
                    }
                    try {
                      await FirestoreService().actualizarEvento(
                        id: widget.id,
                        titulo: tituloController.text,
                        descripcion: descripcionController.text,
                        organizador: organizadorController.text,
                        contacto: contactoController.text,
                        ciudad: ciudadSeleccionada!,
                        ubicacionExacta: ubicacionExactaController.text,
                        fecha: fechaController.text,
                        horaInicio: horaInicioController.text,
                        horaFin: horaFinController.text,
                      );

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Evento "${tituloController.text}" actualizado exitosamente!.'),
                          backgroundColor: Colors.green,
                        ),
                      );

                      Navigator.pop(context);
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Error al actualizar el evento.'),
                          backgroundColor: Colors.red,
                        ),
                      );
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
