import 'package:flutter/material.dart';
import 'views/inicio_view.dart';
import 'views/lista_view.dart';
import 'views/crear_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Eventos',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const InicioView(),
        '/lista': (context) => const ListaView(),
        '/crear': (context) => const CrearView(),
      },
    );
  }
}
