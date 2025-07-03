abstract class LoginEvent {}

class LoginSubmitEvent extends LoginEvent {
  final String usuario;
  final String password;

  LoginSubmitEvent({required this.usuario, required this.password});
}
