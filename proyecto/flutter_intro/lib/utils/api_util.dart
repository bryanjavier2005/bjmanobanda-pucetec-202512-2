import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class ApiUtil {
  static String baseUrl = dotenv.env["API_BASE"] ?? "";

  static final http.Client _client = http.Client();

  static Uri buildUri(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
  }) {
    return Uri.parse(
      '$baseUrl$endpoint',
    ).replace(queryParameters: queryParameters);
  }

  static Future<http.Response> get(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  }) {
    headers ??= {"Content-Type": "application/json"};
    return _client.get(
      buildUri(endpoint, queryParameters: queryParameters),
      headers: headers,
    );
  }

  static Future<http.Response> post(
    String endpoint, {
    Object? body,
    Map<String, String>? headers,
  }) {
    headers ??= {"Content-Type": "application/json"};
    return _client.post(
      buildUri(endpoint),
      headers: headers,
      body: jsonEncode(body),
    );
  }

  static Future<http.Response> patch(
    String endpoint, {
    Object? body,
    Map<String, String>? headers,
  }) {
    return _client.patch(buildUri(endpoint), headers: headers, body: body);
  }

  static Future<http.Response> put(
    String endpoint, {
    Object? body,
    Map<String, String>? headers,
  }) {
    return _client.put(buildUri(endpoint), headers: headers, body: body);
  }

  static Future<http.Response> delete(
    String endpoint, {
    Map<String, String>? headers,
  }) {
    return _client.delete(buildUri(endpoint), headers: headers);
  }
}
