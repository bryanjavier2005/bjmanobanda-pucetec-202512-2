import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PESTAÑA DE HOME'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Welcome AL HOME!'),
            ElevatedButton(
              onPressed: (){
              Navigator.pushReplacementNamed(context, '/productos');
            },
              child: const Text('Ir a PRODUCTOS'),
            )
          ],
        ),
      ),
    );
  }
}