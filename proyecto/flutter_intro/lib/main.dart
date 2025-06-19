import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_intro/views/home_view.dart';
import 'views/login_view.dart'; 


void main() async{
   await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      initialRoute: '/', 
      routes: {
        '/': (context) => const LoginView(),
        '/home': (context) => const HomeView(),
      },
    );
  }
}                             