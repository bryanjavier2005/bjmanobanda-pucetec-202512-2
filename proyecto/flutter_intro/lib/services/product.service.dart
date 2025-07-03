import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import '../model/products_model.dart';

Future<List<ProductsModel>> getAllProducts() async {
  final baseUrl = dotenv.env['API_BASE'] ?? 'https://pucei.edu.ec:9118/api/v1';
  final url = Uri.parse('$baseUrl/products');

  final response = await http.get(
    url,
    headers: {'Content-Type': 'application/json'},
  );

  if (response.statusCode == 200) {
    final List<dynamic> data = json.decode(response.body);
    return data.map((json) => ProductsModel.fromJson(json)).toList();
  } else {
    throw Exception('Error al cargar los productos: ${response.body}');
  }
}


