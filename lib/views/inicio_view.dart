import 'package:flutter/material.dart';

class InicioView extends StatelessWidget {
  const InicioView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Eventos App')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [  
            Image(
              image: NetworkImage('https://www.totalisimo.com/wp-content/uploads/2018/06/volkswagen-diana-krall-3.jpg')),
            const Icon(
              Icons.event,
              size: 100,
              color: Color.fromARGB(255, 247, 4, 0),
            ),
            const Text(
              'Bienvenido a la App de Eventos',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/lista');
              },
              child: const Text('Ver Eventos disponibles'),
            ),
            IconButton(
              onPressed:() {
                Navigator.pushNamed(context, '/crear');
              },
              icon: const Icon(Icons.create_new_folder),
              iconSize: 50,
            ),

            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/crear');
              },
              child: const Text('Crear Evento'),
            ),
          ],
        ),
      ),
    );
  }
}
