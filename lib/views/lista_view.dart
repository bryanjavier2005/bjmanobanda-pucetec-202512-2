import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ListaView extends StatelessWidget {
  const ListaView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Eventos'),
        backgroundColor: const Color.fromARGB(255, 151, 216, 249),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('eventos')
            .orderBy('creado_en', descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text('Error al cargar los eventos.'));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          final eventos = snapshot.data!.docs;

          if (eventos.isEmpty) {
            return const Center(child: Text('No hay eventos aún.'));
          }

          return ListView.builder(
            itemCount: eventos.length,
            itemBuilder: (context, index) {
              final evento = eventos[index];
              final data = evento.data() as Map<String, dynamic>;

              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                color: Colors.blue[50],
                child: ExpansionTile(
                  title: Text(
                    data['titulo'] ?? 'Sin título',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(data['descripcion'] ?? ''),
                  children: [
                    if (data['organizador'] != null)
                      ListTile(title: Text('Organizador: ${data['organizador']}')),
                    if (data['contacto'] != null)
                      ListTile(title: Text('Contacto: ${data['contacto']}')),
                    if (data['ciudad'] != null)
                      ListTile(title: Text('Ciudad: ${data['ciudad']}')),
                    if (data['ubicacion'] != null)
                      ListTile(title: Text('Ubicación Exacta: ${data['ubicacion']}')),
                    ListTile(title: Text('Hora de Inicio: ${data['hora_inicio']}')),
                    ListTile(title: Text('Hora de Fin: ${data['hora_fin']}')),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: ElevatedButton.icon(
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            '/editar',
                            arguments: {
                              'id': evento.id,
                              'data': data,
                            },
                          );
                        },
                        icon: const Icon(Icons.edit),
                        label: const Text('Editar'),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
