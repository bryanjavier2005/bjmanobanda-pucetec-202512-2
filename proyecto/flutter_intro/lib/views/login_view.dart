import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_intro/bloc/login.event.dart';
import 'package:flutter_intro/bloc/login_bloc.dart';
import 'package:flutter_intro/services/login.service.dart';
import 'package:flutter_intro/widgets/button_widget.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController usuariocontroller = TextEditingController();
    final TextEditingController contrasenacontroller = TextEditingController();
    //bloc
    final loginBloc = context.read<LoginBloc>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('PAGINA INICIAL LOGIN'),
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
                backgroundColor: const Color.fromARGB(255, 1, 63, 39),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              onPressed: () async {
                final resp = await login(usuariocontroller.text, contrasenacontroller.text);
                loginBloc.add(LoginSendEvent());
                if (resp){
                  Navigator.pushNamed(context, '/home');
                }                
              },
              child: const Text('INGRESAR AL HOME'),
            ),
          ],
        ),
      ),
    );
  }
}
