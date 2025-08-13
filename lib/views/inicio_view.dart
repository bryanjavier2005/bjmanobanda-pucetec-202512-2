import 'package:flutter/material.dart';

class InicioView extends StatelessWidget {
  const InicioView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bienvenido a AppEventos'),backgroundColor: const Color.fromARGB(255, 3, 255, 171), 
      ),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [  
            const Icon(
              Icons.event,
              size: 100,
              color: Color.fromARGB(255, 0, 17, 254),
            ),
            const Text(
              '¿Quieres organizar un evento?',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            const Text(
              'Crea y publica tu evento en segundos, y llega a más personas fácilmente.',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/crear');
              },
              icon: Icon(Icons.create_new_folder),
              label: Text('Crear Evento'),
              style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 14, 255, 1),
              foregroundColor: const Color.fromARGB(255, 20, 0, 241),
              ),
            ),
            const SizedBox(height: 40),
            const Text(
              '¿Buscas eventos cerca de ti?',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            const Text(
              'Explora eventos, encuentra actividades y participa.',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/lista');
              },
              icon: Icon(Icons.document_scanner),
              label: Text('Ver Eventos Disponibles'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 14, 255, 1),
                foregroundColor: const Color.fromARGB(255, 9, 1, 255),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
