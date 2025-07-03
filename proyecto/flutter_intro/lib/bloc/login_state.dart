import 'package:flutter_intro/model/usuario_model.dart';

class LoginState {
    final String? token;
    final UsuarioModel? usuario;
    final String? message;
    final bool? isLoading;
    LoginState({this.token, this.usuario, this.message, this.isLoading});
}
