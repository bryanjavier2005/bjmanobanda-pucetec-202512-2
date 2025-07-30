import 'package:flutter/material.dart';

class ListaView extends StatelessWidget {
  const ListaView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Eventos'),
      ),
      body: ListView.builder(
        itemCount: 5, // temporal, luego se reemplaza con datos reales
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.event),
            title: Text('Evento ${index + 1}'),
            subtitle: const Text('Descripción del evento'),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              // acción al tocar el evento (ver detalle, editar, etc.)
            },
          );
        },
      ),
    );
  }
}
