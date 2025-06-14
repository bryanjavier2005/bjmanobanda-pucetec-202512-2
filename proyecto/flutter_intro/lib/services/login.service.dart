import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

dynamic login(String username, String password) async {
  final url = Uri.parse(dotenv.env['API_URL'] ?? '');
  final response = await http.post(
    url,
    headers: {
      'Content-Type': 'application/json',
      'Authorization':
          'Basic ${base64Encode(utf8.encode(dotenv.env['API_AUTH'] ?? ''))}',
    },
    body: jsonEncode(
      {"usuario": username, "password": password},
    ),
  );
  print(response.body);
  if (response.statusCode == 200) {
    print('exito');
  } else {
    //mostrar un snackbar
    print('error');
  }
}
