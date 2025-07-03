import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_intro/bloc/login.event.dart';
import 'package:flutter_intro/bloc/login_bloc.dart';
import 'package:flutter_intro/bloc/login_state.dart';
import 'package:flutter_intro/widgets/button_widget.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController usuariocontroller = TextEditingController();
    final TextEditingController contrasenacontroller = TextEditingController();
    final loginBloc = context.read<LoginBloc>();

    void mostrarSnackBar(String mensaje) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(mensaje), duration: const Duration(seconds: 2)),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text('PAGINA INICIAL LOGIN')),
      body: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state.usuario != null && state.token != null) {
            Navigator.pushReplacementNamed(context, '/home');
          }else if (state.message !=null){
            mostrarSnackBar(state.message!);
          }
        },
        child: Padding(
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
              BlocBuilder<LoginBloc, LoginState>(
                builder: (context, state) {
                  return Container(
                    child: state.isLoading == true
                      ? const Center(child: CircularProgressIndicator())
                      : ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(255, 1, 63, 39),
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                          ),
                          onPressed: () async {
                            if (usuariocontroller.text.isEmpty ||
                                contrasenacontroller.text.isEmpty) {
                              mostrarSnackBar("Por favor completa todos los campos");
                              return;
                            }

                            loginBloc.add(
                              LoginSubmitEvent(
                                usuario: usuariocontroller.text,
                                password: contrasenacontroller.text,
                              ),
                            );
                          },
                          child: const Text('INGRESAR AL HOME'),
                        ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
