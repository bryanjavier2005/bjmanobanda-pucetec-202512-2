import 'package:flutter/material.dart';
import 'package:flutter_intro/services/login.service.dart';
import 'package:flutter_intro/widgets/button_widget.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController usuariocontroller = TextEditingController();
    final TextEditingController contrasenacontroller = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            GlobalFormTextWidget(
              label: "usuario",
              controller: usuariocontroller,
            ),
            const SizedBox(height: 16),
            GlobalFormTextWidget(
              label: "contraseña",
              controller: contrasenacontroller,
            ),
            const SizedBox(height: 16),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              onPressed: () async {
                final resp = await login(usuariocontroller.text, contrasenacontroller.text);
                if (resp){
                  Navigator.pushNamed(context, '/home');
                }                
              },
              child: const Text('ingresar'),
            ),
          ],
        ),
      ),
    );
  }
}
