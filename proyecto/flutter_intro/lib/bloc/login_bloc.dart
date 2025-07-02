import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_intro/bloc/login.event.dart';
import 'package:flutter_intro/bloc/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState(token: '')) {
    on<LoginSuccessEvent>((event, emit) {
      emit(LoginState(token: state.token));
    });
    //Todos los eventos a crear
    on<LoginErrorEvent>((event, emit) {
      emit(LoginState(token: ''));
    });

    on<LoginSendEvent>((event, emit) {
      print("Success");
      print(event.toString());
    });
  }
}