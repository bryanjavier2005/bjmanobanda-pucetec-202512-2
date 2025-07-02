import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_intro/bloc/login_bloc.dart';
import 'package:flutter_intro/views/home_view.dart';
import 'package:flutter_intro/views/productos_view.dart';
import 'views/login_view.dart'; 


void main() async{
   await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginBloc()),
        //
        //
        //BlocProvider(create: (context)=> ),
      ],
      child: MaterialApp(
        title: 'Flutter App',
        initialRoute: '/', 
        routes: {
          '/': (context) => const LoginView(),
          '/home': (context) => const HomeView(),
          '/productos': (context) => const ProductosView(),
        },
      ),
    );
  }
}                             