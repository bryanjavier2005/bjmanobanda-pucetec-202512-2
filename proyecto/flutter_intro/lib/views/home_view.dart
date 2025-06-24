import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome AL HOME!'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Welcome AL HOME!'),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
              backgroundColor: Colors.teal,
              foregroundColor: Colors.white,

              ),
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