import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

dynamic login(String usuario, String constrasena) async {
  final url = Uri.parse(dotenv.env['API_URL'] ?? '');
  final response = await http.post(
    url,
    headers: {
      'Content-Type': 'application/json',
    },
    body: jsonEncode(
      {"usuario": usuario, "password": constrasena},
    ),
  );
  print(response.body);
  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    print('Acceso concedido: ${data['message']}');
    //navigator.pushNamed(context, '/homre');

    return true;
  } else {
    //mostrar un snackbar
    print('Usuario o contraseña incorrectos');
    return false;
  }
}
