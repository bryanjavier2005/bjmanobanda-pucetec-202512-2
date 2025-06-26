import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_intro/bloc/login.event.dart';
import 'package:flutter_intro/bloc/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState>{
  LoginBloc() :

  super(LoginState(token:'')) {

    on<LoginSendEvent>((event, emit)){
      print("el evento LOGINSENDEVENT");
      print(event.toString());
    };

    on<LoginSuccessEvent>((event, emit){
      print('$event');
      emit(LoginState(token: state.token));//modificar el state se puede usar nas enit
    });

    // todos los eventos a crear 
    on<LoginErrorEvenet>((event, emit){
      emit(LoginState(token: ''));
    });

  }
}
